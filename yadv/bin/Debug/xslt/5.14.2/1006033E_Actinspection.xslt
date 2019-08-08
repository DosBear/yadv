<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:ain="urn:customs.ru:Information:CustomsDocuments:ActInspection:5.14.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="ain:ActInspection">
		<html>
			<head>
				<title>Акт таможенного досмотра (таможенного осмотра)</title>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
							
						div.page {
							width: 210mm;
							//height: 297mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	20mm;
							background: #ffffff;
							border: solid 1pt #000000;
							}
						
						div.goods {
							background: #ffffff;
							}
							
						.bordered {
							border: solid 1pt #000000;
							padding-top:4pt;
							padding-bottom:4pt;
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
							
						.underlined {
							border-bottom: solid 0.8pt #000000;
							}
							
						p.NumberDate {
							font-weight: bold;
							}
							
						.graph {
							font-family: Arial;
							font-size: 9pt;
							}
							
							.graphtop {
							font-family: Arial;
							font-size: 7pt;
							border-top:solid 0.8pt #000000;
							}

							
						.graphBold {
							font-family: Arial;
							font-size: 10pt;
							font-weight: bold;
							}
							
						td {
							font-family:Arial;
							font-size: 10pt;
							}
		
						.graphMain {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
							
						.graphNo {
							font-size: 10pt;
							font-weight: bold;
							}
					</style>
			</head>
			<body>
				<xsl:choose>
					<xsl:when test="not(ain:InspectionResults/ain:MPO)">
						<div class="page">
							<table cellpadding="0" cellspacing="0" style="width:100%">
								<tbody>
									<tr>
										<td align="center" class="graphMain" style="width:100%">
											<xsl:if test="ain:Customs/cat_ru:Code">
												<xsl:value-of select="ain:Customs/cat_ru:Code"/>, </xsl:if>
											<xsl:value-of select="ain:Customs/cat_ru:OfficeName"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">(наименование таможенного органа)<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<xsl:choose>
											<xsl:when test="ain:ActType='1'">
												<td align="center" class="graphMain" style="width:100%">Акт таможенного осмотра<br/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td align="center" class="graphMain" style="width:100%">Акт таможенного досмотра <br/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
									</tr>
									<tr>
										<td align="center" class="graph" style="width:100%">№<xsl:value-of select="ain:ActNumber"/>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="right" class="" style="width:100%">
											<!--span class="underlined"><xsl:value-of select="ain:ActSheetNumber"/></span>листов
									<br/-->
											<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">Время начала таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра</xsl:when>
												<xsl:otherwise>досмотра</xsl:otherwise>
											</xsl:choose>
											<xsl:text> </xsl:text>
											<xsl:value-of select="substring(ain:BeginInspectionTime,1,8)"/>
											<xsl:text> </xsl:text>Дата <xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="ain:BeginInspectionDate"/>
											</xsl:call-template>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%"> Настоящий акт составлен в соответствии со статьей 328 (327) Таможенного кодекса Евразийского экономического союза о том, что должностным (должностными) лицом (лицами):<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph" style="width:100%">
											<xsl:for-each select="ain:ATDCustomsPerson">
												<xsl:if test="catESAD_ru:OfficialStatus = '1'">
													<xsl:value-of select="cat_ru:PersonPost"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="cat_ru:PersonSurname"/> 
										<xsl:value-of select="cat_ru:PersonName"/> 
										<xsl:value-of select="cat_ru:PersonMiddleName"/> 
									</xsl:if>
												<xsl:if test="catESAD_ru:OfficialStatus = '2'">
													<xsl:value-of select="cat_ru:PersonPost"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="cat_ru:PersonSurname"/> 
										<xsl:value-of select="cat_ru:PersonName"/> 
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
													<xsl:if test="catESAD_ru:OTOFlag = '1'">(должностное лицо, не являющееся должностным лицом таможенного поста (ОТОиТК))</xsl:if> 
										<xsl:if test="catESAD_ru:OTOFlag = '2'">(уполномоченное должностное лицотаможенного поста (ОТОиТК))</xsl:if> 
										<xsl:value-of select="catESAD_ru:LawAct"/>
													<!--xsl:if test="catESAD_ru:SignatureFlag = 'false'">АТД не подписано</xsl:if>&#160;<xsl:if test="catESAD_ru:SignatureFlag = 'true'">АТД подписано</xsl:if--> 
										<xsl:value-of select="catESAD_ru:LNP"/>
												</xsl:if>
												<xsl:if test="position()!=last()">
													<xsl:text>, </xsl:text>
												</xsl:if>
											</xsl:for-each>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">(должность, фамилии, инициалы должностных лиц)</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
								в присутствии: 
								<xsl:choose>
												<xsl:when test="ain:InspectionParticipant/ain:Status='3'">
декларанта, лица, обладающего полномочиями в отношении товаров (транспортных средств), либо их представителей:<br/>
												</xsl:when>
												<xsl:when test="not(ain:InspectionParticipant/ain:Status='3')">
													<s>декларанта, лица, обладающего полномочиями в отношении товаров (транспортных средств), либо их представителей</s>:<br/>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<xsl:if test="ain:InspectionParticipant/ain:Status='3'">
										<tr>
											<td class="graph" style="width:100%">
												<br/>
												<!--xsl:if test="(ain:InspectionParticipant/ain:Status !='понятой') and (substring(ain:InspectionParticipant/ain:Status, 1,10) !='специалист')"-->
												<xsl:for-each select="ain:InspectionParticipant">
													<xsl:if test="ain:Status='3'">
														декларант (иное лицо, уполномоченное в отношении товаров)
											<xsl:value-of select="cat_ru:PersonSurname"/> <xsl:value-of select="cat_ru:PersonName"/> <xsl:value-of select="cat_ru:PersonMiddleName"/> ,
											
														<xsl:if test="ain:Job">
															<xsl:value-of select="ain:Job"/>
															<xsl:text> ,</xsl:text>
														</xsl:if>
														<xsl:if test="cat_ru:PersonPost">
															<xsl:value-of select="cat_ru:PersonPost"/>,</xsl:if>
															<xsl:apply-templates mode="card" select="ain:ParticipantDocs"/>
													</xsl:if>
												</xsl:for-each>
												<!--/xsl:if-->
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td align="center" class="graphtop" style="width:100%">(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)<br/>
										</td>
									</tr>
									<xsl:if test="ain:ActType=0">
										<tr>
											<td class="graph" style="width:100%">
												<br/> понятых (на основании пункта 7 статьи 328 Таможенного кодекса Евразийского экономического союза):<br/>
												<br/>
												<xsl:for-each select="//ain:InspectionParticipant[ain:Status ='4']">
												понятой
											<xsl:value-of select="cat_ru:PersonSurname"/> <xsl:value-of select="cat_ru:PersonName"/> <xsl:value-of select="cat_ru:PersonMiddleName"/> ,
											<xsl:if test="ain:Job">
														<xsl:value-of select="ain:Job"/>,</xsl:if>
													<xsl:if test="cat_ru:PersonPost">
														<xsl:value-of select="cat_ru:PersonPost"/>,</xsl:if>
													<xsl:apply-templates mode="card" select="ain:ParticipantDocs"/>
												</xsl:for-each>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphtop" style="width:100%"> (место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)<br/>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">
												<br/>с участием специалиста (эксперта):<br/>
												<xsl:for-each select="ain:InspectionParticipant">
													<xsl:if test="ain:Status='5'">
														специалист
											<xsl:value-of select="cat_ru:PersonSurname"/> <xsl:value-of select="cat_ru:PersonName"/> <xsl:value-of select="cat_ru:PersonMiddleName"/> ,
											<xsl:if test="ain:Job">
															<xsl:value-of select="ain:Job"/>,</xsl:if>
														<xsl:if test="cat_ru:PersonPost">
															<xsl:value-of select="cat_ru:PersonPost"/>,</xsl:if>
														<xsl:apply-templates mode="card" select="ain:ParticipantDocs"/>
													</xsl:if>
												</xsl:for-each>
												<br/>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphtop" style="width:100%"> (место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)<br/>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%">
											<br/>[ <xsl:choose>
												<xsl:when test="not(ain:InspectionParticipant/ain:Status='3')">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:when test="ain:InspectionParticipant/ain:Status='3'">
													<span class="graphBold">–</span>
												</xsl:when>
											</xsl:choose> ]
							
													Таможенный досмотр проведен в отсутствие декларанта или иного лица, обладающего полномочиями в отношении товаров (их представителей) по причине:<xsl:value-of select="ain:InspectionParticipant/ain:Reason"/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>[ <xsl:choose>
												<xsl:when test="ain:ActType=0">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:when test="ain:ActType!=0">
													<span class="graphBold">–</span>
												</xsl:when>
											</xsl:choose> ]
							
												– проведен таможенный досмотр</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>[ <xsl:choose>
												<xsl:when test="ain:ActType=1">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:when test="ain:ActType!=1">
													<span class="graphBold">–</span>
												</xsl:when>
											</xsl:choose> ]
							
												– проведен таможенный осмотр</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>товара (партии товаров либо транспортного средства), отправленного(й) отправителем (заполняется при вывозе): </td>
									</tr>
									<tr>
										<td align="center" class="graph" style="width:100%">
											<xsl:apply-templates mode="org" select="ain:Consignor"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (наименование организации; УНН/УНП/БИН, или ИИН/ИНН, или ПИН/ИНН и КПП; для физического лица – Ф.И.О., наименование и номер документа, удостоверяющего личность)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>из (в):<xsl:text> </xsl:text>
											<xsl:choose>
												<xsl:when test="translate(ain:Consignee/cat_ru:Address/cat_ru:CountryCode,'ru','RU') != 'RU'">
													<xsl:value-of select="ain:Consignee/ain:DestinCountry"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:if test="translate(ain:Consignor/cat_ru:Address/cat_ru:CountryCode,'ru','RU') != 'RU'">
														<xsl:value-of select="ain:Consignor/ain:DepartCountry"/>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (страна)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>в адрес получателя (заполняется при ввозе):
														</td>
									</tr>
									<tr>
										<td align="center" class="graph" style="width:100%">
											<xsl:apply-templates mode="org" select="ain:Consignee"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (наименование организации; УНН/УНП/БИН, или ИИН/ИНН, или ПИН/ИНН и КПП; для физического лица – Ф.И.О., наименование и номер документа, удостоверяющего личность)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/><xsl:text>по документам: </xsl:text>
											<xsl:for-each select="ain:AccDocs">
												<xsl:value-of select="cat_ru:PrDocumentName"/> № <xsl:value-of select="cat_ru:PrDocumentNumber"/> от <xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
												</xsl:call-template>
												<xsl:text> </xsl:text>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (таможенная декларация, книжка МДП, транспортные (перевозочные) документы, коммерческие и иные документы)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>Место проведения таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра</xsl:when>
												<xsl:otherwise>досмотра</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>
							Код таможенного органа <xsl:value-of select="ain:InspectionPlace/cat_ru:Code"/>
											<xsl:if test="ain:InspectionPlace/cat_ru:OfficeName">
							наименование таможенного органа <xsl:value-of select="ain:InspectionPlace/cat_ru:OfficeName"/>
												<br/>
											</xsl:if>
							Вид информации о месте досмотра (таможенного осмотра)
							 <xsl:choose>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 11">СВХ</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 21">ТС</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 25">Свободный склад</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 31">Склад получателя</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 39">Склад иной</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 51">Ж/д / название ж/д станции</xsl:when>
												<xsl:otherwise>Местонахождение ЗТК (адрес)</xsl:otherwise>
											</xsl:choose>
                    наименование места досмотра <xsl:value-of select="ain:InspectionPlace/ain:InspPlaceName"/> 
                    Описание места проведения досмотра (таможенного осмотра). Иная информация о месте досмотра<xsl:text> </xsl:text>
											<xsl:for-each select="ain:InspectionPlace/ain:InspPlaceDesc">
												<xsl:value-of select="."/>
											</xsl:for-each>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ain:InspectionPlace/ain:WarehousePlace"/>
											<xsl:apply-templates select="ain:InspectionPlace/ain:InspAddress"/>
										</td>
									</tr>
									<xsl:if test="ain:ActType=0">
										<tr>
											<td class="graph" style="width:100%">
												<br/>
									
							Применялись технические средства таможенного контроля:
                                    <!--<xsl:for-each select="ain:UseTMCC">
													<xsl:value-of select="."/>&#160;</xsl:for-each>-->
												<xsl:for-each select="ain:UseTMCC">
													<xsl:value-of select="ain:TSTKCode"/>
													<xsl:if test="ain:Comments"> - <xsl:value-of select="ain:Comments"/>
													</xsl:if>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%">Предъявлен:</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">[ <xsl:choose>
												<xsl:when test="ain:NumberOfPlaces">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="graphBold">–</span>
												</xsl:otherwise>
											</xsl:choose> ]
							– товар из <u>
												<xsl:value-of select="ain:NumberOfPlaces"/>
											</u> мест. Вес брутто по документам <u>
												<xsl:choose>
													<xsl:when test="(ain:BruttoWeightDocs) and (ain:BruttoWeightDocs !='0')">
														<xsl:value-of select="ain:BruttoWeightDocs"/>
													</xsl:when>
													<xsl:otherwise>–</xsl:otherwise>
												</xsl:choose>
											</u> кг.</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">[ <xsl:choose>
												<xsl:when test="ain:InspTransport">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="graphBold">–</span>
												</xsl:otherwise>
											</xsl:choose>
									] –  транспортное средство: регистрационный номер: <xsl:apply-templates select="ain:InspTransport/ain:InspTransportMean"/> 
									<xsl:if test="ain:InspTransport/ain:ContainerInfo">
												<xsl:value-of select="ain:InspTransport/ain:ContainerInfo/ain:ContainerIdentificator"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="graphBold" style="width:100%"><br/>В результате таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра</xsl:when>
												<xsl:otherwise>досмотра</xsl:otherwise>
											</xsl:choose> установлено следующее:</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%"> Уровень радиационного фона составляет:<xsl:value-of select="ain:InspectionResults/ain:Radiation/ain:RadValue"/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
							Измерения проводились прибором  <xsl:value-of select="ain:InspectionResults/ain:Radiation/ain:DeviceName"/> № <xsl:value-of select="ain:InspectionResults/ain:Radiation/ain:DeviceNumber"/>
										</td>
									</tr>
									<xsl:if test="ain:ActType=0">
										<tr>
											<td class="graph" style="width:100%">Фактический вес товара нетто <xsl:value-of select="ain:InspectionResults/ain:FactWeight/ain:Netto"/> кг, брутто <xsl:value-of select="ain:InspectionResults/ain:FactWeight/ain:Brutto"/>кг
							</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">определен способом:
							</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">
							[ <xsl:choose>
													<xsl:when test="//ain:InspectionResults/ain:FactWeight/ain:FWMethod=0">
														<span class="graphBold">х</span>
													</xsl:when>
													<xsl:otherwise><span class="graphBold">–</span></xsl:otherwise>
												</xsl:choose> ] фактического взвешивания
							</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">
							[ <xsl:choose>
													<xsl:when test="//ain:InspectionResults/ain:FactWeight/ain:FWMethod=1">
														<span class="graphBold">х</span>
													</xsl:when>
													<xsl:otherwise><span class="graphBold">–</span></xsl:otherwise>
												</xsl:choose> ] определения среднего веса одного места взвешиванием <xsl:value-of select="ain:InspectionResults/ain:FactWeight/ain:WeighPlacesNumber"/> мест,
							</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">
							вес которых составил соответственно: 
							<xsl:for-each select="ain:InspectionResults/ain:FactWeight/ain:PlaceWeight">
													<xsl:value-of select="."/>кг,
							</xsl:for-each>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">
							[ <xsl:choose>
													<xsl:when test="//ain:InspectionResults/ain:FactWeight/ain:FWMethod=2">
														<span class="graphBold">х</span>
													</xsl:when>
													<xsl:otherwise><span class="graphBold">–</span></xsl:otherwise>
												</xsl:choose> ] расчетным
							</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">
							[ <xsl:choose>
													<xsl:when test="//ain:InspectionResults/ain:FactWeight/ain:FWMethod=3">
														<span class="graphBold">х</span>
													</xsl:when>
													<xsl:otherwise><span class="graphBold">–</span></xsl:otherwise>
												</xsl:choose> ]  иным <xsl:apply-templates select="ain:InspectionResults/ain:FactWeight/ain:WFMetodsComments"/>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphtop" style="width:100%"> (указывается способ)<br/>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%">
							Транспортное средство (транспортные средства) прибыло(и) в качестве товара:
							</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
							[ <xsl:choose>
												<xsl:when test="(ain:InspTransport/ain:ArriveMode='1') or (ain:InspTransport/ain:ArriveMode='2')">
													<span class="graphBold">х</span>
												</xsl:when>
													<xsl:otherwise><span class="graphBold">–</span></xsl:otherwise>
											</xsl:choose>
							]  – 
							<xsl:choose>
												<xsl:when test="ain:InspTransport/ain:ArriveMode='1'">на транспортном средстве, <del>в контейнере(ах),</del>
												</xsl:when>
												<xsl:when test="ain:InspTransport/ain:ArriveMode='2'">
													<del>на транспортном средстве</del>, в контейнере(ах),</xsl:when>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="ain:InspTransport/ain:ArriveMode='1'">номер(а) транспортных средств/<del>контейнеров:</del>
												</xsl:when>
												<xsl:when test="ain:InspTransport/ain:ArriveMode='2'">
													<del>номер(а) транспортных средств</del>/контейнеров:</xsl:when>
											</xsl:choose>
											<xsl:apply-templates select="ain:InspTransport[ain:ArriveMode='1' or ain:ArriveMode='2']/ain:InspTransportMean"/>
											<xsl:if test="ain:InspTransport/ain:ContainerInfo">
												<xsl:apply-templates select="ain:InspTransport/ain:ContainerInfo"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (ненужное зачеркнуть)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
									[ <xsl:choose>
												<xsl:when test="ain:InspTransport/ain:ArriveMode='3'">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="graphBold">–</span>
												</xsl:otherwise>
											</xsl:choose>
							]  – своим ходом <u>
												<xsl:apply-templates select="ain:InspTransport[ain:ArriveMode='3']/ain:InspTransportMean"/>
												<xsl:if test="ain:InspTransport/ain:ContainerInfo">
													<xsl:apply-templates select="ain:InspTransport/ain:ContainerInfo"/>
												</xsl:if>
											</u>
										</td>
									</tr>
									<tr>
										<td/>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
							Средства идентификации:	без средств идентификации [ <xsl:choose>
												<xsl:when test="ain:InspectionResults/ain:IdentifyMean">
													<span class="graphBold">–</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="graphBold">х</span>
												</xsl:otherwise>
											</xsl:choose> ]
							</td>
									</tr>
									<tr>
										<td align="center" class="graph" style="width:100%">
							средства идентификации	[ 
							<xsl:choose>
												<xsl:when test="(number(ain:InspectionResults/ain:IdentifyMean/ain:IdentBreakFlag)=0) or (ain:InspectionResults/ain:IdentifyMean/ain:IdentBreakFlag = 'false') or (ain:InspectionResults/ain:IdentifyMean/ain:IdentBreakFlag = 'f')">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="graphBold">–</span>
												</xsl:otherwise>
											</xsl:choose>	] – не нарушены	
							[ <xsl:choose>
												<xsl:when test="(number(ain:InspectionResults/ain:IdentifyMean/ain:IdentBreakFlag)=1) or (ain:InspectionResults/ain:IdentifyMean/ain:IdentBreakFlag = 'true') or (ain:InspectionResults/ain:IdentifyMean/ain:IdentBreakFlag = 't')">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="graphBold">–</span>
												</xsl:otherwise>
											</xsl:choose>	] – нарушены
							</td>
									</tr>
									<xsl:if test="ain:InspectionResults/ain:IdentifyMean">
										<tr>
											<td class="graph" style="width:100%">
												<xsl:for-each select="ain:InspectionResults/ain:IdentifyMean">
													<xsl:if test="ain:IdentMeanState=1">Средство идентификации до начала проведения таможенного досмотра</xsl:if>
													<xsl:if test="ain:IdentMeanState=2">Средство идентификации после проведения таможенного досмотра (наложенные)</xsl:if>
													номер 
													<xsl:value-of select="ain:IdentNumber"/> вид 
													<xsl:if test="ain:IdentKind=1">пломба</xsl:if>
													<xsl:if test="ain:IdentKind=2">печать</xsl:if>
													<xsl:if test="ain:IdentKind=3">иное</xsl:if>
													<xsl:text> </xsl:text>
													<xsl:value-of select="ain:IdentDesc"/>
													<xsl:if test="position()!=last()"><br/></xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (описание средства идентификации, количество)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%"/>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>К акту прилагаются: <xsl:value-of select="ain:InspectionResults/ain:ApplicMarks"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (документы, фотографии, этикетки и т.п.)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<xsl:choose>
												<xsl:when test="ain:Seize/ain:Presence = '0'">
													[ <span class="graphBold">х</span> ] Изъятий не производилось.
												</xsl:when>
												<xsl:otherwise>
													<s>[<b>–</b>] Изъятий не производилось.</s>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<xsl:choose>
												<xsl:when test="ain:PackingMonitoringFlag = '1'">
													[ <span class="graphBold">x</span> ] Грузовые места упакованы в нашем присутствии.
												</xsl:when>
												<xsl:otherwise>
													[ <span class="graphBold">–</span> ] Грузовые места упакованы в нашем присутствии.
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<xsl:if test="(ain:Seize/ain:SeizeAct) and (ain:ActType=0)">
										<tr>
											<td class="graph" style="width:100%">
												Произведен отбор проб и (или) образцов товаров по акту от 
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="ain:Seize/ain:SeizeAct/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
							
							№ <xsl:value-of select="ain:Seize/ain:SeizeAct/cat_ru:PrDocumentNumber"/>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%">
							Обнаружены признаки правонарушений:  <xsl:value-of select="ain:InspectionResults/ain:AKParts"/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
							Наложены средства идентификации <xsl:value-of select="ain:InspectionResults/ain:NewIdentMarks"/> в количестве <xsl:value-of select="ain:InspectionResults/ain:NumberOfNewIdentMarks"/> шт
							</td>
									</tr>
									<xsl:for-each select="ain:ATDCustomsPerson">
										<tr>
											<td class="graph" style="width:100%">
							Должностные лица: <xsl:value-of select="cat_ru:PersonSurname"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="cat_ru:PersonName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="cat_ru:PersonMiddleName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="catESAD_ru:LNP"/>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы, личная номерная печать)<br/>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td class="graph" style="width:100%">
							в присутствии
							
							<xsl:for-each select="//ain:InspectionParticipant[ain:Status ='3' or ain:Status ='4']">
												<xsl:value-of select="cat_ru:PersonSurname"/> 
										<xsl:value-of select="cat_ru:PersonName"/> 
										<xsl:value-of select="cat_ru:PersonMiddleName"/> 
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
							Эксперт (специалист) 
							<xsl:if test="ain:InspectionParticipant[ain:Status ='5']">
												<xsl:value-of select="ain:InspectionParticipant[ain:Status ='5']/cat_ru:PersonSurname"/> 
										<xsl:value-of select="ain:InspectionParticipant[ain:Status ='5']/cat_ru:PersonName"/> 
										<xsl:value-of select="ain:InspectionParticipant[ain:Status ='5']/cat_ru:PersonMiddleName"/> 
									</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
								Служебные отметки: <xsl:for-each select="ain:CustomsMark">
												<xsl:value-of select="."/> </xsl:for-each>
											<br/>
											<br/>
										</td>
									</tr>
									<xsl:if test="ain:TextAct">
										<tr>
											<td class="graph" style="width:100%">
												<xsl:for-each select="ain:TextAct">
													<table width="100%">
														<tr>
															<td>
																<xsl:for-each select="ain:Paragraph">
																	<span class="graph" style="width:100%">
																		<xsl:apply-templates/>
																	</span>
																</xsl:for-each>
															</td>
														</tr>
													</table>
												</xsl:for-each>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphtop" style="width:100%"> (указываются результаты таможенного досмотра (таможенного осмотра))<br/>
											</td>
										</tr>
										<xsl:for-each select="ain:ATDCustomsPerson">
											<tr>
												<td class="graph" style="width:100%">
							Должностные лица: <xsl:value-of select="cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="cat_ru:PersonMiddleName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="catESAD_ru:LNP"/>
												</td>
											</tr>
											<tr>
												<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы, личная номерная печать)<br/>
												</td>
											</tr>
										</xsl:for-each>
										<tr>
											<td class="graph" style="width:100%">
							в присутствии
							
							<xsl:for-each select="//ain:InspectionParticipant[ain:Status ='3' or ain:Status ='4']">
												<xsl:value-of select="cat_ru:PersonSurname"/> 
										<xsl:value-of select="cat_ru:PersonName"/> 
										<xsl:value-of select="cat_ru:PersonMiddleName"/> 
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы)<br/>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">
							Эксперт (специалист) 
							<xsl:if test="ain:InspectionParticipant[ain:Status ='5']">
													<xsl:value-of select="ain:InspectionParticipant[ain:Status ='5']/cat_ru:PersonSurname"/>
													<xsl:value-of select="ain:InspectionParticipant[ain:Status ='5']/cat_ru:PersonName"/>
													<xsl:value-of select="ain:InspectionParticipant[ain:Status ='5']/cat_ru:PersonMiddleName"/>
												</xsl:if>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы)<br/>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%">Дата и время окончания таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра</xsl:when>
												<xsl:otherwise>досмотра </xsl:otherwise>
											</xsl:choose>
											<xsl:text> </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="ain:EndInspectionDate"/>
											</xsl:call-template>
											<xsl:text> </xsl:text>
											<xsl:value-of select="substring(ain:EndInspectionTime,1,8)"/>
											<xsl:if test="ain:EndComposeDate">
												<xsl:text> </xsl:text>(время завершения составления акта <xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="ain:EndComposeDate"/>
												</xsl:call-template>
												<xsl:if test="ain:EndComposeTime">
													<xsl:text> </xsl:text>
													<xsl:value-of select="ain:EndComposeTime"/>
												</xsl:if>)</xsl:if>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="graph" style="width:40%">
										Второй экземпляр акта получил на руки 
										</td>
														<td align="center" class="graph" style="width:20%">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="ain:SecExempDate"/>
															</xsl:call-template>
															<xsl:text> </xsl:text>
															<xsl:value-of select="substring(ain:SecExempTime, 1, 8 )"/>
														</td>
														<td>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td align="center" class="graph" style="width:20%">
															<xsl:value-of select="ain:InspectionParticipant[ain:ATDReceiveCopy='1' or ain:ATDReceiveCopy='t' or ain:ATDReceiveCopy='true']/cat_ru:PersonSurname"/> 
													<xsl:value-of select="ain:InspectionParticipant[ain:ATDReceiveCopy='1' or ain:ATDReceiveCopy='t' or ain:ATDReceiveCopy='true']/cat_ru:PersonName"/> 
													<xsl:value-of select="ain:InspectionParticipant[ain:ATDReceiveCopy='1' or ain:ATDReceiveCopy='t' or ain:ATDReceiveCopy='true']/cat_ru:PersonMiddleName"/> 
												</td>
													</tr>
													<tr>
														<td align="center" class="graphtop" style="width:40%">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<br/>
														</td>
														<td align="center" class="graphtop" style="width:20%">(дата, время)<br/>
														</td>
														<td align="center" class="graphtop" style="width:20%"> (подпись)<br/>
														</td>
														<td align="center" class="graphtop" style="width:20%"> ( фамилия, инициалы)<br/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="page">
							<table cellpadding="0" cellspacing="0" style="width:100%">
								<tbody>
									<tr>
										<td align="center" class="graphMain" style="width:100%">
											<xsl:if test="ain:Customs/cat_ru:Code">
												<xsl:value-of select="ain:Customs/cat_ru:Code"/>, </xsl:if>
											<xsl:value-of select="ain:Customs/cat_ru:OfficeName"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">(наименование таможенного органа)<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<xsl:choose>
											<xsl:when test="ain:ActType='1'">
												<td align="center" class="graphMain" style="width:100%">Акт таможенного осмотра<br/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td align="center" class="graphMain" style="width:100%">Акт таможенного досмотра <br/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
									</tr>
									<tr>
										<td align="center" class="graph" style="width:100%">№<xsl:value-of select="ain:ActNumber"/>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="right" class="" style="width:100%">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">Время начала таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра</xsl:when>
												<xsl:otherwise>досмотра</xsl:otherwise>
											</xsl:choose>
											<xsl:text> </xsl:text>
											<xsl:value-of select="substring(ain:BeginInspectionTime,1,8)"/>
											<xsl:text> </xsl:text>Дата <xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="ain:BeginInspectionDate"/>
											</xsl:call-template>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%"> Настоящий акт составлен в соответствии со статьей 328 (327) Таможенного кодекса Евразийского экономического союза о том, что должностным (должностными) лицом (лицами):<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph" style="width:100%">
											<xsl:for-each select="ain:ATDCustomsPerson">
												<xsl:if test="catESAD_ru:OfficialStatus = '1'">
													<xsl:value-of select="cat_ru:PersonPost"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="cat_ru:PersonSurname"/> 
													<xsl:value-of select="cat_ru:PersonName"/> 
													<xsl:value-of select="cat_ru:PersonMiddleName"/> 
												</xsl:if>
												<xsl:if test="catESAD_ru:OfficialStatus = '2'">
													<xsl:value-of select="cat_ru:PersonPost"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="cat_ru:PersonSurname"/> 
													<xsl:value-of select="cat_ru:PersonName"/> 
													<xsl:value-of select="cat_ru:PersonMiddleName"/>
													<xsl:if test="catESAD_ru:OTOFlag = '1'">(должностное лицо, не являющееся должностным лицом таможенного поста(ОТОиТК))</xsl:if> 
													<xsl:if test="catESAD_ru:OTOFlag = '2'">(уполномоченное должностное лицотаможенного поста(ОТОиТК))</xsl:if> 
													<xsl:value-of select="catESAD_ru:LawAct"/>
													<xsl:value-of select="catESAD_ru:LNP"/>
												</xsl:if>
												<xsl:if test="position()!=last()">
													<xsl:text>, </xsl:text>
												</xsl:if>
											</xsl:for-each>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">(должность, фамилии, инициалы должностных лиц)</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%;">
								в присутствии: 
								<xsl:for-each select="ain:InspectionParticipant">
												<xsl:choose>
													<xsl:when test="ain:Status ='6'">
														<u>оператора почтовой связи</u>
													</xsl:when>
													<xsl:when test="ain:Status ='3'">
														<u>декларанта или иного лица, обладающего полномочиями в отношении товаров (их представителей)</u>
													</xsl:when>
													<xsl:when test="ain:Status ='4'">
														<u>понятых</u>
													</xsl:when>
												</xsl:choose>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<xsl:for-each select="ain:InspectionParticipant">
												<xsl:choose>
													<xsl:when test="ain:Status ='6'">
														оператор почтовой связи <xsl:if test="ain:Job">Место работы <xsl:value-of select="ain:Job"/>
														</xsl:if>
														<xsl:if test="cat_ru:PersonPost"> <xsl:value-of select="cat_ru:PersonPost"/>
														</xsl:if>
														<xsl:if test="cat_ru:PersonSurname"> <xsl:value-of select="cat_ru:PersonSurname"/>
														</xsl:if>
														<xsl:if test="cat_ru:PersonName"> <xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>.</xsl:if>
														<xsl:if test="cat_ru:PersonMiddleName"> <xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
													</xsl:when>
													<xsl:when test="ain:Status ='3'">
														декларант или иное лицо, обладающее полномочиями в отношении товаров <xsl:if test="ain:Job">Место работы <xsl:value-of select="ain:Job"/>
														</xsl:if>
														<xsl:if test="cat_ru:PersonPost"> <xsl:value-of select="cat_ru:PersonPost"/>
														</xsl:if>
														<xsl:if test="cat_ru:PersonSurname"> <xsl:value-of select="cat_ru:PersonSurname"/>
														</xsl:if>
														<xsl:if test="cat_ru:PersonName"> <xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>.</xsl:if>
														<xsl:if test="cat_ru:PersonMiddleName"> <xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
													</xsl:when>
													<xsl:when test="ain:Status ='4'">
														понятой <xsl:if test="ain:Job">Место работы <xsl:value-of select="ain:Job"/>
														</xsl:if>
														<xsl:if test="cat_ru:PersonPost"> <xsl:value-of select="cat_ru:PersonPost"/>
														</xsl:if>
														<xsl:if test="cat_ru:PersonSurname"> <xsl:value-of select="cat_ru:PersonSurname"/>
														</xsl:if>
														<xsl:if test="cat_ru:PersonName"> <xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>.</xsl:if>
														<xsl:if test="cat_ru:PersonMiddleName"> <xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
													</xsl:when>
												</xsl:choose>
											</xsl:for-each>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>с участием специалиста (эксперта):<br/>
											<xsl:for-each select="ain:InspectionParticipant">
												<xsl:if test="ain:Status='5'">
														специалист <xsl:if test="ain:Job">Место работы <xsl:value-of select="ain:Job"/>
													</xsl:if>
													<xsl:if test="cat_ru:PersonPost"> <xsl:value-of select="cat_ru:PersonPost"/>
													</xsl:if>
													<xsl:if test="cat_ru:PersonSurname"> <xsl:value-of select="cat_ru:PersonSurname"/>
													</xsl:if>
													<xsl:if test="cat_ru:PersonName"> <xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>.</xsl:if>
													<xsl:if test="cat_ru:PersonMiddleName"> <xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
													<xsl:apply-templates mode="card" select="ain:ParticipantDocs"/>
												</xsl:if>
											</xsl:for-each>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>Таможенный досмотр проведен в отсутствие декларанта или иного лица, обладающего полномочиями в отношении товаров (их представителей) по причине: <xsl:for-each select="ain:InspectionParticipant[ain:Status='4']">
												<xsl:value-of select="ain:Reason"/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>[ <xsl:choose>
												<xsl:when test="ain:ActType=0">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:when test="ain:ActType!=0">
													<span class="graphBold">–</span>
												</xsl:when>
											</xsl:choose> ]
							
												– проведен таможенный досмотр</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>[ <xsl:choose>
												<xsl:when test="ain:ActType=1">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:when test="ain:ActType!=1">
													<span class="graphBold">–</span>
												</xsl:when>
											</xsl:choose> ]
							
												– проведен таможенный осмотр</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>Место проведения таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра</xsl:when>
												<xsl:otherwise>досмотра</xsl:otherwise>
											</xsl:choose>: Код таможенного органа <xsl:value-of select="ain:InspectionPlace/cat_ru:Code"/>
											<xsl:if test="ain:InspectionPlace/cat_ru:OfficeName">
												наименование таможенного органа <xsl:value-of select="ain:InspectionPlace/cat_ru:OfficeName"/>
												<br/>
											</xsl:if>
											Вид информации о месте досмотра (таможенного осмотра)
											 <xsl:choose>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 11">СВХ</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 21">ТС</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 25">Свободный склад</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 31">Склад получателя</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 39">Склад иной</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 51">Ж/д / название ж/д станции</xsl:when>
												<xsl:otherwise>Местонахождение ЗТК (адрес)</xsl:otherwise>
											</xsl:choose>
											наименование места досмотра <xsl:value-of select="ain:InspectionPlace/ain:InspPlaceName"/> 
											Описание места проведения досмотра (таможенного осмотра). Иная информация о месте досмотра
											<xsl:text> </xsl:text>
											<xsl:for-each select="ain:InspectionPlace/ain:InspPlaceDesc">
												<xsl:value-of select="."/>
											</xsl:for-each>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ain:InspectionPlace/ain:WarehousePlace"/>
											<xsl:apply-templates select="ain:InspectionPlace/ain:InspAddress"/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>
									
							Применялись технические средства таможенного контроля: <xsl:for-each select="ain:UseTMCC">
												<xsl:value-of select="ain:TSTKCode"/>
												<xsl:if test="ain:Comments"> - <xsl:value-of select="ain:Comments"/>
												</xsl:if>
												<xsl:if test="position()!=last()">, </xsl:if>
											</xsl:for-each>
											<xsl:if test="ain:VOIActNumber">
												<br/>Акт осмотра с ИДК № <xsl:apply-templates select="ain:VOIActNumber"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>
											Предъявлено международное почтовое отправление № 
											<xsl:value-of select="ain:InspectionResults/ain:MPO/ain:MPO_Number"/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>
											<xsl:if test="(ain:Consignor and not(ain:Consignee))">
												Сведения об <u>отправителе (вывоз)</u>/получателе (ввоз)
											</xsl:if>
											<xsl:if test="(ain:Consignee and not(ain:Consignor))">
												Сведения об отправителе (вывоз)/<u>получателе (ввоз)</u>
											</xsl:if>: 
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<xsl:apply-templates mode="org2" select="ain:Consignor"/>
											<xsl:apply-templates mode="org2" select="ain:Consignee"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (для юридического лица - наименование организации, адрес;<br/>
для физического лица – Ф.И.О., место жительства)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%"> В результате таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра</xsl:when>
												<xsl:otherwise>досмотра</xsl:otherwise>
											</xsl:choose> установлено следующее:</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">Фактический вес товара брутто <xsl:value-of select="ain:InspectionResults/ain:FactWeight/ain:Brutto"/> кг определен способом фактического взвешивания
							</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%;font-family: Arial; font-size: 7pt;">(указываются результаты таможенного досмотра (таможенного осмотра))</td>
									</tr>
									<xsl:if test="ain:InspectionResults/ain:ViolationSign='0' or ain:InspectionResults/ain:ViolationSign='f' or ain:InspectionResults/ain:ViolationSign='false'">
										<tr>
											<td class="graph" style="width:100%">Нарушений таможенного законодательства не выявлено</td>
										</tr>
									</xsl:if>
									<xsl:variable name="MPOname" select="ain:InspectionResults/ain:MPO/ain:MPO_Name"/>
									<xsl:if test="ain:InspectionResults/ain:ViolationSign='1' or ain:InspectionResults/ain:ViolationSign='t' or ain:InspectionResults/ain:ViolationSign='true'">
										<tr>
											<td class="graph" style="width:100%">
												<xsl:choose>
													<xsl:when test="$MPOname='1'">почтовая карточка</xsl:when>
													<xsl:when test="$MPOname='2'">письмо</xsl:when>
													<xsl:when test="$MPOname='3'">бандероль</xsl:when>
													<xsl:when test="$MPOname='4'">мелкий пакет</xsl:when>
													<xsl:when test="$MPOname='5'">секограмма</xsl:when>
													<xsl:when test="$MPOname='6'">посылка</xsl:when>
													<xsl:when test="$MPOname='7'">мешок «М»</xsl:when>
													<xsl:when test="$MPOname='8'">отправление EMS</xsl:when>
													<xsl:otherwise>аэрограмма</xsl:otherwise>
												</xsl:choose>
												№ <xsl:value-of select="ain:InspectionResults/ain:MPO/ain:MPO_Number"/>, Повреждения МПО <xsl:choose>
													<xsl:when test="ain:InspectionResults/ain:MPO/ain:MPO_DamageFlag='1' or ain:InspectionResults/ain:MPO/ain:MPO_DamageFlag='t' or ain:InspectionResults/ain:MPO/ain:MPO_DamageFlag='true'">присутствуют: <xsl:value-of select="ain:InspectionResults/ain:MPO/ain:DamageDesc"/>
													</xsl:when>
													<xsl:otherwise>отсутствуют</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">Товары: 
												<xsl:for-each select="ain:InspectionResults/ain:InspGoods">
													<br/>
													<xsl:value-of select="position()"/>). <xsl:apply-templates select="."/>
													<br/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="not(ain:InspectionResults/ain:ViolationSign)">
										<tr>
											<td class="graph" style="width:100%">
												<xsl:choose>
													<xsl:when test="$MPOname='1'">почтовая карточка</xsl:when>
													<xsl:when test="$MPOname='2'">письмо</xsl:when>
													<xsl:when test="$MPOname='3'">бандероль</xsl:when>
													<xsl:when test="$MPOname='4'">мелкий пакет</xsl:when>
													<xsl:when test="$MPOname='5'">секограмма</xsl:when>
													<xsl:when test="$MPOname='6'">посылка</xsl:when>
													<xsl:when test="$MPOname='7'">мешок «М»</xsl:when>
													<xsl:when test="$MPOname='8'">отправление EMS</xsl:when>
													<xsl:otherwise>аэрограмма</xsl:otherwise>
												</xsl:choose>
												№ <xsl:value-of select="ain:InspectionResults/ain:MPO/ain:MPO_Number"/>, Повреждения МПО <xsl:choose>
													<xsl:when test="ain:InspectionResults/ain:MPO/ain:MPO_DamageFlag='1' or ain:InspectionResults/ain:MPO/ain:MPO_DamageFlag='t' or ain:InspectionResults/ain:MPO/ain:MPO_DamageFlag='true'">присутствуют: <xsl:value-of select="ain:InspectionResults/ain:MPO/ain:DamageDesc"/>
													</xsl:when>
													<xsl:otherwise>отсутствуют</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">Товары <xsl:for-each select="ain:InspectionResults/ain:InspGoods">
													<xsl:value-of select="position()"/>). <xsl:apply-templates select="."/>
													<br/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%">
											<xsl:for-each select="ain:InspectionResults/ain:IdentifyMean">
												<xsl:if test="ain:IdentMeanState=1">Средство идентификации до начала проведения таможенного досмотра</xsl:if>
												<xsl:if test="ain:IdentMeanState=2">Средство идентификации после проведения таможенного досмотра (наложенные)</xsl:if>
							номер 
							<xsl:value-of select="ain:IdentNumber"/> вид 
							<xsl:if test="ain:IdentKind=1">пломба</xsl:if>
												<xsl:if test="ain:IdentKind=2">печать</xsl:if>
												<xsl:if test="ain:IdentKind=3">иное</xsl:if>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ain:IdentDesc"/>
												<br/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"/>
									</tr>
									<tr>
										<td class="graph" style="width:100%"/>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
							К акту прилагаются: <xsl:value-of select="ain:InspectionResults/ain:ApplicMarks"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (документы, фотографии, этикетки и т.п.)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<xsl:choose>
												<xsl:when test="ain:Seize/ain:Presence = '0'">
								[ <span class="graphBold">х</span> ] Изъятий не производилось.
									</xsl:when>
												<xsl:otherwise>
													<s>[<b>–</b>] Изъятий не производилось.</s>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<xsl:if test="(ain:Seize/ain:SeizeAct) and (ain:ActType=0)">
										<tr>
											<td class="graph" style="width:100%">
							Произведен отбор проб и (или) образцов товаров по акту от 
							<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="ain:Seize/ain:SeizeAct/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
							
							№ <xsl:value-of select="ain:Seize/ain:SeizeAct/cat_ru:PrDocumentNumber"/>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%">
							Обнаружены признаки правонарушений:  <xsl:value-of select="ain:InspectionResults/ain:AKParts"/>
										</td>
									</tr>
									<!--<tr>
										<td style="width:100%" class="graph">
							Наложены средства идентификации <xsl:value-of select="ain:InspectionResults/ain:NewIdentMarks"/> в количестве <xsl:value-of select="ain:InspectionResults/ain:NumberOfNewIdentMarks"/> шт
							</td>
									</tr>-->
									<xsl:for-each select="ain:ATDCustomsPerson">
										<tr>
											<td class="graph" style="width:100%">
							Должностное лицо (должностные лица): <xsl:value-of select="cat_ru:PersonSurname"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="cat_ru:PersonName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="cat_ru:PersonMiddleName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="catESAD_ru:LNP"/>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы, личная номерная печать)<br/>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td class="graph" style="width:100%">
							в присутствии
							<xsl:for-each select="ain:InspectionParticipant[ain:Status='3' or ain:Status='6' or ain:Status='4']">
												<xsl:value-of select="cat_ru:PersonSurname"/> 
										<xsl:value-of select="cat_ru:PersonName"/> 
										<xsl:value-of select="cat_ru:PersonMiddleName"/> 
									</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
							Эксперт (специалист) 
							<xsl:if test="ain:InspectionParticipant/ain:Status ='5'">
												<xsl:value-of select="ain:InspectionParticipant[ain:Status ='5']/cat_ru:PersonSurname"/> 
										<xsl:value-of select="ain:InspectionParticipant[ain:Status ='5']/cat_ru:PersonName"/> 
										<xsl:value-of select="ain:InspectionParticipant[ain:Status ='5']/cat_ru:PersonMiddleName"/> 
									</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы)<br/>
										</td>
									</tr>
									<xsl:if test="ain:InspectionFinal">
										<tr>
											<td class="graph" style="width:100%">
												<xsl:choose>
													<xsl:when test="ain:ActType='1'">Осмотр </xsl:when>
													<xsl:otherwise>Досмотр </xsl:otherwise>
												</xsl:choose>
												<xsl:choose>
													<xsl:when test="ain:InspectionFinal='true' or ain:InspectionFinal='t' or ain:InspectionFinal='1'">завершен</xsl:when>
													<xsl:when test="ain:InspectionFinal='false' or ain:InspectionFinal='f' or ain:InspectionFinal='0'">не завершен</xsl:when>
												</xsl:choose>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%"><br/>Дата и время окончания таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра</xsl:when>
												<xsl:otherwise>досмотра </xsl:otherwise>
											</xsl:choose>
											<xsl:text> </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="ain:EndInspectionDate"/>
											</xsl:call-template>
											<xsl:text> </xsl:text>
											<xsl:value-of select="substring(ain:EndInspectionTime,1,8)"/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" colspan="3" style="width:100%">
										Второй экземпляр акта направлен с международным почтовым отправлением № <xsl:value-of select="ain:InspectionParticipant/ain:AddresseeMPO"/>
										</td>
									</tr>
									<tr>
										<table>
											<tbody>
												<tr>
													<td align="center" class="graph" style="width:30%">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="ain:SecExempDate"/>
														</xsl:call-template>
														<xsl:text> </xsl:text>
														<xsl:value-of select="substring(ain:SecExempTime, 1, 8)"/>
													</td>
													<td>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
													<td align="center" class="graph" style="width:30%">
														<xsl:value-of select="ain:ATDCustomsPerson[catESAD_ru:OfficialStatus='1' or catESAD_ru:OfficialStatus='t' or catESAD_ru:OfficialStatus='true']/cat_ru:PersonSurname"/> 
													<xsl:value-of select="ain:ATDCustomsPerson[catESAD_ru:OfficialStatus='1' or catESAD_ru:OfficialStatus='t' or catESAD_ru:OfficialStatus='true']/cat_ru:PersonName"/> 
													<xsl:value-of select="ain:ATDCustomsPerson[catESAD_ru:OfficialStatus='1' or catESAD_ru:OfficialStatus='t' or catESAD_ru:OfficialStatus='true']/cat_ru:PersonMiddleName"/> 
												</td>
												</tr>
												<tr>
													<td align="center" class="graphtop" style="width:30%">(дата<xsl:if test="ain:SecExempTime">, время</xsl:if>)<br/>
													</td>
													<td align="center" class="graphtop" style="width:30%"> (подпись)<br/>
													</td>
													<td align="center" class="graphtop" style="width:30%"> ( фамилия, инициалы должностного лица)<br/>
													</td>
												</tr>
											</tbody>
										</table>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="ain:InspectionResults/ain:InspGoods/ain:CIMList">
					<div class="page">
						<table width="100%">
							<tbody>
								<tr>
									<th>Сведения о контрольно-идентификационных знаках</th>
								</tr>
							</tbody>
						</table>
						<table width="100%" style="border-collapse: collapse;">
							<tbody>
								<tr>
									<th style="border:1px solid;">№ знака</th>
									<th style="border:1px solid;">Визуальный номер КИЗ</th>
									<th style="border:1px solid;">RFID</th>
									<th style="border:1px solid;">GTIN</th>
								</tr>
								<xsl:for-each select="ain:InspectionResults/ain:InspGoods[ain:CIMList]">
									<tr>
										<td style="border:1px solid;" colspan="4">Номер товара: <xsl:value-of select="cat_ru:GoodsNumeric"/></td>
									</tr>
									<xsl:for-each select="ain:CIMList">
										<tr>
											<td style="border:1px solid;">
												<xsl:value-of select="ain:Number"/>
											</td>
											<td style="border:1px solid;">
												<xsl:value-of select="ain:VisualIdentifierCIM"/>
											</td>
											<td style="border:1px solid;">
												<xsl:value-of select="ain:RFID_TID"/>
											</td>
											<td style="border:1px solid;">
												<xsl:value-of select="ain:GTINIdentifier"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="*" mode="card">
		<xsl:apply-templates select="cat_ru:IdentityCardCode"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:IdentityCardName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:IdentityCardSeries"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:IdentityCardNumber"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		<xsl:text> </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
		</xsl:call-template>
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
	</xsl:template>
	<xsl:template match="*" mode="org">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph">(</span>
			<xsl:value-of select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:Address/cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:Address/cat_ru:PostalCode"/>,
        </xsl:if>
		<xsl:apply-templates select="cat_ru:Address/cat_ru:CountryCode"/>,
        <xsl:if test="cat_ru:Address/cat_ru:Region">
			<xsl:value-of select="cat_ru:Address/cat_ru:Region"/>,
        </xsl:if>
		<xsl:if test="cat_ru:Address/cat_ru:City">
			<xsl:value-of select="cat_ru:Address/cat_ru:City"/>,
        </xsl:if>
		<xsl:value-of select="cat_ru:Address/cat_ru:StreetHouse"/>
		<xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
			<xsl:text> </xsl:text>
			<xsl:text>№ </xsl:text>
			<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
				<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			</xsl:if>
			<xsl:text> </xsl:text>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
			</xsl:if>
			<xsl:text> </xsl:text>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
				<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:UNP">
			<xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="spaceSeparated" select="cat_ru:IdentityCard"/>
	</xsl:template>
	<xsl:template match="*" mode="org2">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph">(</span>
			<xsl:value-of select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:Address/cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:Address/cat_ru:PostalCode"/>,
        </xsl:if>
		<xsl:apply-templates select="cat_ru:Address/cat_ru:CountryCode"/>,
        <xsl:if test="cat_ru:Address/cat_ru:Region">
			<xsl:value-of select="cat_ru:Address/cat_ru:Region"/>,
        </xsl:if>
		<xsl:if test="cat_ru:Address/cat_ru:City">
			<xsl:value-of select="cat_ru:Address/cat_ru:City"/>,
        </xsl:if>
		<xsl:value-of select="cat_ru:Address/cat_ru:StreetHouse"/>
	</xsl:template>
	<xsl:template match="ain:InspectionPlace/ain:InspAddress">
		<tr>
			<td class="graph" colspan="3">
				<span class="graph"> Адрес места досмотра</span>
				<xsl:text> </xsl:text>
				<xsl:for-each select="*">
					<xsl:if test="position() > 1">
						<xsl:text>, </xsl:text>
					</xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="ain:VOIActNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="ain:InspTransport/ain:InspTransportMean">
		<xsl:for-each select="ain:TransportMeans">
			<xsl:if test="cat_ru:TransportKindCode"><xsl:value-of select="cat_ru:TransportKindCode"/>, </xsl:if>
			<xsl:if test="cat_ru:TransportIdentifier"><xsl:value-of select="cat_ru:TransportIdentifier"/> </xsl:if>
			<xsl:if test="cat_ru:TransportMeansNationalityCode"> <xsl:value-of select="cat_ru:TransportMeansNationalityCode"/></xsl:if>
			<xsl:if test="ain:TransportModeCode">(<xsl:value-of select="ain:TransportModeCode"/>)</xsl:if>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="ain:InspTransport/ain:ContainerInfo">
		<xsl:if test="ain:ContainerQuantity">
			<xsl:value-of select="ain:ContainerQuantity"/>:&#160;</xsl:if>
		<xsl:for-each select="ain:ContainerIdentificator">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="ain:SupplementaryQuantity">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
	</xsl:template>
	<xsl:template match="ain:CargoInfo | ain:PlaceInfo | ain:PalleteInfo | ain:PackageInfo">
	Вид <xsl:value-of select="catESAD_cu:PackingCode"/>
		<xsl:if test="catESAD_cu:PakingQuantity">, количество <xsl:value-of select="catESAD_cu:PakingQuantity"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:PakingQuantity">, описание <xsl:for-each select="ain:PackageDescription">
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="ain:PackDestructFlag='0' or ain:PackDestructFlag='f' or ain:PackDestructFlag='false'"> повреждений нет</xsl:when>
			<xsl:otherwise> повреждения есть<xsl:for-each select="ain:PackDestructDesc">
					<xsl:value-of select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="ain:InspGoods">
		<xsl:for-each select="cat_ru:GoodsDescription">
			<xsl:value-of select="."/> 
												</xsl:for-each>
		<xsl:choose>
			<xsl:when test="ain:GoodsDamageFlag='0' or ain:GoodsDamageFlag='f' or ain:GoodsDamageFlag='false'">не поврежден </xsl:when>
			<xsl:otherwise>поврежден: <xsl:for-each select="ain:DamageDesc">
					<xsl:value-of select="."/>
				</xsl:for-each> </xsl:otherwise>
		</xsl:choose>
		<xsl:if test="ain:CountryCode or ain:CountryName">
													Страна - изготовитель <xsl:value-of select="ain:CountryCode"/> <xsl:value-of select="ain:CountryName"/> 
												</xsl:if>
												Сведения о стране изготовления согласно<xsl:choose>
			<xsl:when test="ain:CountrySrcFlag='1'"> маркировке на товаре</xsl:when>
			<xsl:when test="ain:CountrySrcFlag='2'"> маркировке на упаковке</xsl:when>
			<xsl:when test="ain:CountrySrcFlag='3'"> сведениям из документов</xsl:when>
			<xsl:otherwise>
														 <xsl:value-of select="ain:CountrySrcDesc"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="ain:SupplementaryQuantity">
													Количество <xsl:apply-templates select="ain:SupplementaryQuantity"/>
		</xsl:if>
		<xsl:if test="cat_ru:GrossWeightQuantity"> Вес брутто <xsl:value-of select="cat_ru:GrossWeightQuantity"/>
		</xsl:if>
		<xsl:if test="cat_ru:NetWeightQuantity"> Вес нетто <xsl:value-of select="cat_ru:NetWeightQuantity"/>
		</xsl:if>
		<xsl:if test="ain:CargoInfo">
												, Сведения о виде груза <xsl:apply-templates select="ain:CargoInfo"/>
		</xsl:if>
		<xsl:if test="ain:PlaceInfo">
												, Сведения о таре (потребительской / индивидуальной) <xsl:apply-templates select="ain:PlaceInfo"/>
		</xsl:if>
		<xsl:if test="ain:PalleteInfo">
												, Сведения о поддонах / палетах <xsl:apply-templates select="ain:PalleteInfo"/>
		</xsl:if>
		<xsl:if test="ain:PackageInfo">
												, Cведения об упаковкe <xsl:apply-templates select="ain:PackageInfo"/>
		</xsl:if>
		<xsl:if test="ain:BillDoc">
			<xsl:text>, Сопроводительный документ </xsl:text>
			<xsl:for-each select="ain:BillDoc/*">
				<xsl:choose>
					<xsl:when test="contains(local-name(.),'Date')">
						<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
					</xsl:when>
					<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
				</xsl:choose>
				<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
			</xsl:for-each>
		</xsl:if>;	
	</xsl:template>
</xsl:stylesheet>
