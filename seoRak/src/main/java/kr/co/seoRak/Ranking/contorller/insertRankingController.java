package kr.co.seoRak.Ranking.contorller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import kr.co.seoRak.common.db.MyAppSqlConfig;
import kr.co.seoRak.repository.domain.RankingBookInfo;
import kr.co.seoRak.repository.domain.RankingPointInfo;
import kr.co.seoRak.repository.domain.RankingRankingInfo;
import kr.co.seoRak.repository.mapper.LoginMapper;
import kr.co.seoRak.repository.mapper.RankingMapper;

@WebServlet("/seorak/BestSellerRanking.do")
public class insertRankingController extends HttpServlet{

	RankingMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(RankingMapper.class);
	RankingRankingInfo best = new RankingRankingInfo();
	RankingBookInfo rank = new RankingBookInfo();
	int rankingNo=0;
	
	@SuppressWarnings("static-access")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		

		request.setCharacterEncoding("utf-8");//한글처리
		Calendar cal = Calendar.getInstance();
		
		try {
			
			
			
			SimpleDateFormat dd = new SimpleDateFormat();
			
			
			if(cal.get(cal.DAY_OF_WEEK)!=cal.SUNDAY) {//10월 4일...네이버 베스트셀러상 데이터는 9월 5째주로 뿌려지고있음
				
					response.sendRedirect(request.getContextPath() + "/jsp/BestSeller.jsp");
			
			}else{
				
				Date checkingDate =new Date();
				Date dbDate = mapper.WeekChecking();
				SimpleDateFormat weekCheckingg=new SimpleDateFormat("yyyy-MM-ww");
				SimpleDateFormat dbChecking = new SimpleDateFormat("yyyy-MM-ww");//현재 시간과 트롤링된 최신 데이터를 주로 변환하여 비교

				if(dbChecking.format(dbDate) != weekCheckingg.format(checkingDate)) {//크롤링 최신 데이타의 시간과 현재의 주가 다를 경우 크롤링 시작	
					Date date = new Date();
					Document doc = Jsoup.connect
							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"yes24"+"&cate="+"total"+"&bestWeek="+cal.get(cal.YEAR)+"-"+(date.getMonth()+1)+"-"+cal.get(cal.DAY_OF_WEEK_IN_MONTH)+"&indexCount=1&type=list").get();
					Elements list = doc.select(".basic >li");
					for(Element e : list) {
						Elements bidList=e.select(" dl > dt");
						String bidListsDetail = bidList.html().substring(9, 80);
						int num = bidListsDetail.indexOf("\"");
						String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));					
						Document isbn= Jsoup.connect(bResult).get();
						Elements dIsbn = isbn.select(".spot");
						for(Element c: dIsbn) {						
							Elements Risbn = c.select("div");
							String result = Risbn.text();
							if(result.contains("|ISBN ")==true) {//크롤링된 데이터충 |ISBN으로 시작하는 부분을 기준으로 ISBN의 자릿수만큼 잘랐음
								int isbn1=result.indexOf("|ISBN");
								String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975	

								//그렇게 뽑힌 IBSN 값을 가지고 알라딘 API의 검색 서비스를 이용 해당 ISBN으로 검색하여 나옥 책의 정보를 추출 그후 디비에 저장
								Document kdoc = Jsoup.connect("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttba12345555582050001&ItemIdType=ISBN13&ItemId="+result2).get();	
								Elements AlaTitle =kdoc.select("object");
								for(Element t : AlaTitle) {
									Elements alaTitleResult = t.select("item>title");
									String alaTitle =alaTitleResult.html().toString();
									Elements alaAuthor = t.select("item>author");
									String alaAuthorTest = alaAuthor.html().toString();
									Elements alaImg = t.select("item >cover");
									String alaImgTest = alaImg.html().toString();//이미지 소스
									Elements publisher= t.select("item >publisher");
									String publisherTest = publisher.html().toString();
									Elements  alaIsbn = t.select("item >isbn13");
									String alaIsbnTest = alaIsbn.html().toString();
									Elements pubDate = t.select("item>pubDate");
									String publeDate = pubDate.html();
									Date dates = new Date(publeDate);
									if(mapper.selectIsbn(alaIsbnTest) ==null)  {//해당 ISBN으로 디비를 검색...해당하는 값이 null일경우 디비에 저장
										rank.setBookPubDate(dates);
										rank.setBookTitle(alaTitle);
										rank.setBookAuthor(alaAuthorTest);
										rank.setBookImg(alaImgTest);
										rank.setBookPublisher(publisherTest);
										rank.setIsbn(alaIsbnTest);						
										mapper.insertRanking(rank);
									}
								}
							}
						}//for disbn
					}

