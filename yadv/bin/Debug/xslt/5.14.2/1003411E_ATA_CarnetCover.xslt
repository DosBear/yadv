<?xml version="1.0" encoding="utf-8"?>

<!-- Бланк в соответствии с приказом ФТС №2675 от 28.12.2012, приложение 1 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ata_ct="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CommonTypes:5.14.0" xmlns:ata_cc="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CarnetCover:5.14.0">
	<!-- Шаблон для типа ATA_CarnetCoverType -->
	<xsl:template match="ata_cc:ATA_CarnetCover">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div
					{
					white-space: nowrap;
					}

					div.page {
					width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					background: #ffffff;
					border: solid 1pt #000000;
					font-family: Verdana;
					font-size: 8pt;								
					}

					.marg-top
					{
					margin-top:6mm;
					}

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					font-family: Arial;
					font-size: 8pt;
					}

					table.border tr td
					{
					border: 1px solid gray;
					}

					.graph {
					font-family: Verdana;
					font-size: 8pt;
					}

					.value
					{
					border-bottom: dotted 1px black;
					}

					div.title, tr.title td { font-weight:bold;  }
					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px windowtext;
					}

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="3">
										<b>A.T.A. CARNET / Карнет АТА</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
						<xsl:if test="cat_ru:RefDocumentID">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</xsl:if>
					</table -->
					<br/>
					<table class="w190">
						<tr>
							<td class="graphMain bordered" style="width:4mm; font-size: 10pt; vertical-align: middle" rowspan="4">
								<b>A T A<br/><br/>C A R N E T</b>
							</td>
							<td class="graphMain bordered" style="width:4mm; font-size: 10pt; vertical-align: middle" rowspan="4">
								<b>К А Р Н Е Т<br/><br/>А Т А</b>
							</td>
							<td class="graphMain bordered" style="width:82mm" rowspan="2">
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:3mm"><b>A.</b></td>
										<td class="annot graphMain" style="width:79mm"><b>HOLDER AND ADDRESS / Владелец и адрес</b></td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:3mm"/>
										<td class="value graphMain" style="width:79mm"><xsl:value-of select="ata_cc:Holder"/></td>
									</tr>
									<xsl:if test="ata_cc:HolderAddress">
										<tr>
											<td class="annot graphMain" style="width:3mm"/>
											<td class="value graphMain" style="width:79mm"><xsl:value-of select="ata_cc:HolderAddress"/></td>
										</tr>
									</xsl:if>
								</table>	
							</td>
							<td class="graphMain bordered" style="width:100mm" colspan="2">
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:3mm"><b>G.</b></td>
										<td class="annot graphMain" style="width:97mm">
											<b>FOR ISSUING ASSOCIATION USE / Заполняется ассоциацией, выдающей
											<br/>FRONT COVER / Обложка</b>
										</td>
									</tr>
								</table>	
							</td>
						</tr>
						<tr>
							<td class="graphMain bordered" style="width:100mm" colspan="2">
								<table class="w190" cellspacing="5">
									<tr>
										<td class="annot graphMain" style="width:3mm"><b>a)</b></td>
										<td class="annot graphMain" style="width:50mm"><b>CARNET No. /<br/>Карнет №</b></td>
										<td class="annot graphMain" style="width:7mm; vertical-align:middle"></td>
										<td class="graphMain bordered" style="width:40mm; vertical-align:middle">
											<font size="2"><b><xsl:value-of select="ata_cc:CarnetNumber"/></b></font>
										</td>
									</tr>
									<xsl:if test="ata_cc:ReplacedCarnetNumber">
										<tr>
											<td class="annot graphMain" style="width:3mm"/><td class="annot graphMain" style="width:50mm"/>
											<td class="annot graphMain" style="width:7mm"/><td class="annot graphMain" style="width:40mm"><br/></td>
										</tr>
										<tr>
											<td class="annot graphMain" style="width:3mm"/>
											<td class="annot graphMain" style="width:57mm" colspan="2"><b>Replaced Carnet No. / Заменен карнет №</b></td>
											<td class="value graphMain" style="width:40mm"><xsl:value-of select="ata_cc:ReplacedCarnetNumber"/></td>
										</tr>
									</xsl:if>
									<xsl:if test="ata_cc:CarnetRegistrationRefusal">
										<tr>
											<td class="annot graphMain" style="width:3mm"/><td class="annot graphMain" style="width:50mm"/>
											<td class="annot graphMain" style="width:7mm"/><td class="annot graphMain" style="width:40mm"><br/></td>
										</tr>
										<tr>
											<td class="annot graphMain" style="width:3mm"/>
											<td class="annot graphMain" style="width:97mm" colspan="3"><b>Registration of the Carnet refused / B регистрации карнета отказано:</b></td>
										</tr>
										<tr>
											<td class="annot graphMain" style="width:3mm"/>
											<td class="value graphMain" style="width:97mm" colspan="3"><xsl:apply-templates select="ata_cc:CarnetRegistrationRefusal"/></td>
										</tr>
									</xsl:if>
								</table>	
							</td>
						</tr>
						<tr>
							<td class="graphMain bordered" style="width:82mm">
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:3mm"><b>B.</b></td>
										<td class="annot graphMain" style="width:79mm"><b>REPRESENTED BY / Кем представлен</b></td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:3mm"/>
										<td class="value graphMain" style="width:79mm"><xsl:value-of select="ata_cc:RepresentedBy"/></td>
									</tr>
								</table>	
							</td>
							<td class="graphMain bordered" style="width:100mm" colspan="2">
								<table class="w190" cellspacing="5">
									<tr>
										<td class="annot graphMain" style="width:3mm"><b>b)</b></td>
										<td class="annot graphMain" style="width:97mm"><b>ISSUED BY / Кем выдано</b></td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:3mm"/>
										<td class="value graphMain" style="width:97mm"><xsl:value-of select="ata_cc:IssuedBy"/></td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:3mm"/><td class="annot graphMain" style="width:97mm"><br/></td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:3mm"/>
										<td class="annot graphMain" style="width:97mm"><b>GUARANTEED BY / Кем гарантировано</b></td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:3mm"/>
										<td class="value graphMain" style="width:97mm"><xsl:value-of select="ata_cc:GuaranteedBy"/></td>
									</tr>
								</table>	
							</td>
						</tr>
						<tr>
							<td class="graphMain bordered" style="width:82mm">
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:3mm"><b>C.</b></td>
										<td class="annot graphMain" style="width:79mm"><b>INTENDED USE OF GOODS / Предполагаемое использование товаров</b></td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:3mm"/>
										<td class="value graphMain" style="width:79mm"><xsl:value-of select="ata_cc:IntendedUse"/></td>
									</tr>
								</table>	
							</td>
							<td class="graphMain bordered" style="width:100mm" colspan="2">
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:3mm"><b>c)</b></td>
										<td class="annot graphMain" style="width:97mm" colspan="6"><b>VALID UNTIL / Действительно до</b></td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:3mm"/>
										<td class="value graphMain" style="width:25mm" align="center">
											<xsl:value-of select="substring(ata_cc:ValidUntil,1,4)"/>
										</td>
										<td class="annot graphMain" style="width:2mm" align="center">/</td>
										<td class="value graphMain" style="width:15mm" align="center">
											<xsl:value-of select="substring(ata_cc:ValidUntil,6,2)"/>
										</td>
										<td class="annot graphMain" style="width:2mm" align="center">/</td>
										<td class="value graphMain" style="width:15mm" align="center">
											<xsl:value-of select="substring(ata_cc:ValidUntil,9,2)"/>
										</td>
										<td class="annot graphMain" style="width:38mm"/>
									</tr>
									<tr>
										<td class="annot graphMain"/>
										<td class="annot graphMain" style="width:25mm" align="center">
											<b>year<br/>год</b>
										</td>
										<td class="annot graphMain"/>
										<td class="annot graphMain" style="width:15mm" align="center">
											<b>month<br/>месяц</b>
										</td>
										<td class="annot graphMain" style="width:2mm" align="center"/>
										<td class="annot graphMain" style="width:53mm" colspan="2">
											<b>day (inclusive)<br/>день (включительно)</b>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:8mm" colspan="2"/>
							<td class="graphMain bordered" style="width:182mm" colspan="3">
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:3mm"><b>P.</b></td>
										<td class="annot graphMain" style="width:179mm" colspan="3">
											<b>This carnet may be used in the following coutries/Customs territories under the guarantee of the associations listed on page four of cover: / Данная Книжка может применяться в нижеследующих странах/таможенных территориях по гарантии следующих ассоциаций:</b>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:3mm"/>
										<td class="annot graphMain" style="width:60mm">
											Австралия (AU)<br/>Австрия (AT)<br/>Алжир (AL)<br/>Андорра (AD)<br/>Белоруссия (BY)<br/>
											Бельгия (BE)<br/>Болгария (BG)<br/>Босния и Герцеговина (BA)<br/>Великобритания (GB)<br/>Венгрия (HU)<br/>
											Германия (DE)<br/>Гибралтар (GI)<br/>Гонконг (HK)<br/>Греция (GR)<br/>Дания (DK)<br/>
											Израиль (IL)<br/>Индия (IN)<br/>Иран (IR)<br/>Ирландия (IE)<br/>Исландия (IS)<br/>
											Испания (ES)<br/>Италия (IT)<br/>Канада (CA)<br/>Кипр (CY)<br/>Китай (CN)
										</td>
										<td class="annot graphMain" style="width:60mm">
											Китайский Тайбэй (TW)<br/>Корея (KR)<br/>Кот-д'Ивуар (CI)<br/>Латвия (LV)<br/>Ливан (LB)<br/>
											Литва (LT)<br/>Люксембург (LU)<br/>Мавритания (MU)<br/>Макао (MO)<br/>Македония (MK)<br/>
											Малайзия (MY)<br/>Мальта (MT)<br/>Марокко (MA)<br/>Мексика (MX)<br/>Молдова (MD)<br/>
											Монголия (MN)<br/>Нидерланды (NL)<br/>Новая Зеландия (NZ)<br/>Норвегия (NO)<br/>Объединенные Арабские Эмираты (AE)<br/>
											Пакистан (PK)<br/>Польша (PL)<br/>Португалия (PT)<br/>Россия (RU)<br/>Румыния (RO)
										</td>
										<td class="annot graphMain" style="width:59mm">
											Сенегал (SN)<br/>Сербия (CS)<br/>Сингапур (SG)<br/>Словакия (SK)<br/>Словения (SI)<br/>
											США (US)<br/>Таиланд (TH)<br/>Тунис (TN)<br/>Турция (TR)<br/>Украина (UA)<br/>
											Финляндия (FI)<br/>Франция (FR)<br/>Хорватия (HR)<br/>Черногория (ME)<br/>Чехия (CZ)<br/>
											Чили (CL)<br/>Швейцария (CH)<br/>Швеция (SE)<br/>Шри-Ланка (LK)<br/>Эстония (EE)<br/>
											Южная Африка (ZA)<br/>Япония (JP)<br/>Королевство Бахрейн (BH)
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:3mm"/>
										<td class="annot graphMain" style="width:179mm" colspan="3">
											<br/>The holder of this Carnet and his representative will be held responsible for compliance with the laws and regulations of the country/Customs territory of departure and the countries/Custom territories of importation. / Владелец настоящей Книжки и его представитель несут ответственность за соблюдение законов и нормативно-правовых актов страны/таможенной территории вывоза и стран/таможенной территории временного ввоза.
										</td>
									</tr>
								</table>	
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:8mm" colspan="2" rowspan="4"/>
							<td class="graphMain bordered" style="width:100mm" colspan="2" rowspan="4" bgcolor="#e3e3e3">
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:3mm"><b>H.</b></td>
										<td class="annot graphMain" style="width:97mm">
											<b>CERTIFICATE BY CUSTOMS AT DEPARTURE<br/>ЗАСВИДЕТЕЛЬСТВОВАНИЕ ТАМОЖЕННЫХ ОРГАНОВ</b>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:3mm"/><td class="annot graphMain" style="width:97mm"><br/></td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:3mm"><b>a)</b></td>
										<td class="annot graphMain" style="width:97mm">
											<b>Identification marks have been affixed as indicated in column 7 against the following items No(s). at General List / Проставление идентифицирующих отметок, указанных в графе 7, напротив следующего(их) номера(ов) товара в Общем списке</b>
										</td>
									</tr>
									<xsl:for-each select="ata_cc:DepCustomsCert">
										<tr>
											<td class="annot graphMain" style="width:3mm"/>
											<td class="value graphMain" style="width:97mm">
												<xsl:value-of select="ata_cc:IdentifiedGoodsNum"/>
											</td>
										</tr>
										<tr>
											<td class="annot graphMain" style="width:3mm"/><td class="annot graphMain" style="width:97mm"><br/></td>
										</tr>
										<tr>
											<td class="annot graphMain" style="width:3mm"><b>b)</b></td>
											<td class="annot graphMain" style="width:97mm">
												<b>GOODS EXAMINED / Товары проверены</b>
											</td>
										</tr>
										<tr>
											<td class="annot graphMain" style="width:3mm"/>
											<td class="annot graphMain" style="width:97mm">
												<table style="width:50mm">
													<tr>
														<td class="annot graphMain" style="width:18mm" align="center"><b>Yes / да</b></td>
														<td class="graphMain bordered" style="width:4mm" align="center">
															<xsl:if test="ata_cc:GoodsCheckSign='true' or ata_cc:GoodsCheckSign=1">V</xsl:if>
														</td>
														<td class="annot graphMain" style="width:6mm" align="center"/>
														<td class="annot graphMain" style="width:18mm" align="center"><b>No / нет</b></td>
														<td class="graphMain bordered" style="width:4mm" align="center">
															<xsl:if test="not(ata_cc:GoodsCheckSign) or ata_cc:GoodsCheckSign='false' or ata_cc:GoodsCheckSign=0">V</xsl:if>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td class="annot graphMain" style="width:3mm"/><td class="annot graphMain" style="width:97mm"><br/></td>
										</tr>
										<tr>
											<td class="annot graphMain" style="width:3mm"><b>c)</b></td>
											<td class="annot graphMain" style="width:97mm">
												<b>Registered under Reference No. / Зарегистрировано под Номером</b>
											</td>
										</tr>
										<tr>
											<td class="annot graphMain" style="width:3mm"/>
											<td class="value graphMain" style="width:97mm">
												<xsl:apply-templates select="ata_cc:RegistrationNumber"/>
											</td>
										</tr>
									</xsl:for-each>	
									<tr>
										<td class="annot graphMain" style="width:3mm"/><td class="annot graphMain" style="width:97mm"><br/></td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:3mm"><b>d)</b></td>
										<td class="annot graphMain" style="width:97mm">
											<table style="width:97mm">
												<tr>
													<td class="value graphMain" style="width:25mm" align="center">
														<xsl:apply-templates select="ata_cc:CustomsPersonRequisites/ata_ct:CustomsInfo"/>
													</td>
													<td class="annot graphMain" style="width:2mm"/>
													<td class="value graphMain" style="width:20mm" align="center">
														<xsl:value-of select="ata_cc:DepCustomsCert/ata_cc:Place"/>
													</td>
													<td class="annot graphMain" style="width:2mm"/>
													<td class="value graphMain" style="width:10mm" align="center">
														<xsl:for-each select="ata_cc:CustomsPersonRequisites/ata_ct:CustomsPersonSignature/ata_ct:IssueDate">
															<xsl:value-of select="substring(.,1,4)"/>
															<xsl:if test="position()!=last()"><br/></xsl:if>
														</xsl:for-each>
													</td>
													<td class="annot graphMain" style="width:1mm">/</td>
													<td class="value graphMain" style="width:5mm" align="center">
														<xsl:for-each select="ata_cc:CustomsPersonRequisites/ata_ct:CustomsPersonSignature/ata_ct:IssueDate">
															<xsl:value-of select="substring(.,6,2)"/>
															<xsl:if test="position()!=last()"><br/></xsl:if>
														</xsl:for-each>
													</td>
													<td class="annot graphMain" style="width:1mm">/</td>
													<td class="value graphMain" style="width:5mm" align="center">
														<xsl:for-each select="ata_cc:CustomsPersonRequisites/ata_ct:CustomsPersonSignature/ata_ct:IssueDate">
															<xsl:value-of select="substring(.,9,2)"/>
															<xsl:if test="position()!=last()"><br/></xsl:if>
														</xsl:for-each>
													</td>
													<td class="annot graphMain" style="width:2mm"/>
													<td class="value graphMain" style="width:24mm" align="center">
														<xsl:for-each select="ata_cc:CustomsPersonRequisites/ata_ct:CustomsPersonSignature">
															<xsl:apply-templates select="."/>
															<xsl:if test="position()!=last()"><br/></xsl:if>
														</xsl:for-each>
													</td>
												</tr>
												<tr>
													<td class="annot graphMain" style="width:25mm" align="center">
														<b>Customs Office<br/>Таможня</b>
													</td>
													<td class="annot graphMain" style="width:2mm"/>
													<td class="annot graphMain" style="width:20mm" align="center">
														<b>Place<br/>Место</b>
													</td>
													<td class="annot graphMain" style="width:2mm"/>
													<td class="annot graphMain" style="width:22mm" align="center" colspan="5">
														<b>Date (Y/M/D)<br/>Дата (Г/М/Д)</b>
													</td>
													<td class="annot graphMain" style="width:2mm"/>
													<td class="annot graphMain" style="width:24mm" align="center">
														<b>Signature<br/>Подпись</b>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>	
							</td>
							<td class="graphMain bordered" style="width:82mm; border-bottom: 0">
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:3mm"><b>I.</b></td>
										<td class="annot graphMain" style="width:79mm">
											<b>Signature of authorised official and Issuing Association stamp / Подпись уполномоченного должностного лица и печать ассоциации, выдавшей документ</b>
										</td>
									</tr>
								</table>		
							</td>
						</tr>	
						<tr>
							<td class="graphMain bordered" style="width:82mm; vertical-align:bottom; border-top: 0">
								<table style="width:82mm">
									<tr>
										<td class="annot graphMain" style="width:3mm"/>
										<td class="value graphMain" style="width:55mm" align="center"/>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="value graphMain" style="width:10mm" align="center">
											<xsl:value-of select="substring(ata_cc:IssueDate,1,4)"/>
										</td>
										<td class="annot graphMain" style="width:1mm">/</td>
										<td class="value graphMain" style="width:5mm" align="center">
											<xsl:value-of select="substring(ata_cc:IssueDate,6,2)"/>
										</td>
										<td class="annot graphMain" style="width:1mm">/</td>
										<td class="value graphMain" style="width:5mm" align="center">
											<xsl:value-of select="substring(ata_cc:IssueDate,9,2)"/>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:3mm"/>
										<td class="annot graphMain" style="width:67mm" colspan="3">
											<b>Place and Date of Issue (year/month/day)<br/>Место и дата выдачи (год/ месяц/ день)</b>
										</td>
										<td class="annot graphMain"/><td class="annot graphMain"/>
										<td class="annot graphMain"/><td class="annot graphMain"/>
									</tr>	
								</table>
							</td>
						</tr>	
						<tr>
							<td class="graphMain bordered" style="width:82mm; border-bottom: 0">
								<b>J.</b>
							</td>
						</tr>
						<tr>
							<td class="graphMain bordered" style="width:82mm; vertical-align:bottom; border-top: 0">
								<table style="width:82mm">	
									<tr>
										<td class="annot graphMain" style="width:3mm"/>
										<td class="annot graphMain" style="width:2mm">X</td>
										<td class="value graphMain" style="width:73mm" align="center"/>
										<td class="annot graphMain" style="width:2mm">X</td>
										<td class="annot graphMain" style="width:2mm"/>
									</tr>
									<tr>
										<td class="annot graphMain"/><td class="annot graphMain"/>
										<td class="annot graphMain" style="width:73mm"><b>Signature of holder / Подпись владельца</b></td>
										<td class="annot graphMain"/><td class="annot graphMain"/>
									</tr>
								</table>
							</td>
						</tr>	
					</table>
				</div>
				<xsl:if test="ata_cc:GeneralList">
					<div class="page">
						<table class="w190">
							<tr>
								<td align="left" class="graphMain" style="width:20%">
									<font size="3">
										<b>A.T.A. CARNET</b>
									</font>
								</td>
								<td align="center" class="graphMain" style="width:60%">
									<font size="3">
										<b>GENERAL LIST / ОБЩИЙ СПИСОК</b>
									</font>
								</td>
								<td align="right" class="graphMain" style="width:20%">
									<font size="3">
										<b>Карнет АТА</b>
									</font>
								</td>
							</tr>
						</table>
						<xsl:apply-templates select="ata_cc:GeneralList"/>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ata_ct:CarnetRegistrationRefusalType -->
	<xsl:template match="ata_cc:CarnetRegistrationRefusal">
		<xsl:value-of select="ata_ct:RegistrationRefusalCode"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="ata_ct:RegistrationRefusalComment"/>
	</xsl:template>
	<!-- Шаблон для типа ata_cc:GeneralList -->
	<xsl:template match="ata_cc:GeneralList">
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered" align="center" style="vertical-align:middle">Item No. /<br/>№<br/>п/п</td>
					<td class="graphMain bordered" align="center" style="vertical-align:middle">Trade description of goods and marks and number, if any /<br/>Торговое название товаров и в случае необходимости торговые марки и номера</td>
					<td class="graphMain bordered" align="center" style="vertical-align:middle">Number of pieces /<br/>Количество, штук</td>
					<td class="graphMain bordered" align="center" style="vertical-align:middle">Weight or volume /<br/>Вес или объем</td>
					<td class="graphMain bordered" align="center" style="vertical-align:middle">Value /<br/>Стоимость</td>
					<td class="graphMain bordered" align="center" style="vertical-align:middle">Country of origin /<br/>Страна происхождения</td>
					<td class="graphMain bordered" align="center" style="vertical-align:middle" bgcolor="#e3e3e3">For Customs Use /<br/>Заполняется таможней</td>
				</tr>
				<tr class="title">
					<td class="graphMain bordered" align="center">1</td>
					<td class="graphMain bordered" align="center">2</td>
					<td class="graphMain bordered" align="center">3</td>
					<td class="graphMain bordered" align="center">4</td>
					<td class="graphMain bordered" align="center">5</td>
					<td class="graphMain bordered" align="center">6</td>
					<td class="graphMain bordered" align="center" bgcolor="#e3e3e3">7</td>
				</tr>
				<xsl:for-each select="ata_cc:Good">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
				<tr>
					<td class="graphMain bordered" colspan="2">
						<b>TOTAL or CARRIER OVER /<br/>ИТОГО или Перенесено на доп. лист</b>
					</td>
					<td class="graphMain bordered">
						<xsl:value-of select="ata_cc:TotalPcsQuantity"/>
					</td>
					<td class="graphMain bordered"/>
					<td class="graphMain bordered">
						<xsl:value-of select="translate(ata_cc:TotalCost, '.', ',')"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="ata_cc:CurrencyCode"/>
					</td>
					<td class="graphMain bordered"/>
					<td class="graphMain bordered" bgcolor="#e3e3e3"/>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ata_cc:Good -->
	<xsl:template match="ata_cc:Good">
		<tr>
			<td class="graphMain bordered" align="center">
				<xsl:value-of select="ata_cc:ListNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_cc:Description"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_cc:PcsQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(ata_cc:AddQuantity, '.', ',')"/>
				<xsl:if test="ata_cc:AddQuantityUnit">
					<xsl:choose>
						<xsl:when test="ata_cc:AddQuantityUnit='112'"> м3</xsl:when>
						<xsl:when test="ata_cc:AddQuantityUnit='166'"> кг</xsl:when>
						<xsl:otherwise> (код: <xsl:value-of select="ata_cc:AddQuantityUnit"/>)</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(ata_cc:Cost, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_cc:OriginCountry"/>
			</td>
			<td class="graphMain bordered" bgcolor="#e3e3e3">
				<xsl:if test="ata_cc:TNVEDCode">код ТН ВЭД ЕАЭС: <xsl:value-of select="ata_cc:TNVEDCode"/></xsl:if>
				<xsl:if test="ata_cc:CustomsMarks"><br/><xsl:value-of select="ata_cc:CustomsMarks"/></xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="ata_cc:RegistrationNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="ata_ct:CustomsInfo">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:OfficeName"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ata_ct:CustomsPersonSignatureType -->
	<xsl:template match="ata_ct:CustomsPersonSignature">
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:LNP">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:LNP"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<!--xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="ata_ct:IssueDate"/>
		</xsl:call-template-->
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="gtd_date">
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
</xsl:stylesheet>
