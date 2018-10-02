package kr.co.seoRak.Ranking.contorller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

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
import kr.co.seoRak.repository.domain.RankingRankingInfo;
import kr.co.seoRak.repository.mapper.RankingMapper;
//import kr.co.seoRak.repository.mapper.RankingMapper;
//import kr.co.seoRak.common.db.MyAppSqlConfig;


@WebServlet("/seorak/BestSellerRanking.do")
public class insertRankingController extends HttpServlet{
	ArrayList Atitle = new ArrayList();
	
	//	RankingMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(RankingMapper.class);
	RankingMapper mapper = MyAppSqlConfig.getSqlSessionInstance().getMapper(RankingMapper.class);
	RankingRankingInfo best = new RankingRankingInfo();
	RankingBookInfo rank = new RankingBookInfo();
	int rankingNo=0;
	@SuppressWarnings("static-access")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");//한글처리

		//		ArrayList<seorakRankdomain Aisbn =new ArrayList();

		Calendar cal = Calendar.getInstance();


		try {
			if(cal.get(cal.DAY_OF_WEEK)!=cal.WEDNESDAY) {


				Document doc = Jsoup.connect
						("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"aladdin"+"&cate="+"total"+"&bestWeek="+cal.YEAR+"-"+cal.MONTH+"-"+cal.WEEK_OF_MONTH+"&indexCount=1&type=list").get();
				
				Elements list = doc.select(".basic >li");//naver 전체 html 파일 확인 -->안에서 실시간 검색어 부분만 찾음
				for(Element e : list) {
					
					//					rank.setAladdinRank(k);

					Elements title = e.select("dl > dt > a");
					//					System.out.println("순위:"+k+", 제목 :"+title.html());



					rank.setBookTitle(title.html().toString());//1
					Elements author =e.select("dl>dd>[class='txt_name N=a:bel.author']");
					System.out.println("저자 :"+author.html());

					rank.setBookAuthor(author.html().toString());
					//------------------------------------------
					Elements bidList=e.select(" dl > dt");
					String bidListsDetail = bidList.html().substring(9, 80);

					int num = bidListsDetail.indexOf("\"");
					String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
					System.out.println("북아이디 주소: "+bResult);


					//					mapper.insertRanking(rank);

					//---출판사 //여길 못오네?
					Document bdoc = Jsoup.connect(bResult).get();
					Elements bDetail=bdoc.select(".spot");
					for(Element d:bDetail) {
						//출판사
						Elements publisher =d.select("[class='N=a:bil.publisher']");
						System.out.println("출판사 :"+publisher.html());
						//						rank.setBookPublisher(publisher.html().toString());



					}


					//isbn
					Document isbn= Jsoup.connect(bResult).get();
					Elements dIsbn = isbn.select(".spot");
					for(Element c : dIsbn) {
						Elements Risbn = c.select("div");
						String result = Risbn.text();

						if(result.contains("|ISBN ")==true) {
							result ="kk";
							int isbn1=result.indexOf("|ISBN");
							String result2 = result.substring(isbn1+5,isbn1+19);//9788934982975
							//							System.out.println("isbn:"+result2);
							//							rank.setIsbn(isbn1);
							//							Aisbn.add(result2);

							Document publeDate = Jsoup.connect(
									"http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttba12345555582050001&Query="+result2+"&Sort=SalesPoint"
									).get();
							Elements disbn =publeDate.select("item");
							for(Element f : disbn) {
								Elements pDate = f.select("pubDate");
								//								rank.setBookPublisher(pDate.html().toString());
								System.out.println("출간일:"+pDate.html());
								//								Element img = f.selectFirst("cover");
								//								System.out.println("이미지 소스:"+img.html());
								//								rank.setBookImg(img.html().toString());//이밎 소스 담음
							}

						}



					}
				}



				//여기서 묹가 꽝
				response.sendRedirect(request.getContextPath()+"/board/ranking.do");
				//					response.sendRedirect(request.getContextPath()+"jspRrac/best1.jsp");


			}else {


				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<h1>이거 됨?</h1>");//여기까진 왔음
				out.println("<h1>이거 됨?ㅜㅜ</h1>");
				//				


				Date date = new Date();
				out.println(date.toLocaleString().substring(0, 11)+"<br>");
				int month = date.getMonth()+1;
				//				Date nDate =date.
				;
				//				date = date.from(date.toLocaleString().substring(0, 11));
				//				Document doc = Jsoup.connect
				//						("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"aladdin"+"&cate="+"total"+"&bestWeek="+cal.get(Calendar.YEAR)+"-"+month+"-"+cal.get(Calendar.WEEK_OF_MONTH)+"&indexCount=1&type=list").get();

				Document doc = Jsoup.connect
						("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"yes24"+"&cate="+"total"+"&bestWeek="+cal.YEAR+"-"+10+"-"+5+"&indexCount=1&type=list").get();
				Elements list = doc.select(".basic >li");//naver 전체 html 파일 확인 -->안에서 실시간 검색어 부분만 찾음
				out.println("년도"+cal.get(Calendar.YEAR));
				out.println("<br>");
				out.println("달:"+month);
				out.println("<br>");
				out.println("주"+cal.get(Calendar.WEEK_OF_MONTH));
				out.println("<br>");
				//				out.println(list.toString());
				int no=0;
				for(Element e : list) {
					
					++no;

					Elements bidList=e.select(" dl > dt");
					String bidListsDetail = bidList.html().substring(9, 80);


					int num = bidListsDetail.indexOf("\"");
					String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
					out.println(bResult+"<br>");
					Document isbn= Jsoup.connect(bResult).get();
					Elements dIsbn = isbn.select(".spot");

					for(Element c: dIsbn) {
					
						Elements title = c.select(".book_info>h2>a");
						out.println(title.html().toString());

						


						Elements author = c.select(".book_info_inner>div");

						if(author.contains("|네티즌리뷰 ")==true) {
							int author1 = author.indexOf("|네티즌리뷰");


							String Rauthor = author.text().toString().substring(author1, author1);
							Elements Risbn = c.select("div");
							String result = Risbn.text();
							out.println(result);
						}
						Elements Risbn = c.select("div");
						String result = Risbn.text();
						

						out.println("<br>순위"+no);

						if(result.contains("|ISBN ")==true) {

							int isbn1=result.indexOf("|ISBN");
							String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
							out.println("isbn:"+result2+"<br>");

							Document kdoc = Jsoup.connect("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttba12345555582050001&ItemIdType=ISBN13&ItemId="+result2).get();	
							Elements AlaTitle =kdoc.select("object");
							for(Element t : AlaTitle) {
								Elements alaTitleResult = t.select("item>title");
								String alaTitle =alaTitleResult.html().toString();
								out.println("알라딘 제목:"+alaTitle+"<br>");
								Elements alaAuthor = t.select("item>author");
								String alaAuthorTest = alaAuthor.html().toString();
								out.print("알라딘 저자:"+alaAuthorTest+"<br>");

								Elements alaImg = t.select("item >cover");
								String alaImgTest = alaImg.html().toString();
								out.print("알라딘 이미지"+alaImgTest+"<br>");
								Elements publisher= t.select("item >publisher");
								String publisherTest = publisher.html().toString();
								out.print("알라딘 출판사"+publisherTest+"<br>");
								Elements  alaIsbn = t.select("item >isbn13");
								String alaIsbnTest = alaIsbn.html().toString();
								out.print("알라딘 isbn13"+alaIsbnTest+"<br>");

								Elements pubDate = t.select("item>pubDate");
								String publeDate = pubDate.html();


								Date dates = new Date(publeDate);
								if(mapper.selectIsbn(alaIsbnTest) ==null) {
									rank.setBookPubDate(dates);

									//							out.println("예스24순위:"+k);
									rank.setBookTitle(alaTitle);
									rank.setBookAuthor(alaAuthorTest);
									rank.setBookImg(alaImgTest);
									rank.setBookPublisher(publisherTest);
									rank.setIsbn(alaIsbnTest);
									//							
									mapper.insertRanking(rank);

								}
								
								best.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
								best.setBookTitle(alaTitle);
								best.setYes24Rank(no);
//								best.setIsbn(rank.getIsbn());
								String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
								System.out.println("date_s:"+date_s);//날짜
								SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
								Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
								best.setBestsellerWeek(dt.parse(date_s));
							    
								mapper.insertTotalBestRankyes24(best);
								
							}
						}

					}//for disbn
					out.println("------------------------"+"<br>");
				}
				//				
				//				
				for(int k = 1 ; k <= 6 ; k++) {
					switch(k) {
					case 1: 
						out.println("교보시작");
						Document kyoboRanking = Jsoup.connect
								("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"kyobo"+"&cate="+"total"+"&bestWeek="+cal.YEAR+"-"+9+"-"+5+"&indexCount=1&type=list").get();
						Elements klist =kyoboRanking.select(".basic >li");
					
						for(Element  e:klist) {
							Elements bidList=e.select(" dl > dt");
							String bidListsDetail = bidList.html().substring(9, 80);
							

							int num = bidListsDetail.indexOf("\"");
							String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
							out.println(bResult+"<br>");
							Document isbn= Jsoup.connect(bResult).get();
							Elements dIsbn = isbn.select(".spot");

							for(Element c: dIsbn) {
//								++pp;
								Elements title = c.select(".book_info>h2>a");
								out.println(title.html().toString());

								


								Elements author = c.select(".book_info_inner>div");

								if(author.contains("|네티즌리뷰 ")==true) {
									int author1 = author.indexOf("|네티즌리뷰");


									String Rauthor = author.text().toString().substring(author1, author1);
									Elements Risbn = c.select("div");
									String result = Risbn.text();
									out.println(result);
								}
								Elements Risbn = c.select("div");
								String result = Risbn.text();


								out.println("<br>순위"+k);

								if(result.contains("|ISBN ")==true) {

									int isbn1=result.indexOf("|ISBN");
									String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
									out.println("isbn:"+result2+"<br>");

									Document kdoc = Jsoup.connect("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttba12345555582050001&ItemIdType=ISBN13&ItemId="+result2).get();	
									Elements AlaTitle =kdoc.select("object");
									for(Element t : AlaTitle) {
										Elements alaTitleResult = t.select("item>title");
										String alaTitle =alaTitleResult.html().toString();
										out.println("교보 제목:"+alaTitle+"<br>");
										Elements alaAuthor = t.select("item>author");
										String alaAuthorTest = alaAuthor.html().toString();
										out.print("교보 저자:"+alaAuthorTest+"<br>");

										Elements alaImg = t.select("item >cover");
										String alaImgTest = alaImg.html().toString();
										out.print("교보 이미지"+alaImgTest+"<br>");
										Elements publisher= t.select("item >publisher");
										String publisherTest = publisher.html().toString();
										//										out.print("교보 출판사"+publisherTest+"<br>");
										Elements  alaIsbn = t.select("item >isbn13");
										String alaIsbnTest = alaIsbn.html().toString();
										//										out.print("교보 isbn13"+alaIsbnTest+"<br>");

										Elements pubDate = t.select("item>pubDate");
										String publeDate = pubDate.html();


										Date dates = new Date(publeDate);//여기까지 옴
										if(mapper.selectIsbn(alaIsbnTest) ==null) {
											rank.setBookPubDate(dates);

											//										out.println("예스24순위:"+k);
											rank.setBookTitle(alaTitle);
											rank.setBookAuthor(alaAuthorTest);
											rank.setBookImg(alaImgTest);
											rank.setBookPublisher(publisherTest);
											rank.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
											
											mapper.insertRanking(rank);
											++rankingNo;
										}	
										
//										best.setIsbn(alaTitle);
//										best.setKyoboRank(k);
//										best.setIsbn(rank.getIsbn());
//										String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
//										System.out.println("date_s:"+date_s);//날짜
//										SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
//										Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
//										best.setBestsellerWeek(date3);
//										mapper.insertTotalBestRankyes24(best);
										if(mapper.selectIsbnbyTitle(alaTitle)==alaTitle ) {
											//alaTitle
											best.setKyoboRank(k);
//											best.setBookTitle(mapper.selectTitle(alaTitle));
//											best.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
											mapper.updateBookRankingkyobo(best);
//											String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
//											System.out.println("date_s:"+date_s);//날짜
//											SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
//											Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
//											best.setBestsellerWeek(date3);
//											mapper.insertTotalBestRankyes24(best);
										}else {
											
											
											if(mapper.selectIsbnbyTitle(alaTitle))
											best.setKyoboRank(k);
											
										
											best.setBookTitle(alaTitle);
											best.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
											String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
											System.out.println("date_s:"+date_s);//날짜
											SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
											Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
											best.setBestsellerWeek(dt.parse(date_s));
											mapper.insertKyoboRanking(best);
										
										}
									}
								}

							}
						}
					case 2: Document aladdin = Jsoup.connect
							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"aladdin"+"&cate="+"total"+"&bestWeek="+cal.YEAR+"-"+9+"-"+5+"&indexCount=1&type=list").get();
					Elements alist =aladdin.select(".basic >li");
					for(Element  e:alist) {
						Elements bidList=e.select(" dl > dt");
						String bidListsDetail = bidList.html().substring(9, 80);

						
						int num = bidListsDetail.indexOf("\"");
						String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
						out.println(bResult+"<br>");
						Document isbn= Jsoup.connect(bResult).get();
						Elements dIsbn = isbn.select(".spot");

						for(Element c: dIsbn) {
							++rankingNo;
							Elements title = c.select(".book_info>h2>a");
							out.println(title.html().toString());

							no++;
							

							Elements author = c.select(".book_info_inner>div");
							//									out.println(author.text());
							if(author.contains("|네티즌리뷰 ")==true) {
								int author1 = author.indexOf("|네티즌리뷰");


								String Rauthor = author.text().toString().substring(author1, author1);
								Elements Risbn = c.select("div");
								String result = Risbn.text();
								out.println(result);
							}
							Elements Risbn = c.select("div");
							String result = Risbn.text();


							out.println("<br>순위"+k);

							if(result.contains("|ISBN ")==true) {

								int isbn1=result.indexOf("|ISBN");
								String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
								out.println("isbn:"+result2+"<br>");

								Document kdoc = Jsoup.connect("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttba12345555582050001&ItemIdType=ISBN13&ItemId="+result2).get();	
								Elements AlaTitle =kdoc.select("object");
								for(Element t : AlaTitle) {
									Elements alaTitleResult = t.select("item>title");
									String alaTitle =alaTitleResult.html().toString();
									out.println("교보 제목:"+alaTitle+"<br>");
									Elements alaAuthor = t.select("item>author");
									String alaAuthorTest = alaAuthor.html().toString();
									out.print("교보 저자:"+alaAuthorTest+"<br>");

									Elements alaImg = t.select("item >cover");
									String alaImgTest = alaImg.html().toString();
									out.print("교보 이미지"+alaImgTest+"<br>");
									Elements publisher= t.select("item >publisher");
									String publisherTest = publisher.html().toString();
									out.print("교보 출판사"+publisherTest+"<br>");
									Elements  alaIsbn = t.select("item >isbn13");
									String alaIsbnTest = alaIsbn.html().toString();
									out.print("알라딘 isbn13"+alaIsbnTest+"<br>");
									++k;
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
									if(mapper.selectIsbnbyTitle(alaTitle)==alaTitle ) {
										//alaTitle
										best.setAladdinRank(k);
//										best.setBookTitle(mapper.selectTitle(alaTitle));
//										best.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
										mapper.updateBookRankingaladdin(best);
//										String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
//										System.out.println("date_s:"+date_s);//날짜
//										SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
//										Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
//										best.setBestsellerWeek(date3);
//										mapper.insertTotalBestRankyes24(best);
									}else {
										

										if(mapper.seorakRankingtitlecheck(alaTitle)==null) {
											best.setAladdinRank(rankingNo);
										best.setBookTitle(mapper.selectTitle(alaTitle));
										best.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
										String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
										System.out.println("date_s:"+date_s);//날짜
										SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
										Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
										best.setBestsellerWeek(dt.parse(date_s));
										mapper.insertAladdinRanking(best);
										}
									}
								}
							}

						}
					}


					case 3: 
						out.println("북파크시작");
						Document bookpark = Jsoup.connect
								("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"bookpark"+"&cate="+"bookpark"+"&bestWeek="+cal.YEAR+"-"+9+"-"+5+"&indexCount=1&type=list").get();
						Elements blist =bookpark.select(".basic >li");
						for(Element  e:blist) {
							Elements bidList=e.select(" dl > dt");
							String bidListsDetail = bidList.html().substring(9, 80);
							
							k=0;
							int num = bidListsDetail.indexOf("\"");
							String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
							out.println(bResult+"<br>");
							Document isbn= Jsoup.connect(bResult).get();
							Elements dIsbn = isbn.select(".spot");

							for(Element c: dIsbn) {

								Elements title = c.select(".book_info>h2>a");
								out.println(title.html().toString());

								no++;


								Elements author = c.select(".book_info_inner>div");
								//									out.println(author.text());
								if(author.contains("|네티즌리뷰 ")==true) {
									int author1 = author.indexOf("|네티즌리뷰");


									String Rauthor = author.text().toString().substring(author1, author1);
									Elements Risbn = c.select("div");
									String result = Risbn.text();
									out.println(result);
								}
								Elements Risbn = c.select("div");
								String result = Risbn.text();


								out.println("<br>순위"+k);

								if(result.contains("|ISBN ")==true) {

									int isbn1=result.indexOf("|ISBN");
									String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
									out.println("isbn:"+result2+"<br>");

									Document kdoc = Jsoup.connect("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttba12345555582050001&ItemIdType=ISBN13&ItemId="+result2).get();	
									Elements AlaTitle =kdoc.select("object");
									for(Element t : AlaTitle) {
										Elements alaTitleResult = t.select("item>title");
										String alaTitle =alaTitleResult.html().toString();
										out.println("북파크 제목:"+alaTitle+"<br>");
										Elements alaAuthor = t.select("item>author");
										String alaAuthorTest = alaAuthor.html().toString();
										out.print("북파크 저자:"+alaAuthorTest+"<br>");

										Elements alaImg = t.select("item >cover");
										String alaImgTest = alaImg.html().toString();
										out.print("알라딘 이미지"+alaImgTest+"<br>");
										Elements publisher= t.select("item >publisher");
										String publisherTest = publisher.html().toString();
										out.print("알라딘 출판사"+publisherTest+"<br>");
										Elements  alaIsbn = t.select("item >isbn13");
										String alaIsbnTest = alaIsbn.html().toString();
										out.print("알라딘 isbn13"+alaIsbnTest+"<br>");

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
											++k;
										}	
										if(mapper.selectIsbnbyTitle(alaTitle)==alaTitle ) {
											//alaTitle
											best.setBookparkRank(k);
//											best.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
//											best.setBookTitle(mapper.selectTitle(alaTitle));
											mapper.updateBookRankingbookpark(best);
//											String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
//											System.out.println("date_s:"+date_s);//날짜
//											SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
//											Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
//											best.setBestsellerWeek(date3);
//											mapper.insertTotalBestRankyes24(best);
										}else {
											if(mapper.seorakRankingtitlecheck(alaTitle)==null) {
											best.setBookparkRank(k);

											
											best.setBookTitle(mapper.selectTitle(alaTitle));
											best.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
											String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
											System.out.println("date_s:"+date_s);//날짜
											SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
											Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
											best.setBestsellerWeek(dt.parse(date_s));
											mapper.insertBookparkRanking(best);
											}
										}
									}
								}

							}
						}
					case 4:
						out.println("반디시작");
						Document bandi = Jsoup.connect
								("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"bandi"+"&cate="+"total"+"&bestWeek="+cal.YEAR+"-"+9+"-"+5+"&indexCount=1&type=list").get();
						Elements bandilist =bandi.select(".basic >li");
						for(Element  e:bandilist) {
							Elements bidList=e.select(" dl > dt");
							String bidListsDetail = bidList.html().substring(9, 80);


							int num = bidListsDetail.indexOf("\"");
							String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
							out.println(bResult+"<br>");
							Document isbn= Jsoup.connect(bResult).get();
							Elements dIsbn = isbn.select(".spot");

							for(Element c: dIsbn) {
								int m = 0 ;
								Elements title = c.select(".book_info>h2>a");
								out.println(title.html().toString());

								no++;
								out.println("반디 랭킹:"+no);

								Elements author = c.select(".book_info_inner>div");

								if(author.contains("|네티즌리뷰 ")==true) {
									int author1 = author.indexOf("|네티즌리뷰");


									String Rauthor = author.text().toString().substring(author1, author1);
									Elements Risbn = c.select("div");
									String result = Risbn.text();
									out.println(result);
								}
								Elements Risbn = c.select("div");
								String result = Risbn.text();


								out.println("<br>순위"+k);

								if(result.contains("|ISBN ")==true) {

									int isbn1=result.indexOf("|ISBN");
									String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
									out.println("isbn:"+result2+"<br>");

									Document kdoc = Jsoup.connect("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttba12345555582050001&ItemIdType=ISBN13&ItemId="+result2).get();	
									Elements AlaTitle =kdoc.select("object");
									for(Element t : AlaTitle) {
										Elements alaTitleResult = t.select("item>title");
										String alaTitle =alaTitleResult.html().toString();
										out.println("알라딘 제목:"+alaTitle+"<br>");
										Elements alaAuthor = t.select("item>author");
										String alaAuthorTest = alaAuthor.html().toString();
										out.print("알라딘 저자:"+alaAuthorTest+"<br>");

										Elements alaImg = t.select("item >cover");
										String alaImgTest = alaImg.html().toString();
										out.print("알라딘 이미지"+alaImgTest+"<br>");
										Elements publisher= t.select("item >publisher");
										String publisherTest = publisher.html().toString();
										out.print("알라딘 출판사"+publisherTest+"<br>");
										Elements  alaIsbn = t.select("item >isbn13");
										String alaIsbnTest = alaIsbn.html().toString();
										out.print("알라딘 isbn13"+alaIsbnTest+"<br>");

										Elements pubDate = t.select("item>pubDate");
										String publeDate = pubDate.html();
										++m;

										Date dates = new Date(publeDate);
										if(mapper.selectIsbn(alaIsbnTest) ==null) {
											rank.setBookPubDate(dates);

											//										out.println("예스24순위:"+k);
											rank.setBookTitle(alaTitle);
											rank.setBookAuthor(alaAuthorTest);
											rank.setBookImg(alaImgTest);
											rank.setBookPublisher(publisherTest);
											rank.setIsbn(alaIsbnTest);
											//											rank.setBookPubDate(bookPubDate);
											//											rank.setBestsellerWeek(date.toLocaleString());
											mapper.insertRanking(rank);
											++rankingNo;
										}	
										if(mapper.selectIsbnbyTitle(alaTitle)!=alaTitle ) {
											//alaTitle
											best.setBandiRank(m);
//											best.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
//											best.setBookTitle(mapper.selectTitle(alaTitle));
											mapper.updateBookRankingbandi(best);
//											String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
//											System.out.println("date_s:"+date_s);//날짜
//											SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
//											Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
//											best.setBestsellerWeek(date3);
//											mapper.insertTotalBestRankyes24(best);
										}else {
											if(mapper.seorakRankingtitlecheck(alaTitle)==null) {
										
											best.setBandiRank(m);
											
											best.setBookTitle(mapper.selectTitle(alaTitle));
											best.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
											String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
											System.out.println("date_s:"+date_s);//날짜
											SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
											Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
											best.setBestsellerWeek(dt.parse(date_s));
											mapper.insertBandikRanking(best);
											}
										}
									}
								}

							}
						}
					case 5:
						out.println("영풍시작");
						Document ypbooks = Jsoup.connect
								("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"ypbooks"+"&cate="+"total"+"&bestWeek="+cal.YEAR+"-"+9+"-"+5+"&indexCount=1&type=list").get();
						Elements ypList =ypbooks.select(".basic >li");
						for(Element  e:ypList) {
							Elements bidList=e.select(" dl > dt");
							String bidListsDetail = bidList.html().substring(9, 80);


							int num = bidListsDetail.indexOf("\"");
							String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
							out.println(bResult+"<br>");
							Document isbn= Jsoup.connect(bResult).get();
							Elements dIsbn = isbn.select(".spot");

							for(Element c: dIsbn) {
								int ll = 0;
								Elements title = c.select(".book_info>h2>a");
								out.println(title.html().toString());
								//									rank.setBookTitle(title.html().toString());
								//									String[] Atitle = {title.html().toString()};
								//									Atitle.add(title.html().toString());
								//									Atitle.add(no, title.html().toString());
								no++;


								Elements author = c.select(".book_info_inner>div");
								//									out.println(author.text());
								if(author.contains("|네티즌리뷰 ")==true) {
									int author1 = author.indexOf("|네티즌리뷰");


									String Rauthor = author.text().toString().substring(author1, author1);
									Elements Risbn = c.select("div");
									String result = Risbn.text();
									out.println(result);
								}
								Elements Risbn = c.select("div");
								String result = Risbn.text();


								out.println("<br>순위"+k);

								if(result.contains("|ISBN ")==true) {

									int isbn1=result.indexOf("|ISBN");
									String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
									out.println("isbn:"+result2+"<br>");

									Document kdoc = Jsoup.connect("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttba12345555582050001&ItemIdType=ISBN13&ItemId="+result2).get();	
									Elements AlaTitle =kdoc.select("object");
									for(Element t : AlaTitle) {
										Elements alaTitleResult = t.select("item>title");
										String alaTitle =alaTitleResult.html().toString();
										//										out.println("알라딘 제목:"+alaTitle+"<br>");
										Elements alaAuthor = t.select("item>author");
										String alaAuthorTest = alaAuthor.html().toString();
										//										out.print("알라딘 저자:"+alaAuthorTest+"<br>");

										Elements alaImg = t.select("item >cover");
										String alaImgTest = alaImg.html().toString();
										//										out.print("알라딘 이미지"+alaImgTest+"<br>");
										Elements publisher= t.select("item >publisher");
										String publisherTest = publisher.html().toString();
										//										out.print("알라딘 출판사"+publisherTest+"<br>");
										Elements  alaIsbn = t.select("item >isbn13");
										String alaIsbnTest = alaIsbn.html().toString();
										//										out.print("알라딘 isbn13"+alaIsbnTest+"<br>");

										Elements pubDate = t.select("item>pubDate");
										String publeDate = pubDate.html();

										++ll;
										Date dates = new Date(publeDate);
										if(mapper.selectIsbn(alaIsbnTest) ==null) {
											rank.setBookPubDate(dates);

											//										out.println("예스24순위:"+k);
											rank.setBookTitle(alaTitle);
											rank.setBookAuthor(alaAuthorTest);
											rank.setBookImg(alaImgTest);
											rank.setBookPublisher(publisherTest);
											rank.setIsbn(alaIsbnTest);
											//											rank.setBookPubDate(bookPubDate);
											//											rank.setBestsellerWeek(date.toLocaleString());
											mapper.insertRanking(rank);
											++rankingNo;
										}	
										if(mapper.seorakRankingtitlecheck(alaTitle)!=null ) {
											//alaTitle
											best.setYpbooksRank(ll);
											best.setBookTitle(mapper.selectTitle(alaTitle));
//											best.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
											mapper.updateBookRankingypbooksRank(best);
//											String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
//											System.out.println("date_s:"+date_s);//날짜
//											SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
//											Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
//											best.setBestsellerWeek(date3);
//											mapper.insertTotalBestRankyes24(best);
										}else {
										
											best.setYpbooksRank(ll);

											
											best.setBookTitle(mapper.selectTitle(alaTitle));
											best.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
											String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
											System.out.println("date_s:"+date_s);//날짜
											SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
											Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
											best.setBestsellerWeek(dt.parse(date_s));
											mapper.insertYPRanking(best);
											
										}
									}
								}

							}
						}
					case 6:
						//						out.println("모닝");
						Document morning365 = Jsoup.connect
						("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"morning365"+"&cate="+"total"+"&bestWeek="+cal.YEAR+"-"+9+"-"+5+"&indexCount=1&type=list").get();
						Elements morningList =morning365.select(".basic >li");
						for(Element  e:morningList) {
							Elements bidList=e.select(" dl > dt");
							String bidListsDetail = bidList.html().substring(9, 80);


							int num = bidListsDetail.indexOf("\"");
							String bResult;bResult =bidListsDetail.substring(0,(bidListsDetail.substring(num).indexOf("\"")+num));
							out.println(bResult+"<br>");
							Document isbn= Jsoup.connect(bResult).get();
							Elements dIsbn = isbn.select(".spot");

							for(Element c: dIsbn) {

								Elements title = c.select(".book_info>h2>a");
								//								out.println(title.html().toString());

								no++;


								Elements author = c.select(".book_info_inner>div");
								//									out.println(author.text());
								if(author.contains("|네티즌리뷰 ")==true) {
									int author1 = author.indexOf("|네티즌리뷰");


									String Rauthor = author.text().toString().substring(author1, author1);
									Elements Risbn = c.select("div");
									String result = Risbn.text();
									//									out.println(result);
								}
								Elements Risbn = c.select("div");
								String result = Risbn.text();


								//								out.println("<br>순위"+k);

								if(result.contains("|ISBN ")==true) {

									int isbn1=result.indexOf("|ISBN");
									String result2 = result.substring(isbn1+6,isbn1+19);//9788934982975
									out.println("isbn:"+result2+"<br>");

									Document kdoc = Jsoup.connect("http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttba12345555582050001&ItemIdType=ISBN13&ItemId="+result2).get();	
									Elements AlaTitle =kdoc.select("object");
									for(Element t : AlaTitle) {
										Elements alaTitleResult = t.select("item>title");
										String alaTitle =alaTitleResult.html().toString();
										//										out.println("알라딘 제목:"+alaTitle+"<br>");
										Elements alaAuthor = t.select("item>author");
										String alaAuthorTest = alaAuthor.html().toString();
										//										out.print("알라딘 저자:"+alaAuthorTest+"<br>");

										Elements alaImg = t.select("item >cover");
										String alaImgTest = alaImg.html().toString();
										//										out.print("알라딘 이미지"+alaImgTest+"<br>");
										Elements publisher= t.select("item >publisher");
										String publisherTest = publisher.html().toString();
										//										out.print("알라딘 출판사"+publisherTest+"<br>");
										Elements  alaIsbn = t.select("item >isbn13");
										String alaIsbnTest = alaIsbn.html().toString();
										//										out.print("알라딘 isbn13"+alaIsbnTest+"<br>");

										Elements pubDate = t.select("item>pubDate");
										String publeDate = pubDate.html();


										Date dates = new Date(publeDate);
										if(mapper.selectIsbn(alaIsbnTest) ==null) {
											rank.setBookPubDate(dates);

											//										out.println("예스24순위:"+k);
											rank.setBookTitle(alaTitle);
											rank.setBookAuthor(alaAuthorTest);
											rank.setBookImg(alaImgTest);
											rank.setBookPublisher(publisherTest);
											rank.setIsbn(alaIsbnTest);

											mapper.insertRanking(rank);
											++rankingNo;
										}	
										if(mapper.seorakRankingtitlecheck(alaTitle)!=null ) {
											//alaTitle
											best.setMorning24Rank(k);
											best.setBookTitle(mapper.selectTitle(alaTitle));
//											best.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
											mapper.updateBookRankingmorning24Rank(best);
//											String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
//											System.out.println("date_s:"+date_s);//날짜
//											SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
//											Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
//											best.setBestsellerWeek(date3);
//											mapper.insertTotalBestRankyes24(best);
										}else {
										
											best.setMorning24Rank(k);//morning365

											
											best.setBookTitle(mapper.selectTitle(alaTitle));
											best.setIsbn(mapper.selectIsbnbyTitle(alaTitle));
											String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
											System.out.println("date_s:"+date_s);//날짜
											SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
											Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
											best.setBestsellerWeek(dt.parse(date_s));
											mapper.insertTotalBestRankyes24(best);
											
										}
									}
								}

							}
						}
					}//switch
				}

//				for(int z = 1 ; z <= 7  ; z++) {
//					switch(z) {
//					case 1: Document titleandRanking = Jsoup.connect
//							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"yes24"+"&cate="+"total"+"&bestWeek="+cal.YEAR+"-"+9+"-"+5+"&indexCount=1&type=list").get();
//					Elements titleno = titleandRanking.select(".basic");
//					int yes24Index = 0 ;
//					for(Element e : titleno) {
//						int yes24Ranking = yes24Index++;
//						Elements title =e.select("dt>a");
//						String yes24Title =title.html();
//						if(mapper.seorakRankingtitlecheck(yes24Title)==null){
//							try {
//
//								best.setBookTitle(yes24Title);
//								best.setIsbn(rank.getIsbn());
//								best.setYes24Rank(yes24Ranking);
//								String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
//								System.out.println("date_s:"+date_s);//날짜
//								SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
//								Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
//								best.setBestsellerWeek(date3);
//								mapper.insertTotalBestRankyes24(best);
//
//								//									SimpleDateFormat dt1 = new SimpleDateFormat("yyyy-mm-ww");
//								//									System.out.println(dt1.format(date3));//주로 변환
//								//									SimpleDateFormat dt3 = new SimpleDateFormat("yyyy-MM-dd");									
//								//									Date	date4 = dt3.parse(dt1.format(date3));//다시 날짜로 변환
//							} catch (ParseException e1) {
//								// TODO Auto-generated catch block
//								e1.printStackTrace();
//							}
//						}
//					}
//					case 2 :Document kyoboRank = Jsoup.connect
//							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"kyobo"+"&cate="+"total"+"&bestWeek="+cal.YEAR+"-"+9+"-"+5+"&indexCount=1&type=list").get();
//					Elements kyobo = kyoboRank.select(".basic");
//				
//					for(Element e : kyobo) {
//						int kyoboRanking = kyoboIndex++;
//						Elements title =e.select("dt>a");
//						String kyoboTitle =title.html();
//						String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
//						System.out.println("date_s:"+date_s);//날짜
//						SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
//						Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
//						best.setBestsellerWeek(date3);
//						if(mapper.checkWeekDate(date3) != null){
//							String forCheckingkyoboTitle=kyoboTitle;
//							//									SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
//							//									best.setBookTitle(kyoboTitle);
//							if(mapper.seorakRankingtitlecheck(forCheckingkyoboTitle) != null) {
//
//								best.setKyoboRank(kyoboRanking);
//								mapper.updateBookRankingkyobo(best);
//							}
//						}
//					}
//					case 4 :Document aladdinank = Jsoup.connect
//							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"aladdin"+"&cate="+"total"+"&bestWeek="+cal.YEAR+"-"+9+"-"+5+"&indexCount=1&type=list").get();
//					Elements aladdin = aladdinank.select(".basic");
//					int aladdinIndex = 0 ;
//					for(Element e : aladdin) {
//						int kyoboRanking = aladdinIndex++;
//						Elements title =e.select("dt>a");
//						String aladdinTitle =title.html();
//						String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
//						System.out.println("date_s:"+date_s);//날짜
//						SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
//						Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
//						best.setBestsellerWeek(date3);
//						if(mapper.checkWeekDate(date3) != null){
//							String forCheckingTitle=aladdinTitle;
//							//									SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
//							//									best.setBookTitle(kyoboTitle);
//							if(mapper.seorakRankingtitlecheck(forCheckingTitle) != null) {
//
//								best.setAladdinRank(kyoboRanking);
//								mapper.updateBookRankingaladdin(best);;
//							}
//
//
//
//
//
//						}
//
//
//					}
//					case 5 :Document  bandilank = Jsoup.connect
//							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"bandi"+"&cate="+"total"+"&bestWeek="+cal.YEAR+"-"+9+"-"+5+"&indexCount=1&type=list").get();
//					Elements bandi = bandilank.select(".basic");
//					int bandiIndex = 0 ;
//					for(Element e : bandi) {
//						int bandiRanking = bandiIndex++;
//						Elements title =e.select("dt>a");
//						String bandiTitle =title.html();
//						String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
//						System.out.println("date_s:"+date_s);//날짜
//						SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
//						Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
//						best.setBestsellerWeek(date3);
//						if(mapper.checkWeekDate(date3) != null){
//							String forCheckingTitle=bandiTitle;
//							//									SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
//							//									best.setBookTitle(kyoboTitle);
//							if(mapper.seorakRankingtitlecheck(forCheckingTitle) != null) {
//
//								best.setBandiRank(bandiRanking);
//								mapper.updateBookRankingbandi(best);
//							}
//
//
//
//
//
//						}
//
//
//					}
//					case 6 :Document  bookparklank = Jsoup.connect
//							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"bookpark"+"&cate="+"total"+"&bestWeek="+cal.YEAR+"-"+9+"-"+5+"&indexCount=1&type=list").get();
//					Elements bookpark = bookparklank.select(".basic");
//					int bookparkIndex = 0 ;
//					for(Element e : bookpark) {
//						int bookparkRanking = bookparkIndex++;
//						Elements title =e.select("dt>a");
//						String bandiTitle =title.html();
//						String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
//						System.out.println("date_s:"+date_s);//날짜
//						SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
//						Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
//						best.setBestsellerWeek(date3);
//						if(mapper.checkWeekDate(date3) != null){
//							String forCheckingTitle=bandiTitle;
//							//									SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
//							//									best.setBookTitle(kyoboTitle);
//							if(mapper.seorakRankingtitlecheck(forCheckingTitle) != null) {
//
//								best.setBookparkRank(bookparkRanking);
//								mapper.updateBookRankingbookpark(best);
//							}
//						}
//					}
//					case 7 :Document  yplank = Jsoup.connect
//							("https://book.naver.com/bestsell/bestseller_list.nhn?cp="+"ypbooks"+"&cate="+"total"+"&bestWeek="+cal.YEAR+"-"+9+"-"+5+"&indexCount=1&type=list").get();
//					Elements yppark = yplank.select(".basic");
//					int ypIndex = 0 ;
//					for(Element e : yppark) {
//						int ypRanking = ypIndex++;
//						Elements title =e.select("dt>a");
//						String ypTitle =title.html();
//						String date_s =  date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-");
//						System.out.println("date_s:"+date_s);//날짜
//						SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
//						Date date3 = dt.parse(date.toLocaleString().substring(0, 11).toString().replaceAll(". ", "-"));//디비에 넣을것//뽑을땐 주로 변환해서 뽑을것
//						best.setBestsellerWeek(date3);
//						if(mapper.checkWeekDate(date3) != null){
//							String forCheckingTitle=ypTitle;
//							//									SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
//							//									best.setBookTitle(kyoboTitle);
//							if(mapper.seorakRankingtitlecheck(forCheckingTitle) != null) {
//
//								best.setYpbooksRank(ypRanking);
//								mapper.updateBookRankingypbooksRank(best);
//							}
//						}
//					}
//					}//switch
//				}

			}
		} catch (IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} /*catch (ParseException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}*/

	}

}