					for(int k = 1 ; k <= 6 ; k++) {
						switch(k) {
						case 1: 

							Document kyoboRanking = Jsoup.connect
							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"kyobo"+"&cate="+"total"+"&bestWeek="+cal.get(cal.YEAR)+"-"+(date.getMonth()+1)+"-"+cal.get(cal.DAY_OF_WEEK_IN_MONTH)+"&indexCount=1&type=list").get();
							Elements klist =kyoboRanking.select(".basic >li");

							for(Element  e:klist) {
								Elements bidList=e.select(" dl > dt");
								String bidListsDetail = bidList.html().substring(9, 80);
								int num = bidListsDetail.indexOf("\"");
								String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
								Document isbn= Jsoup.connect(bResult).get();
								Elements dIsbn = isbn.select(".spot");
								for(Element c: dIsbn) {
									Elements Risbn = c.select("div");
									String result = Risbn.text();
									if(result.contains("|ISBN ")==true) {
										int isbn1=result.indexOf("|ISBN");
										String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
										Document kdoc = Jsoup.connect("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttba12345555582050001&ItemIdType=ISBN13&ItemId="+result2).get();	
										Elements AlaTitle =kdoc.select("object");
										for(Element t : AlaTitle) {
											Elements alaTitleResult = t.select("item>title");
											String alaTitle =alaTitleResult.html().toString();
											Elements alaAuthor = t.select("item>author");
											String alaAuthorTest = alaAuthor.html().toString();
											Elements alaImg = t.select("item >cover");
											String alaImgTest = alaImg.html().toString();
											Elements publisher= t.select("item >publisher");
											String publisherTest = publisher.html().toString();
											Elements  alaIsbn = t.select("item >isbn13");
											String alaIsbnTest = alaIsbn.html().toString();
											Elements pubDate = t.select("item>pubDate");
											String publeDate = pubDate.html();
											Date dates = new Date(publeDate);//여기까지 옴
											if(mapper.selectIsbn(alaIsbnTest) ==null) {
												rank.setBookPubDate(dates);
												rank.setBookTitle(alaTitle);
												rank.setBookAuthor(alaAuthorTest);
												rank.setBookImg(alaImgTest);
												rank.setBookPublisher(publisherTest);
												rank.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
												mapper.insertRanking(rank);
												++rankingNo;
											}	
										}
									}
								}
							}
						case 2: Document aladdin = Jsoup.connect
								("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"aladdin"+"&cate="+"total"+"&bestWeek="+cal.get(cal.YEAR)+"-"+(date.getMonth()+1)+"-"+cal.get(cal.DAY_OF_WEEK_IN_MONTH)+"&indexCount=1&type=list").get();
						Elements alist =aladdin.select(".basic >li");
						for(Element  e:alist) {
							Elements bidList=e.select(" dl > dt");
							String bidListsDetail = bidList.html().substring(9, 80);
							int num = bidListsDetail.indexOf("\"");
							String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
							Document isbn= Jsoup.connect(bResult).get();
							Elements dIsbn = isbn.select(".spot");
							for(Element c: dIsbn) {
								++rankingNo;							
								Elements Risbn = c.select("div");
								String result = Risbn.text();
								if(result.contains("|ISBN ")==true) {
									int isbn1=result.indexOf("|ISBN");
									String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
									Document kdoc = Jsoup.connect("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttba12345555582050001&ItemIdType=ISBN13&ItemId="+result2).get();	
									Elements AlaTitle =kdoc.select("object");
									for(Element t : AlaTitle) {
										Elements alaTitleResult = t.select("item>title");
										String alaTitle =alaTitleResult.html().toString();
										Elements alaAuthor = t.select("item>author");
										String alaAuthorTest = alaAuthor.html().toString();
										Elements alaImg = t.select("item >cover");
										String alaImgTest = alaImg.html().toString();
										Elements publisher= t.select("item >publisher");
										String publisherTest = publisher.html().toString();
										Elements  alaIsbn = t.select("item >isbn13");
										String alaIsbnTest = alaIsbn.html().toString();
										Elements pubDate = t.select("item>pubDate");
										String publeDate = pubDate.html();
										Date dates = new Date(publeDate);
										if(mapper.selectIsbn(alaIsbnTest) ==null) {
											rank.setBookPubDate(dates);
											rank.setBookTitle(alaTitle);
											rank.setBookAuthor(alaAuthorTest);
											rank.setBookImg(alaImgTest);
											rank.setBookPublisher(publisherTest);
											rank.setIsbn(alaIsbnTest);
											mapper.insertRanking(rank);
										}	
									}
								}
							}
						}
						case 3: 
							Document bookpark = Jsoup.connect
							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"bookpark"+"&cate="+"bookpark"+"&bestWeek="+cal.get(cal.YEAR)+"-"+(date.getMonth()+1)+"-"+cal.get(cal.DAY_OF_WEEK_IN_MONTH)+"&indexCount=1&type=list").get();
							Elements blist =bookpark.select(".basic >li");
							for(Element  e:blist) {
								Elements bidList=e.select(" dl > dt");
								String bidListsDetail = bidList.html().substring(9, 80);							
								int num = bidListsDetail.indexOf("\"");
								String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
								Document isbn= Jsoup.connect(bResult).get();
								Elements dIsbn = isbn.select(".spot");
								for(Element c: dIsbn) {
									Elements Risbn = c.select("div");
									String result = Risbn.text();
									if(result.contains("|ISBN ")==true) {
										int isbn1=result.indexOf("|ISBN");
										String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
										Document kdoc = Jsoup.connect("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttba12345555582050001&ItemIdType=ISBN13&ItemId="+result2).get();	
										Elements AlaTitle =kdoc.select("object");
										for(Element t : AlaTitle) {
											Elements alaTitleResult = t.select("item>title");
											String alaTitle =alaTitleResult.html().toString();
											Elements alaAuthor = t.select("item>author");
											String alaAuthorTest = alaAuthor.html().toString();									
											Elements alaImg = t.select("item >cover");
											String alaImgTest = alaImg.html().toString();									
											Elements publisher= t.select("item >publisher");
											String publisherTest = publisher.html().toString();									
											Elements  alaIsbn = t.select("item >isbn13");
											String alaIsbnTest = alaIsbn.html().toString();
											Elements pubDate = t.select("item>pubDate");
											String publeDate = pubDate.html();
											Date dates = new Date(publeDate);
											if(mapper.selectIsbn(alaIsbnTest) ==null) {
												rank.setBookPubDate(dates);								
												rank.setBookTitle(alaTitle);
												rank.setBookAuthor(alaAuthorTest);
												rank.setBookImg(alaImgTest);
												rank.setBookPublisher(publisherTest);
												rank.setIsbn(alaIsbnTest);
												mapper.insertRanking(rank);
											}	
										}
									}
								}
							}
						case 4:
							Document bandi = Jsoup.connect
							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"bandi"+"&cate="+"total"+"&bestWeek="+cal.get(cal.YEAR)+"-"+(date.getMonth()+1)+"-"+cal.get(cal.DAY_OF_WEEK_IN_MONTH)+"&indexCount=1&type=list").get();
							Elements bandilist =bandi.select(".basic >li");
							for(Element  e:bandilist) {
								Elements bidList=e.select(" dl > dt");
								String bidListsDetail = bidList.html().substring(9, 80);
								int num = bidListsDetail.indexOf("\"");
								String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));						
								Document isbn= Jsoup.connect(bResult).get();
								Elements dIsbn = isbn.select(".spot");
								for(Element c: dIsbn) {				
									Elements Risbn = c.select("div");
									String result = Risbn.text();
									if(result.contains("|ISBN ")==true) {
										int isbn1=result.indexOf("|ISBN");
										String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
										Document kdoc = Jsoup.connect("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttba12345555582050001&ItemIdType=ISBN13&ItemId="+result2).get();	
										Elements AlaTitle =kdoc.select("object");
										for(Element t : AlaTitle) {
											Elements alaTitleResult = t.select("item>title");
											String alaTitle =alaTitleResult.html().toString();								
											Elements alaAuthor = t.select("item>author");
											String alaAuthorTest = alaAuthor.html().toString();										
											Elements alaImg = t.select("item >cover");
											String alaImgTest = alaImg.html().toString();										
											Elements publisher= t.select("item >publisher");
											String publisherTest = publisher.html().toString();										
											Elements  alaIsbn = t.select("item >isbn13");
											String alaIsbnTest = alaIsbn.html().toString();									
											Elements pubDate = t.select("item>pubDate");
											String publeDate = pubDate.html();										
											Date dates = new Date(publeDate);
											if(mapper.selectIsbn(alaIsbnTest) ==null) {
												rank.setBookPubDate(dates);
												rank.setBookTitle(alaTitle);
												rank.setBookAuthor(alaAuthorTest);
												rank.setBookImg(alaImgTest);
												rank.setBookPublisher(publisherTest);
												rank.setIsbn(alaIsbnTest);		
												mapper.insertRanking(rank);
												++rankingNo;
											}	
										}
									}
								}
							}
						case 5:
							Document ypbooks = Jsoup.connect
							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"ypbooks"+"&cate="+"total"+"&bestWeek="+cal.get(cal.YEAR)+"-"+(date.getMonth()+1)+"-"+cal.get(cal.DAY_OF_WEEK_IN_MONTH)+"&indexCount=1&type=list").get();
							Elements ypList =ypbooks.select(".basic >li");
							for(Element  e:ypList) {
								Elements bidList=e.select(" dl > dt");
								String bidListsDetail = bidList.html().substring(9, 80);
								int num = bidListsDetail.indexOf("\"");
								String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
								Document isbn= Jsoup.connect(bResult).get();
								Elements dIsbn = isbn.select(".spot");
								for(Element c: dIsbn) {
									Elements Risbn = c.select("div");
									String result = Risbn.text();
									if(result.contains("|ISBN ")==true) {
										int isbn1=result.indexOf("|ISBN");
										String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
										Document kdoc = Jsoup.connect("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttba12345555582050001&ItemIdType=ISBN13&ItemId="+result2).get();	
										Elements AlaTitle =kdoc.select("object");
										for(Element t : AlaTitle) {
											Elements alaTitleResult = t.select("item>title");
											String alaTitle =alaTitleResult.html().toString();
											Elements alaAuthor = t.select("item>author");
											String alaAuthorTest = alaAuthor.html().toString();								
											Elements alaImg = t.select("item >cover");
											String alaImgTest = alaImg.html().toString();			
											Elements publisher= t.select("item >publisher");
											String publisherTest = publisher.html().toString();						
											Elements  alaIsbn = t.select("item >isbn13");
											String alaIsbnTest = alaIsbn.html().toString();							
											Elements pubDate = t.select("item>pubDate");
											String publeDate = pubDate.html();
											Date dates = new Date(publeDate);
											if(mapper.selectIsbn(alaIsbnTest) ==null) {
												rank.setBookPubDate(dates);
												rank.setBookTitle(alaTitle);
												rank.setBookAuthor(alaAuthorTest);
												rank.setBookImg(alaImgTest);
												rank.setBookPublisher(publisherTest);
												rank.setIsbn(alaIsbnTest);								
												mapper.insertRanking(rank);
												++rankingNo;
											}	
										}
									}
								}
							}
						case 6:
							Document morning365 = Jsoup.connect
							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"morning365"+"&cate="+"total"+"&bestWeek="+cal.get(cal.YEAR)+"-"+(date.getMonth()+1)+"-"+cal.get(cal.DAY_OF_WEEK_IN_MONTH)+"&indexCount=1&type=list").get();
							Elements morningList =morning365.select(".basic >li");
							for(Element  e:morningList) {
								Elements bidList=e.select(" dl > dt");
								String bidListsDetail = bidList.html().substring(9, 80);
								int num = bidListsDetail.indexOf("\"");
								String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));							
								Document isbn= Jsoup.connect(bResult).get();
								Elements dIsbn = isbn.select(".spot");
								for(Element c: dIsbn) {					
									Elements Risbn = c.select("div");
									String result = Risbn.text();
									if(result.contains("|ISBN ")==true) {
										int isbn1=result.indexOf("|ISBN");
										String result2 = result.substring(isbn1+6,isbn1+19);//ibsn값 추출							
										Document kdoc = Jsoup.connect("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttba12345555582050001&ItemIdType=ISBN13&ItemId="+result2).get();	
										Elements AlaTitle =kdoc.select("object");
										for(Element t : AlaTitle) {
											Elements alaTitleResult = t.select("item>title");
											String alaTitle =alaTitleResult.html().toString();//알라딘
											Elements alaAuthor = t.select("item>author");
											String alaAuthorTest = alaAuthor.html().toString();
											Elements alaImg = t.select("item >cover");
											String alaImgTest = alaImg.html().toString();
											Elements publisher= t.select("item >publisher");
											String publisherTest = publisher.html().toString();
											Elements  alaIsbn = t.select("item >isbn13");
											String alaIsbnTest = alaIsbn.html().toString();
											Elements pubDate = t.select("item>pubDate");
											String publeDate = pubDate.html();
											Date dates = new Date(publeDate);
											if(mapper.selectIsbn(alaIsbnTest) ==null) {
												rank.setBookPubDate(dates);
												rank.setBookTitle(alaTitle);
												rank.setBookAuthor(alaAuthorTest);
												rank.setBookImg(alaImgTest);
												rank.setBookPublisher(publisherTest);
												rank.setIsbn(alaIsbnTest);
												mapper.insertRanking(rank);
												++rankingNo;
											}	
										}
									}
								}
							}
						}//switch
					}
					//------------------------------------------------------------------------------------------------
					Document titleandRanking = Jsoup.connect//6
							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"yes24"+"&cate="+"total"+"&bestWeek="+cal.get(cal.YEAR)+"-"+(date.getMonth()+1)+"-"+cal.get(cal.DAY_OF_WEEK_IN_MONTH)+"&indexCount=1&type=list").get();
					Elements titleno = titleandRanking.select(".basic>li");
					Date RankingDate = new Date();
					int yes24Ranking  = 0;
					for(Element e : titleno) {
						Elements bidList=e.select(" dl > dt");
						String bidListsDetail = bidList.html().substring(9, 80);
						int num = bidListsDetail.indexOf("\"");
						String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
						Document isbn= Jsoup.connect(bResult).get();
						Elements dIsbn = isbn.select(".spot");
						++yes24Ranking;
						for(Element c: dIsbn) {
							Elements Risbn = c.select("div");
							String result = Risbn.text();
							if(result.contains("|ISBN ")==true) {
								int isbn1=result.indexOf("|ISBN");
								String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
								Date RDate =new Date();
								if(mapper.WeekChecking()!=RDate) {
									best.setYes24Rank(yes24Ranking);
									best.setIsbn(result2);
									best.setBestsellerWeek(RankingDate);
									best.setBookTitle(mapper.titleByIsbn(result2));
									mapper.Yes24insertRaninkingInfo(best);
								}
							}
						}
					}

					Document kyoboranking = Jsoup.connect//4
							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"kyobo"+"&cate="+"total"+"&bestWeek="+cal.get(cal.YEAR)+"-"+(date.getMonth()+1)+"-"+cal.get(cal.DAY_OF_WEEK_IN_MONTH)+"&indexCount=1&type=list").get();
					Elements kyobo = kyoboranking.select(".basic>li");
					int kyoboCnt=0;
					for(Element e : kyobo) {
						Elements bidList=e.select(" dl > dt");
						String bidListsDetail = bidList.html().substring(9, 80);
						int num = bidListsDetail.indexOf("\"");
						String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
						Document isbn= Jsoup.connect(bResult).get();
						Elements dIsbn = isbn.select(".spot");
						++kyoboCnt;
						for(Element c: dIsbn) {
							Elements Risbn = c.select("div");
							String result = Risbn.text();
							if(result.contains("|ISBN ")==true) {
								int isbn1=result.indexOf("|ISBN");
								String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
								if(mapper.titleNullcheck(mapper.selectIsbn(result2))!=null){
									best.setKyoboRank(kyoboCnt);
									best.setIsbn(result2);
									best.setBestsellerWeek(RankingDate);
									best.setBookTitle(mapper.bookidSelectByIsbn(result2));
									mapper.kyoboUpdateRanking(best);
								}else {
									best.setKyoboRank(kyoboCnt);
									best.setIsbn(result2);
									best.setBestsellerWeek(RankingDate);
									best.setBookTitle(mapper.bookidSelectByIsbn(result2));
									mapper.kyoboInsert(best);
								}
							}
						}
					}
					Document aladdinranking = Jsoup.connect//3
							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"aladdin"+"&cate="+"total"+"&bestWeek="+cal.get(cal.YEAR)+"-"+(date.getMonth()+1)+"-"+cal.get(cal.DAY_OF_WEEK_IN_MONTH)+"&indexCount=1&type=list").get();
					Elements akaddin = aladdinranking.select(".basic>li");
					int aladdinCnt=0;

					for(Element e : akaddin) {
						Elements bidList=e.select(" dl > dt");
						String bidListsDetail = bidList.html().substring(9, 80);
						int num = bidListsDetail.indexOf("\"");
						String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
						Document isbn= Jsoup.connect(bResult).get();
						Elements dIsbn = isbn.select(".spot");
						++aladdinCnt;
						for(Element c: dIsbn) {
							Elements Risbn = c.select("div");
							String result = Risbn.text();
							if(result.contains("|ISBN ")==true) {
								int isbn1=result.indexOf("|ISBN");
								String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
								if(mapper.titleNullcheck(mapper.selectIsbn(result2))!=null){
									best.setAladdinRank(aladdinCnt);
									best.setIsbn(result2);
									best.setBestsellerWeek(RankingDate);
									best.setBookTitle(mapper.bookidSelectByIsbn(result2));
									mapper.aladdinupdateRanking(best);
								}else {
									best.setAladdinRank(aladdinCnt);
									best.setIsbn(result2);
									best.setBestsellerWeek(RankingDate);
									best.setBookTitle(mapper.bookidSelectByIsbn(result2));
									mapper.aladdinInsert(best);
								}
							}
						}
					}

					Document bandiranking = Jsoup.connect//1
							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"bandi"+"&cate="+"total"+"&bestWeek="+cal.get(cal.YEAR)+"-"+(date.getMonth()+1)+"-"+cal.get(cal.DAY_OF_WEEK_IN_MONTH)+"&indexCount=1&type=list").get();
					Elements bandi = bandiranking.select(".basic>li");
					int bandiCnt=0;
					for(Element e : bandi) {
						Elements bidList=e.select(" dl > dt");
						String bidListsDetail = bidList.html().substring(9, 80);
						int num = bidListsDetail.indexOf("\"");
						String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));			
						Document isbn= Jsoup.connect(bResult).get();
						Elements dIsbn = isbn.select(".spot");
						++bandiCnt;
						for(Element c: dIsbn) {
							Elements Risbn = c.select("div");
							String result = Risbn.text();
							if(result.contains("|ISBN ")==true) {
								int isbn1=result.indexOf("|ISBN");
								String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
								if(mapper.titleNullcheck(mapper.selectIsbn(result2))!=null){
									best.setBandiRank(bandiCnt);
									best.setIsbn(result2);
									best.setBestsellerWeek(RankingDate);
									best.setBookTitle(mapper.bookidSelectByIsbn(result2));
									mapper.bandiRanking(best);
								}else {
									best.setBandiRank(bandiCnt);
									best.setIsbn(result2);
									best.setBestsellerWeek(RankingDate);
									best.setBookTitle(mapper.bookidSelectByIsbn(result2));
									mapper.bandiInsert(best);
								}
							}
						}
					}
					response.sendRedirect(request.getContextPath() + "/jsp/BestSeller.jsp");
				}else {
					response.sendRedirect(request.getContextPath() + "/jsp/BestSeller.jsp");
				}
			}//outer if-else
		} catch (IOException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

	}

}
