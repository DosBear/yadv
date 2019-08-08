<?xml version="1.0" encoding="UTF-8"?>

<!-- Бланк регламентирован решением Коллегии ЕЭК №289 от 10.12.2013 ПРИЛОЖЕНИЕ № 1 (Решение о внесении изменений), ПРИЛОЖЕНИЕ № 2 (Требование о внесении изменений) -->
<!-- До выпуска - Требование. После выпуска - Решение -->
<!-- Последний изменяющий документ: Решения Коллегии Евразийской экономической комиссии № 173 от 13 декабря 2017 года -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:dcd="urn:customs.ru:Information:CustomsDocuments:DeclChangeDecision:5.13.2">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="dcd:DeclChangeDecision">
		<html>
			<head>
			<title>Решение о внесении изменений (дополнений) в сведения, указанные в декларации на товары</title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
			<style type="text/css">
			body {
					background: #cccccc;
				}
				div
				{
				white-space: nowrap;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					/*padding-left: 20mm;*/
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					/*padding-left: 20mm;*/
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					font-family: Arial, serif;
					font-size: 12pt;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid windowtext;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.bordered { border-collapse: collapse; }
				td.bordered
				{
					border: solid 1px windowtext;
				}
				td.nobordered
				{
					border: solid 0px windowtext;
				}
	
				td.bordered_without_top
				{
					border-collapse: collapse;
					border-right: solid 1px windowtext;
					border-top: none;
					border-bottom: solid 1px windowtext;
					border-left: solid 1px windowtext;
				}
	
				td.bordered_without_bottom
				{
					border-collapse: collapse;
					border-right: solid 1px windowtext;
					border-top: solid 1px windowtext;
					border-bottom: none;
					border-left: solid 1px windowtext;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 10pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				.graphMain {
						font-family: Arial;
						font-size: 11pt;
						font-weight: normal;
						}
			    .graphLittle {
						font-family: Arial;
						font-size: 8pt;
						}

			    .graphDelim {
						font-family: Arial;
						font-size: 4pt;
						}

				.normal
				{
					font-size: 11pt;
					font-family:Arial;
				}			
	
				.bold
				{
					font-weight: bold;
					font-family:Arial;
					font-size: 9pt;
				}			
	
				.italic
				{
				font-style: italic;
				font-family:Arial;
				font-size: 8pt;
				}			
				</style>
			</head>
			<body>
				<xsl:choose>
					<xsl:when test="dcd:ReleaseSign=0"> <!-- ТРЕБОВАНИЕ (до выпуска) -->
						<div class="page">
							<table style="border:solid 0pt;width:190mm">
								<tbody>
									<tr>
										<td align="center" class="header" style="border:solid 0pt">
											<span>ТРЕБОВАНИЕ<br/>о внесении изменений (дополнений) в сведения,заявленные в декларации<br/></span>
											<span>на товары, до выпуска товара<br/><br/></span>
											<table style="border:solid 0pt;width:80mm" align="center">
												<tbody>
													<tr>
														<td align="right" class="header" style="width 9%;border:solid 0pt">от  </td>
														<td align="center" class="header" style="width 1%;border:solid 0pt">"</td>
														<td align="center" class="header" style="width 5%;border-top:solid 0pt;border-bottom:solid 1pt;border-left:solid 0pt;border-right:solid 0pt">
															<xsl:value-of select="substring(dcd:DecisionDate, 9, 2)"/>
														</td>
														<td align="center" class="header" style="width 1%;border:solid 0pt">"</td>
														<td align="center" class="header" style="width 2%;border:solid 0pt"> </td>
														<td align="center" class="header" style="width 15%;border-top:solid 0pt;border-bottom:solid 1pt;border-left:solid 0pt;border-right:solid 0pt">
															<xsl:call-template name="month_name">
																<xsl:with-param name="date" select="dcd:DecisionDate"/>
															</xsl:call-template>
														</td>
														<td align="center" class="header" style="width 2%;border:solid 0pt"> </td>
														<td align="right" class="header" style="width 2%;border:solid 0pt"><xsl:value-of select="substring(dcd:DecisionDate, 1, 2)"/></td>
														<td align="left" class="header" style="width 2%;border-top:solid 0pt;border-bottom:solid 1pt;border-left:solid 0pt;border-right:solid 0pt">
															<xsl:value-of select="substring(dcd:DecisionDate, 3, 2)"/>
														</td>
														<td align="center" class="header" style="width 2%;border:solid 0pt"> </td>
														<td align="left" class="header" style="width 9%;border:solid 0pt"> г.</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table class="w190" cellpadding="5">
								<tbody>
									<tr>
										<td class="bordered"  width="40%" align="center" valign="middle">
											<span class="normal">
													<xsl:value-of select="dcd:Customs/cat_ru:Code"/>
											</span>
										</td>
										<td class="nobordered" width="20%"></td>
										<td class="bordered" width="40%" align="center">
											<span class="normal">
												<xsl:choose>
													<xsl:when test="dcd:Declarant/cat_ru:OrganizationName"><xsl:value-of select="dcd:Declarant/cat_ru:OrganizationName"/></xsl:when>
													<xsl:when test="dcd:Declarant/cat_ru:ShortName"><xsl:value-of select="dcd:Declarant/cat_ru:ShortName"/></xsl:when>
													<xsl:otherwise> </xsl:otherwise>
												</xsl:choose>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						   
							<table style="width:190mm;border:solid 0pt">
								<tr>
									<td class="graphMain" colspan="2" style="width:190mm;border:solid 0pt">
									   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="left" class="graphMain" style="border:solid 0pt">
										<xsl:text>&#160;&#160;&#160;&#160;В соответсвии с пунктом 2 статьи 112 Таможенного кодекса Евразийского экономического союза </xsl:text>
										<xsl:text>уведомляем, что в ходе проведения таможенного контроля в отношении товаров и сведений, </xsl:text>
										<xsl:text>заявленных в декларации на товары с регистрационным № </xsl:text>
										<xsl:for-each select="dcd:ChangesDescription[1]"> 
											<u>&#160;<xsl:apply-templates select="dcd:DeclRegNumber"/>&#160;</u> , 
										</xsl:for-each>	
									</td>
								</tr>
								<tr>
									<td align="left" class="graphMain" style="border:solid 0pt">
										<xsl:text>выявлено следующее: &#160;&#160;&#160;&#160; </xsl:text>
											<u>&#160; 
												<xsl:for-each select="dcd:DecisionFoundation">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">&#160;</xsl:if>
												</xsl:for-each>
												<xsl:if test="dcd:ResTKPV">
													<xsl:text>, Номер документа по результатам ТКПВТ </xsl:text>
													<xsl:value-of select="dcd:ResTKPV"/>
												</xsl:if> &#160;
											</u>
									</td>
								</tr>
								<tr>
									<td align="left" class="graphMain" style="border:solid 0pt">
										<xsl:text>&#160;&#160;&#160;&#160;В целях устранения выявленных нарушений в срок до </xsl:text>
										" 
											<u>&#160;&#160;<xsl:value-of select="substring(dcd:DateLimit, 9, 2)"/>&#160;&#160;
											</u>&#160;"&#160;
											<u>&#160;&#160;
												<xsl:call-template name="month_name">
													<xsl:with-param name="date" select="dcd:DateLimit"/>
												</xsl:call-template>
												&#160;&#160;
											</u>&#160;&#160;<xsl:value-of select="substring(dcd:DateLimit, 1, 2)"/>
											<u><xsl:value-of select="substring(dcd:DateLimit, 3, 2)"/>&#160;&#160;</u>
											&#160;г. необходимо внести изменения (дополнения) в следующие сведения, заявленные в декларации на товары:
									</td>
								</tr>
								<tr>
									<td class="graphMain" style="width:190mm;border:solid 0pt" colspan="2">
										<table cellpadding="0" cellspacing="0" style="width:190mm;border:solid 1pt #000000">
											<tr>
												<td width="5%" align="center" class="bold" style="border:solid 1pt #000000">№ п/п</td>
												<td width="12%" align="center" class="bold" style="border:solid 1pt #000000">Порядковый<br/>номер товара</td>
												<td width="13%" align="center" class="bold" style="border:solid 1pt #000000">Номер графы/<br/>подраздела<br/>графы</td>
												<td width="25%" align="center" class="bold" style="border:solid 1pt #000000">Заявленные<br/>сведения</td>
												<td width="25%" align="center" class="bold" style="border:solid 1pt #000000">Измененные<br/>(дополненные)<br/>сведения</td>
											</tr>
											<xsl:for-each select="dcd:ChangesDescription">
											<tr>
												<td width="5%" align="center" class="graphMain" style="border:solid 1pt #000000" rowspan="{count(dcd:ChangeDetails)}"><xsl:value-of select="position()"/></td>
													<xsl:for-each select="dcd:ChangeDetails">
														<xsl:choose>
														<xsl:when test="position()!=1">
														<tr>
															<td width="12%" class="graphMain" align="center" style="border:solid 1pt #000000">
															<xsl:if test="dcd:GoodsNumeric"><xsl:value-of select="dcd:GoodsNumeric"/></xsl:if></td>
															<td  width="13%" class="graphMain" align="center" style="border:solid 1pt #000000">
															<xsl:value-of select="dcd:GRNumber"/></td>
															<td  width="25%" class="graphMain" style="border:solid 1pt #000000" align="left">
															<xsl:for-each select="dcd:PreviousData">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
															</xsl:for-each><br/><br/>
															</td>
															<td  width="25%" class="graphMain" style="border:solid 1pt #000000" align="left">
															<xsl:for-each select="dcd:CorrectData">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
															</xsl:for-each>
															</td>
														</tr>
														</xsl:when>
														<xsl:otherwise>
															<td width="12%" class="graphMain" align="center" style="border:solid 1pt #000000">
															<xsl:if test="dcd:GoodsNumeric"><xsl:value-of select="dcd:GoodsNumeric"/></xsl:if></td>
															<td width="13%" class="graphMain" align="center" style="border:solid 1pt #000000">
															<xsl:value-of select="dcd:GRNumber"/></td>
															<td width="25%" class="graphMain" style="border:solid 1pt #000000" align="left">
															<xsl:for-each select="dcd:PreviousData">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
															</xsl:for-each><br/><br/>
															</td>
															<td width="25%" class="graphMain" style="border:solid 1pt #000000" align="left">
															<xsl:for-each select="dcd:CorrectData">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
															</xsl:for-each>
															</td>
														</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>
											</tr>
											</xsl:for-each>
										</table>
									</td>
								</tr>
								<tr>
									<td class="graphDelim nobordered"><br/></td>
								</tr>
							</table>
							<table style="width:190mm;border:solid 0pt">
								<tr>
									<td class="graphMain" colspan="2" style="width:190mm;border:solid 0pt">
									   <table border="0" style="width:190mm">
										  <tbody>
											 <tr>
												<td class="graphMain" colspan="5" style="width:190mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											 </tr>
											 <tr>
												 <xsl:for-each select="dcd:CustomsPerson">
													<td align="center" class="normal" style="width:63mm;border:solid 0pt">
														   <xsl:value-of select="cat_ru:PersonName"/>
														   <xsl:if test="dcd:Post"> (<xsl:value-of select="dcd:Post"/>)</xsl:if>
													</td>
													<td class="graphMain" style="width:1mm;border:solid 0pt">
													   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td align="center" class="normal" style="width:63mm;border:solid 0pt">
													   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td class="graphMain" style="width:1mm;border:solid 0pt">
													   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td align="center" class="normal" style="width:62mm;border:solid 1pt #000000" rowspan="2" valign="bottom">
														<xsl:if test="cat_ru:LNP"><xsl:value-of select="cat_ru:LNP"/></xsl:if>
													</td>
												</xsl:for-each>
											 </tr>
											 <tr>
												<td align="center" class="graphLittle" style="width:63mm;border:solid 0pt; border-top:solid 1pt #000000;">
												(Ф.И.О. должностного лица таможенного органа)*
											</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graphLittle" style="width:63mm;border:solid 0pt;border-top:solid 1pt #000000">
												(подпись)*
												</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
											 </tr>
										  </tbody>
									   </table>
									</td>
								</tr>
								<tr>
									<td class="graphDelim nobordered" colspan="2"><br/></td>
								</tr>
								<tr>
									<td class="graphMain" colspan="2" style="width:190mm;border:solid 0pt">Требование получено:</td>
								</tr>
								<tr>
									<td class="graphMain" colspan="2" style="width:190mm;border:solid 0pt">
									   <table border="0" style="width:190mm;border:solid 0pt">
										  <tbody>
											 <tr>
												<td class="graphMain" colspan="5" style="width:190mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
											 </tr>
											 <tr>
												<td align="center" class="normal" style="width:63mm;border:solid 0pt">
												<xsl:if test="dcd:ReceiveInfo">
												   <xsl:value-of select="dcd:ReceiveInfo/dcd:PersonName"/></xsl:if>
												</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="normal" style="width:63mm;border:solid 0pt">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="normal" style="width:62mm;border:solid 0pt">
												<xsl:if test="dcd:ReceiveInfo"> 
												   <xsl:call-template name="russian_date">
													  <xsl:with-param name="dateIn" select="dcd:ReceiveInfo/dcd:Date"/>
												   </xsl:call-template>
												   </xsl:if>  
												</td>
											 </tr>
											 <tr>
												<td align="center" class="graphLittle" style="width:63mm;border:solid 0pt;border-top:solid 1pt #000000">
												(Ф.И.О. декларанта (таможенного представителя))
											</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graphLittle" style="width:63mm;border:solid 0pt;border-top:solid 1pt #000000">
												(подпись)
												</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graphLittle" style="width:62mm;border:solid 0pt;border-top:solid 1pt #000000">
												(дата и время получения требования)
												</td>
											 </tr>
										  </tbody>
									   </table>
									</td>
								 </tr>
								<tr>
									<td class="graphDelim nobordered" colspan="2"><br/></td>
								</tr>
								<tr>
									<td class="graphMain" colspan="2" style="width:190mm;border:solid 0pt">Требование направлено*:</td>
								</tr>

								<tr>
									<td class="graphMain" colspan="2" style="width:190mm;border:solid 0pt;">
										<table border="0" style="width:190mm;border:solid 0pt">
											<tbody>
												<tr>
													<td class="graphDelim nobordered" colspan="3"><br/></td>
												</tr>
												<tr>
													<td align="center" class="normal" colspan="5" style="width:190mm;border:solid 0pt">
														<xsl:if test="dcd:SendInfo">
													<!--<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>-->
															<xsl:value-of select="dcd:SendInfo/dcd:SendAddress/cat_ru:PostalCode"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:value-of select="dcd:SendInfo/dcd:SendAddress/cat_ru:CountryCode"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:value-of select="dcd:SendInfo/dcd:SendAddress/cat_ru:CounryName"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:value-of select="dcd:SendInfo/dcd:SendAddress/cat_ru:Region"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:value-of select="dcd:SendInfo/dcd:SendAddress/cat_ru:City"/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:value-of select="dcd:SendInfo/dcd:SendAddress/cat_ru:StreetHouse"/></xsl:if>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphLittle" colspan="5" style="width:190mm;border:solid 0pt;border-top:solid 1pt #000000">
													(адрес электронной почты - указывается при направлении решения по электронной почте)</td>
												</tr> 
												<tr>
													<td class="graphDelim nobordered" colspan="3"><br/></td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>	
								<tr>
									<td class="graphMain" colspan="2" style="width:190mm;border:solid 0pt">
									   <table border="0" style="width:190mm">
										  <tbody>
											 <tr>
												<td class="graphMain" colspan="5" style="width:190mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											 </tr>
											 <tr>
												 <xsl:for-each select="dcd:SendInfo">
													<td align="center" class="normal" style="width:63mm;border:solid 0pt">
														   <xsl:value-of select="dcd:PersonName"/>
														   <xsl:if test="dcd:Post"> (<xsl:value-of select="dcd:Post"/>)</xsl:if>
													</td>
													<td class="graphMain" style="width:1mm;border:solid 0pt">
													   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td align="center" class="normal" style="width:63mm;border:solid 0pt">
													   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td class="graphMain" style="width:1mm;border:solid 0pt">
													  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
													<td align="center" class="normal" style="width:62mm;border:solid 0pt">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="dcd:Date"/>
														</xsl:call-template>
													</td>
													<td class="graphMain" style="width:1mm;border:solid 0pt">
													   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td align="center" class="normal" style="width:62mm;border:solid 1pt #000000" rowspan="2" valign="bottom">
														<xsl:value-of select="' '"/>
														<!--xsl:if test="cat_ru:LNP"><xsl:value-of select="cat_ru:LNP"/></xsl:if-->
													</td>
												</xsl:for-each>
											 </tr>
											 <tr>
												<td align="center" class="graphLittle" style="width:63mm;border:solid 0pt; border-top:solid 1pt #000000;">
												(Ф.И.О. должностного лица таможенного органа, направившего требование по электронной почте)
											</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graphLittle" style="width:63mm;border:solid 0pt;border-top:solid 1pt #000000">
												(подпись)
												</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graphLittle" style="width:62mm;border:solid 0pt;border-top:solid 1pt #000000">
												(дата и время направления)
												</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
											 </tr>
										  </tbody>
									   </table>
									</td>
								</tr>
							</table>
						</div>
					</xsl:when>
					<xsl:when test="dcd:ReleaseSign=1"> <!-- РЕШЕНИЕ (после выпуска)-->
						<div class="page">
							<table style="border:solid 0pt;width:190mm">
								<tbody>
									<tr>
										<td align="center" class="header" style="border:solid 0pt">
											<span>РЕШЕНИЕ<br/>о внесении изменений (дополнений) в сведения, заявленные<br/></span>
											<span>в декларации на товары<br/><br/></span>
											<table style="border:solid 0pt;width:80mm" align="center">
												<tbody>
													<tr>
														<td align="right" class="header" style="width 9%;border:solid 0pt">от  </td>
														<td align="center" class="header" style="width 1%;border:solid 0pt">"</td>
														<td align="center" class="header" style="width 5%;border-top:solid 0pt;border-bottom:solid 1pt;border-left:solid 0pt;border-right:solid 0pt">
															<xsl:value-of select="substring(dcd:DecisionDate, 9, 2)"/>
														</td>
														<td align="center" class="header" style="width 1%;border:solid 0pt">"</td>
														<td align="center" class="header" style="width 2%;border:solid 0pt"> </td>
														<td align="center" class="header" style="width 15%;border-top:solid 0pt;border-bottom:solid 1pt;border-left:solid 0pt;border-right:solid 0pt">
															<xsl:call-template name="month_name">
																<xsl:with-param name="date" select="dcd:DecisionDate"/>
															</xsl:call-template>
														</td>
														<td align="center" class="header" style="width 2%;border:solid 0pt"> </td>
														<td align="right" class="header" style="width 2%;border:solid 0pt"><xsl:value-of select="substring(dcd:DecisionDate, 1, 2)"/></td>
														<td align="left" class="header" style="width 2%;border-top:solid 0pt;border-bottom:solid 1pt;border-left:solid 0pt;border-right:solid 0pt">
															<xsl:value-of select="substring(dcd:DecisionDate, 3, 2)"/>
														</td>
														<td align="center" class="header" style="width 2%;border:solid 0pt"> </td>
														<td align="left" class="header" style="width 9%;border:solid 0pt"> г.</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table class="w190" cellpadding="5">
								<tbody>
									<tr>
										<td class="bordered"  width="40%"  align="center">
											<span class="normal">
												<xsl:choose>
													<xsl:when test="dcd:Customs/cat_ru:OfficeName"><xsl:value-of select="dcd:Customs/cat_ru:OfficeName"/></xsl:when>
													<xsl:otherwise>Код ТО: <xsl:value-of select="dcd:Customs/cat_ru:Code"/></xsl:otherwise>
												</xsl:choose>
											</span>
										</td>
										<td class="nobordered" width="20%"></td>
										<td class="bordered" width="40%"  align="center">
											<span class="normal">
												<xsl:choose>
													<xsl:when test="dcd:Declarant/cat_ru:OrganizationName"><xsl:value-of select="dcd:Declarant/cat_ru:OrganizationName"/></xsl:when>
													<xsl:when test="dcd:Declarant/cat_ru:ShortName"><xsl:value-of select="dcd:Declarant/cat_ru:ShortName"/></xsl:when>
													<xsl:otherwise> </xsl:otherwise>
												</xsl:choose>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						   
							<table style="width:190mm;border:solid 0pt">
								<tr>
									<td class="graphMain" colspan="2" style="width:190mm;border:solid 0pt">
									   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="left" class="graphMain" colspan="2" style="width:190mm;border:solid 0pt">
										<xsl:text>&#160;&#160;&#160;&#160;На основании </xsl:text>
										<xsl:choose>
											<xsl:when test="dcd:Paragraph">
												<xsl:text>абзаца </xsl:text>
												<u>&#160;&#160;<xsl:value-of select="dcd:Paragraph"/>&#160;&#160;</u>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>абзаца </xsl:text>
												<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="dcd:Subparagraph">
												<xsl:text> подпункта </xsl:text>
												<u>&#160;&#160;<xsl:value-of select="dcd:Subparagraph"/>&#160;&#160;</u>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text> подпункта </xsl:text>
												<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:text> пункта 11 </xsl:text>
										<xsl:text>Порядка внесения изменений (дополнений) в</xsl:text><br/>
										<xsl:text>сведения, заявленные в декларации на товары, утвержденного Решением Коллегии Евразийской</xsl:text><br/>
										<xsl:text>экономической комиссии от 10 декабря 2013г. №289, в связи с</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="left" class="graphMain" colspan="2" style="width:190mm;border:solid 0pt;border-bottom:solid 1pt black">
										<xsl:for-each select="dcd:DecisionFoundation">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">&#160;</xsl:if>
										</xsl:for-each>
										<xsl:if test="dcd:ResTKPV">
											 <xsl:text>, Номер документа по результатам ТКПВТ </xsl:text>
											 <xsl:value-of select="dcd:ResTKPV"/>
										</xsl:if>
									</td>
								</tr>
								 <tr>
									<td align="center" class="graphLittle" colspan="2" style="width:190mm;border:solid 0pt;">
									(основания внесения изменений (дополнений) в сведения, заявленные в декларации на товары)
									</td>
								</tr>
								<tr>
									<td class="graphDelim nobordered"><br/></td>
								</tr>
								<tr>
									<td class="graphMain" style="width:190mm;border:solid 0pt" colspan="2">
										<table cellpadding="0" cellspacing="0" style="width:190mm;border:solid 1pt #000000">
											<tr>
												<td width="5%" align="center" class="bold" style="border:solid 1pt #000000">№ п/п</td>
												<td width="23%" align="center" class="bold" style="border:solid 1pt #000000">Регистрационный номер<br/>декларации на товары</td>
												<td width="13%" align="center" class="bold" style="border:solid 1pt #000000">Порядковый<br/>номер товара</td>
												<td width="13%" align="center" class="bold" style="border:solid 1pt #000000">Номер графы/<br/>подраздела<br/>графы</td>
												<td width="23%" align="center" class="bold" style="border:solid 1pt #000000">Ранее<br/>указанные<br/>сведения</td>
												<td width="23%" align="center" class="bold" style="border:solid 1pt #000000">Измененные<br/>(дополненные)<br/>сведения</td>
											</tr>
											<xsl:for-each select="dcd:ChangesDescription">
											<tr>
												<td width="5%" align="center" class="graphMain" style="border:solid 1pt #000000" rowspan="{count(dcd:ChangeDetails)}"><xsl:value-of select="position()"/></td>
												<td width="23%" align="center" class="graphMain" style="border:solid 1pt #000000" rowspan="{count(dcd:ChangeDetails)}"><xsl:apply-templates select="dcd:DeclRegNumber"/></td>
													<xsl:for-each select="dcd:ChangeDetails">
														<xsl:choose>
														<xsl:when test="position()!=1">
														<tr>
															<td width="13%" class="graphMain" align="center" style="border:solid 1pt #000000">
															<xsl:if test="dcd:GoodsNumeric"><xsl:value-of select="dcd:GoodsNumeric"/></xsl:if></td>
															<td  width="13%" class="graphMain" align="center" style="border:solid 1pt #000000">
															<xsl:value-of select="dcd:GRNumber"/></td>
															<td  width="23%" class="graphMain" style="border:solid 1pt #000000" align="left">
															<xsl:for-each select="dcd:PreviousData">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
															</xsl:for-each><br/><br/>
															</td>
															<td  width="23%" class="graphMain" style="border:solid 1pt #000000" align="left">
															<xsl:for-each select="dcd:CorrectData">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
															</xsl:for-each>
															</td>
														</tr>
														</xsl:when>
														<xsl:otherwise>
															<td width="13%" class="graphMain" align="center" style="border:solid 1pt #000000">
															<xsl:if test="dcd:GoodsNumeric"><xsl:value-of select="dcd:GoodsNumeric"/></xsl:if></td>
															<td width="13%" class="graphMain" align="center" style="border:solid 1pt #000000">
															<xsl:value-of select="dcd:GRNumber"/></td>
															<td width="23%" class="graphMain" style="border:solid 1pt #000000" align="left">
															<xsl:for-each select="dcd:PreviousData">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
															</xsl:for-each><br/><br/>
															</td>
															<td width="23%" class="graphMain" style="border:solid 1pt #000000" align="left">
															<xsl:for-each select="dcd:CorrectData">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
															</xsl:for-each>
															</td>
														</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>
											</tr>
											</xsl:for-each>
										</table>
									</td>
								</tr>
								<tr>
									<td class="graphDelim nobordered"><br/></td>
								</tr>
							</table>
							<table style="width:190mm;border:solid 0pt">
								<tr>
									<td width="20%" align="left" class="graphMain" style="border:solid 0pt">
										<xsl:text>В срок не позднее</xsl:text>
									</td>
									<td width="80%" align="left" class="graphMain" style="border-top:solid 0pt;border-bottom:solid 1pt;border-left:solid 0pt;border-right:solid 0pt">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="dcd:DateLimit"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td width="20%" align="left" class="graphMain" style="border:solid 0pt"/>
									<td width="80%" align="center" class="graphLittle" style="border:solid 0pt;">
									(указывается срок в соответствии с пунктом 24 Порядка внесения изменений (дополнений) в сведения, заявленные в декларации на товары)
									</td>
								</tr>
							</table>
							<table style="width:190mm;border:solid 0pt">
								<tr>
									<td align="left" class="graphMain" colspan="2" style="width:190mm;border:solid 0pt">декларанту необходимо представить корректировку декларации на товары и ее электронную копию, в случае корректировки таможенной стоимости товаров - также декларацию таможенной стоимости и ее электронную копию, а в случае уплаты таможенных пошлин, налогов и иных платежей, взимание которых возложено на таможенные органы, - также документы и (или) сведения, подтверждающие их уплату.
									</td>
								</tr>
								<tr>
									<td class="graphMain" colspan="2" style="width:190mm;border:solid 0pt">
									   <table border="0" style="width:190mm">
										  <tbody>
											 <tr>
												<td class="graphMain" colspan="5" style="width:190mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											 </tr>
											 <tr>
												 <xsl:for-each select="dcd:CustomsPerson">
													<td align="center" class="normal" style="width:63mm;border:solid 0pt">
														   <xsl:value-of select="cat_ru:PersonName"/>
														   <xsl:if test="dcd:Post"> (<xsl:value-of select="dcd:Post"/>)</xsl:if>
													</td>
													<td class="graphMain" style="width:1mm;border:solid 0pt">
													   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td align="center" class="normal" style="width:63mm;border:solid 0pt">
													   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td class="graphMain" style="width:1mm;border:solid 0pt">
													   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													</td>
													<td align="center" class="normal" style="width:62mm;border:solid 1pt #000000" rowspan="2" valign="bottom">
														<xsl:if test="cat_ru:LNP"><xsl:value-of select="cat_ru:LNP"/></xsl:if>
													</td>
												</xsl:for-each>
											 </tr>
											 <tr>
												<td align="center" class="graphLittle" style="width:63mm;border:solid 0pt; border-top:solid 1pt #000000;">
												(Ф.И.О. должностного лица таможенного органа)
											</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graphLittle" style="width:63mm;border:solid 0pt;border-top:solid 1pt #000000">
												(подпись)
												</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
											 </tr>
										  </tbody>
									   </table>
									</td>
								 </tr>
								<tr>
									<td class="graphMain" colspan="2" style="width:190mm;border:solid 0pt">
									   <table border="0" style="width:190mm;border:solid 0pt">
										  <tbody>
											 <tr>
												<td class="graphMain" colspan="5" style="width:190mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
											 </tr>
											 <tr>
												<td align="center" class="normal" style="width:63mm;border:solid 0pt">
												<xsl:if test="dcd:ReceiveInfo">
												   <xsl:value-of select="dcd:ReceiveInfo/dcd:PersonName"/></xsl:if>
												</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="normal" style="width:63mm;border:solid 0pt">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="normal" style="width:62mm;border:solid 0pt">
												<xsl:if test="dcd:ReceiveInfo"> 
												   <xsl:call-template name="russian_date">
													  <xsl:with-param name="dateIn" select="dcd:ReceiveInfo/dcd:Date"/>
												   </xsl:call-template>
												   </xsl:if>  
												</td>
											 </tr>
											 <tr>
												<td align="center" class="graphLittle" style="width:63mm;border:solid 0pt;border-top:solid 1pt #000000">
												(Ф.И.О. представителя декларанта (таможенного представителя))
											</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graphLittle" style="width:63mm;border:solid 0pt;border-top:solid 1pt #000000">
												(подпись)
												</td>
												<td class="graphMain" style="width:1mm;border:solid 0pt">
												   <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graphLittle" style="width:62mm;border:solid 0pt;border-top:solid 1pt #000000">
												(дата получения решения)
												</td>
											 </tr>
										  </tbody>
									   </table>
									</td>
								 </tr>
								<!--<xsl:if test="rktsg:SendResolution">-->
									<!--<tr>
									   <td align="left" class="graphMain" colspan="2" style="width:190mm">
										  <xsl:text>При направлении почтой </xsl:text>
									   </td>
									</tr>-->
									<tr>
									   <td class="graphMain" colspan="2" style="width:190mm;border:solid 0pt;">
										  <table border="0" style="width:190mm;border:solid 0pt">
											 <tbody>
												<tr>
													<td class="graphDelim nobordered" colspan="3"><br/></td>
												</tr>
												<tr>
												   <td align="center" class="normal" colspan="5" style="width:190mm;border:solid 0pt">
												   <xsl:if test="dcd:SendInfo">
													  <!--<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>-->
													  <xsl:value-of select="dcd:SendInfo/dcd:SendAddress/cat_ru:PostalCode"/>
													  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													  <xsl:value-of select="dcd:SendInfo/dcd:SendAddress/cat_ru:CountryCode"/>
													  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													  <xsl:value-of select="dcd:SendInfo/dcd:SendAddress/cat_ru:CounryName"/>
													  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													  <xsl:value-of select="dcd:SendInfo/dcd:SendAddress/cat_ru:Region"/>
													  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													  <xsl:value-of select="dcd:SendInfo/dcd:SendAddress/cat_ru:City"/>
													  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													  <xsl:value-of select="dcd:SendInfo/dcd:SendAddress/cat_ru:StreetHouse"/></xsl:if>
												   </td>
												</tr>
												<tr>
													<td align="center" class="graphLittle" colspan="5" style="width:190mm;border:solid 0pt;border-top:solid 1pt #000000">
													(почтовый адрес направления решения - указывается при направлении решения по почте)</td>
												</tr> 
												<tr>
													<td class="graphDelim nobordered" colspan="3"><br/></td>
												</tr>
												<tr>
												   <td align="center" class="normal" style="width:75mm;border:solid 0pt">
													  <xsl:call-template name="russian_date">
														 <xsl:with-param name="dateIn" select="dcd:SendInfo/dcd:Date"/>
													  </xsl:call-template>
												   </td>
												   <td class="graphMain" style="width:10mm;border:solid 0pt">
													  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												   </td>
												   <td align="center" class="normal" style="width:75mm;border:solid 0pt">
													  <xsl:value-of select="dcd:SendInfo/dcd:PersonName"/>
												   </td>
												</tr>
												<tr>
												   <td align="center" class="graphLittle" style="width:75mm;border:solid 0pt;border-top:solid 1pt #000000">
												(дата направления решения по почте)
													</td>
												   <td class="graphMain" style="width:10mm;border:solid 0pt">
													  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												   </td>
												   <td align="center" class="graphLittle" style="width:75mm;border:solid 0pt;border-top:solid 1pt #000000">
												(Ф.И.О. и подпись должностного лица таможенного органа, направившего решение по почте)
													</td>
												</tr>
											 </tbody>
										  </table>
									   </td>
									</tr>
								 <!--</xsl:if>-->
							</table>
						</div>
					</xsl:when>	
				</xsl:choose>
					
				<xsl:if test="dcd:ProjectDate or dcd:coordinationDate or dcd:ProcedureID or dcd:DecisionNum or dcd:DocSign or dcd:ProcedureID or
									dcd:Customs/cat_ru:OfficeName or dcd:Customs/cat_ru:CustomsCountryCode or dcd:Customs/dcd:Address or 
									dcd:Customs/dcd:PostalAddress or ((string-length(dcd:Declarant/cat_ru:OfficeName) = 0) and (string-length(dcd:Declarant/cat_ru:ShortName) &gt; 0) and (dcd:ReleaseSign = 1)) or 
									((string-length(dcd:Declarant/cat_ru:OfficeName) &gt; 0) and (dcd:ReleaseSign = 0)) or 
									dcd:Declarant/cat_ru:OrganizationLanguage or dcd:Declarant/cat_ru:RFOrganizationFeatures or 
									dcd:Declarant/cat_ru:RKOrganizationFeatures or dcd:Declarant/cat_ru:RBOrganizationFeatures or 
									dcd:Declarant/cat_ru:RAOrganizationFeatures or dcd:Declarant/cat_ru:KGOrganizationFeatures or 
									dcd:Declarant/cat_ru:Address or dcd:Declarant/cat_ru:IdentityCard or dcd:Declarant/cat_ru:Contact or dcd:KDTCustoms or dcd:ProjectDate or dcd:coordinationDate">
					<div class="page">
						<h3 align="center">ДОПОЛНИТЕЛЬНЫЕ СВЕДЕНИЯ</h3>
						<br/>
						<table>
							<xsl:if test="dcd:DocSign">
								<tr>
									<td class="graphMain" style="width:30%">Статус документа</td>
									<td class="graphMain" style="width:70%">
										<xsl:choose>
											<xsl:when test="dcd:DocSign=0">Документ направлен в адрес декларанта</xsl:when>
											<xsl:when test="dcd:DocSign=1">Проект документа</xsl:when>
											<xsl:when test="dcd:DocSign=2">Документ согласован таможенным органом</xsl:when>
											<xsl:otherwise>Решение</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="dcd:DecisionNum">
								<tr>
									<td class="graphMain" style="width:30%">№ документа</td>
									<td class="graphMain" style="width:70%"><xsl:value-of select="dcd:DecisionNum"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="dcd:ProcedureID">
								<tr>
									<td class="graphMain" style="width:30%">ID процедуры декларирования</td>
									<td class="graphMain" style="width:70%"><xsl:value-of select="dcd:ProcedureID"/></td>
								</tr>
							</xsl:if>
							<tr>
								<td class="graphMain" style="width:30%">Таможенный орган:</td>
								<td class="graphMain" style="width:70%"> </td>
							</tr>
							<xsl:for-each select="dcd:Customs">
								<xsl:if test="cat_ru:OfficeName">
									<tr>
										<td class="graphMain" style="width:30%">&#160;&#160;&#160;Код ТО</td>
										<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:Code"/></td>
									</tr>
								</xsl:if>
								<xsl:if test="cat_ru:CustomsCountryCode">
									<tr>
										<td class="graphMain" style="width:30%">&#160;&#160;&#160;Код государства</td>
										<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:CustomsCountryCode"/></td>
									</tr>
								</xsl:if>
								<xsl:if test="dcd:Address">
									<tr>
										<td class="graphMain" style="width:30%">&#160;&#160;&#160;Юридический адрес</td>
										<td class="graphMain" style="width:70%"><xsl:apply-templates select="dcd:Address"/></td>
									</tr>
								</xsl:if>
								<xsl:if test="dcd:PostalAddress">
									<tr>
										<td class="graphMain" style="width:30%">&#160;&#160;&#160;Почтовый адрес</td>
										<td class="graphMain" style="width:70%"><xsl:apply-templates select="dcd:PostalAddress"/></td>
									</tr>
								</xsl:if>
							</xsl:for-each>	
							<tr>
								<td class="graphMain" style="width:30%">Декларант:</td>
								<td class="graphMain" style="width:70%"> </td>
							</tr>
							<xsl:for-each select="dcd:Declarant">
								<xsl:if test="(string-length(cat_ru:OfficeName) = 0) and (string-length(cat_ru:ShortName) &gt; 0) and (./dcd:ReleaseSign = 1)">
									<tr>
										<td class="graphMain" style="width:30%">&#160;&#160;&#160;Код ТО</td>
										<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:Code"/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(string-length(cat_ru:OfficeName) &gt; 0) and (./dcd:ReleaseSign = 0)">
									<tr>
										<td class="graphMain" style="width:30%">&#160;&#160;&#160;Наименование ТО</td>
										<td class="graphMain" style="width:70%"><xsl:value-of select="OfficeName"/></td>
									</tr>
								</xsl:if>
								<xsl:if test="cat_ru:OrganizationLanguage">
									<tr>
										<td class="graphMain" style="width:30%">&#160;&#160;&#160;Код языка заполнения<br/>&#160;&#160;&#160;наименования</td>
										<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
									</tr>
								</xsl:if>
	
								<xsl:if test="cat_ru:RFOrganizationFeatures">
									<xsl:for-each select="cat_ru:RFOrganizationFeatures">
										<xsl:if test="cat_ru:OGRN">
											<tr>
												<td class="graphMain" style="width:30%">&#160;&#160;&#160;ОГРН</td>
												<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:OGRN"/></td>
											</tr>
										</xsl:if>
										<xsl:if test="cat_ru:INN">
											<tr>
												<td class="graphMain" style="width:30%">&#160;&#160;&#160;ИНН</td>
												<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:INN"/></td>
											</tr>
										</xsl:if>
										<xsl:if test="cat_ru:KPP">
											<tr>
												<td class="graphMain" style="width:30%">&#160;&#160;&#160;КПП</td>
												<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:KPP"/></td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="cat_ru:RKOrganizationFeatures">
									<xsl:for-each select="cat_ru:RKOrganizationFeatures">
										<xsl:if test="cat_ru:BIN">
											<tr>
												<td class="graphMain" style="width:30%">&#160;&#160;&#160;БИН</td>
												<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:BIN"/></td>
											</tr>
										</xsl:if>
										<xsl:if test="cat_ru:IIN">
											<tr>
												<td class="graphMain" style="width:30%">&#160;&#160;&#160;ИИН</td>
												<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:IIN"/></td>
											</tr>
										</xsl:if>
										<xsl:if test="cat_ru:ITN">
											<tr>
												<td class="graphMain" style="width:30%">&#160;&#160;&#160;ИТН</td>
												<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:ITN/cat_ru:CategoryCode" />/
																											  <xsl:value-of select="cat_ru:ITN/cat_ru:KATOCode" />/
																											  <xsl:value-of select="cat_ru:ITN/cat_ru:RNN" />
																											  <xsl:if test="cat_ru:ITN/cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITN/cat_ru:ITNReserv"/></xsl:if>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="cat_ru:RBOrganizationFeatures">
									<xsl:for-each select="cat_ru:RBOrganizationFeatures">
										<xsl:if test="cat_ru:UNP">
											<tr>
												<td class="graphMain" style="width:30%">&#160;&#160;&#160;УНП</td>
												<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:UNP"/></td>
											</tr>
										</xsl:if>
										<xsl:if test="cat_ru:RBIdentificationNumber">
											<tr>
												<td class="graphMain" style="width:30%">&#160;&#160;&#160;Идентификационный<br/>&#160;&#160;&#160;номер ФЛ</td>
												<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:RBIdentificationNumber"/></td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="cat_ru:RAOrganizationFeatures">
									<xsl:for-each select="cat_ru:RAOrganizationFeatures">
										<xsl:if test="cat_ru:UNN">
											<tr>
												<td class="graphMain" style="width:30%">&#160;&#160;&#160;УНН</td>
												<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:UNN"/></td>
											</tr>
										</xsl:if>
										<xsl:if test="cat_ru:SocialServiceNumber">
											<tr>
												<td class="graphMain" style="width:30%">&#160;&#160;&#160;НЗОУ</td>
												<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:SocialServiceNumber"/></td>
											</tr>
										</xsl:if>
										<xsl:if test="cat_ru:SocialServiceCertificate">
											<tr>
												<td class="graphMain" style="width:30%">&#160;&#160;&#160;Справка об отмене НЗОУ</td>
												<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:SocialServiceCertificate"/></td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="cat_ru:KGOrganizationFeatures">
									<xsl:for-each select="cat_ru:KGOrganizationFeatures">
										<xsl:if test="cat_ru:KGINN">
											<tr>
												<td class="graphMain" style="width:30%">&#160;&#160;&#160;ИНН/ПИН</td>
												<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:KGINN"/></td>
											</tr>
										</xsl:if>
										<xsl:if test="cat_ru:KGOKPO">
											<tr>
												<td class="graphMain" style="width:30%">&#160;&#160;&#160;ОКПО</td>
												<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:KGOKPO"/></td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="cat_ru:Address">
									<tr>
										<td class="graphMain" style="width:30%">&#160;&#160;&#160;Адрес</td>
										<td class="graphMain" style="width:70%"><xsl:apply-templates select="cat_ru:Address"/></td>
									</tr>
								</xsl:if>
								<xsl:if test="cat_ru:IdentityCard">
									<tr>
										<td class="graphMain" style="width:30%">&#160;&#160;&#160;Документ, удостоверяющий<br/>&#160;&#160;&#160;личность</td>
										<td class="graphMain" style="width:70%"><xsl:apply-templates select="cat_ru:IdentityCard"/></td>
									</tr>
								</xsl:if>
								<xsl:if test="cat_ru:Contact">
									<tr>
										<td class="graphMain" style="width:30%">&#160;&#160;&#160;Контактная информация</td>
										<td class="graphMain" style="width:70%"><xsl:apply-templates select="cat_ru:Contact"/></td>
									</tr>
								</xsl:if>
							</xsl:for-each>

							<xsl:if test="dcd:KDTCustoms">
							<tr>
								<td class="graphMain" colspan="2" >Таможенный пост, на который следует предоставить КДТ:</td>
							</tr>
								<xsl:for-each select="dcd:KDTCustoms">
									<tr>
										<td class="graphMain" style="width:30%">&#160;&#160;&#160;Код ТО</td>
										<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:Code"/></td>
									</tr>
									<xsl:if test="cat_ru:OfficeName">
										<tr>
											<td class="graphMain" style="width:30%">&#160;&#160;&#160;Наименование ТО</td>
											<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:OfficeName"/></td>
										</tr>
									</xsl:if>
									<xsl:if test="cat_ru:CustomsCountryCode">
										<tr>
											<td class="graphMain" style="width:30%">&#160;&#160;&#160;Код государства</td>
											<td class="graphMain" style="width:70%"><xsl:value-of select="cat_ru:CustomsCountryCode"/></td>
										</tr>
									</xsl:if>
									<xsl:if test="dcd:Address">
										<tr>
											<td class="graphMain" style="width:30%">&#160;&#160;&#160;Юридический адрес</td>
											<td class="graphMain" style="width:70%"><xsl:apply-templates select="dcd:Address"/></td>
										</tr>
									</xsl:if>
									<xsl:if test="dcd:PostalAddress">
										<tr>
											<td class="graphMain" style="width:30%">&#160;&#160;&#160;Почтовый адрес</td>
											<td class="graphMain" style="width:70%"><xsl:apply-templates select="dcd:PostalAddress"/></td>
										</tr>
									</xsl:if>
								</xsl:for-each>	
							</xsl:if>
							<xsl:if test="dcd:ProjectDate">
								<tr>
									<td class="graphMain" style="width:30%">Дата направления проекта решения таможенному органу</td>
									<td class="graphMain" style="width:70%">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="dcd:ProjectDate"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="dcd:coordinationDate">
								<tr>
									<td class="graphMain" style="width:30%">Дата согласования решения таможенном органом</td>
									<td class="graphMain" style="width:70%">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="dcd:coordinationDate"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="russian_date">
	<xsl:param name="dateIn"/>
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of
				select="substring($dateIn,1,4)"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="cat_ru:Contact">
	<xsl:if test="cat_ru:Phone">
		<xsl:text>Телефон: </xsl:text>
		<xsl:for-each select="cat_ru:Phone">
			<xsl:value-of select="."/>
			<xsl:choose>
				<xsl:when test="position()=last()">
					<br/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>, </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:if>
	<xsl:if test="cat_ru:Fax">						
		<xsl:text>Факс: </xsl:text>
		<xsl:value-of select="cat_ru:Fax"/>
		<br/>		
	</xsl:if>
	<xsl:if test="cat_ru:Telex">
		<xsl:text>Телекс: </xsl:text>
		<xsl:value-of select="cat_ru:Telex"/>
		<br/>
	</xsl:if>
	<xsl:if test="cat_ru:E_mail">
		<xsl:text>E-mail: </xsl:text>
		<xsl:for-each select="cat_ru:E_mail">
			<xsl:value-of select="."/>
			<xsl:choose>
				<xsl:when test="position()=last()">
					<br/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>, </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:if>
</xsl:template>


<xsl:template match="cat_ru:CUOrganizationType | dcd:Declarant">
	<!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
	<xsl:value-of select="cat_ru:OrganizationName"/>
	<xsl:if test="cat_ru:ShortName">
		<xsl:if test="cat_ru:OrganizationName">(</xsl:if>
		<xsl:value-of select="cat_ru:ShortName"/>
		<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
	</xsl:if>&#160;
	
	<xsl:choose>
		<xsl:when test="cat_ru:RFOrganizationFeatures"><br/><xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/></xsl:when>
		<xsl:when test="cat_ru:RKOrganizationFeatures"><br/><xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/></xsl:when>
		<xsl:when test="cat_ru:RBOrganizationFeatures"><br/><xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/></xsl:when>
	</xsl:choose>
	
	<xsl:if test="cat_ru:Address">
		<u>Адрес:</u>&#160;<xsl:apply-templates select="cat_ru:Address"/>
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCard">
		<br/><xsl:apply-templates select="cat_ru:IdentityCard"/>
	</xsl:if>
	<xsl:if test="cat_ru:Contact">
		<u>Контактные сведения:</u>&#160;
		<xsl:for-each select="cat_ru:Contact">
		<xsl:if test="cat_ru:Phone">тел.: <xsl:for-each select="cat_ru:Phone"><xsl:value-of select="."/><xsl:if test="position()!=last()">,&#160;</xsl:if></xsl:for-each> </xsl:if>
		<xsl:if test="cat_ru:Fax"> факс: <xsl:value-of select="cat_ru:Fax"/>&#160;</xsl:if>
		<xsl:if test="cat_ru:Telex">телекс: <xsl:value-of select="cat_ru:Telex"/>&#160;</xsl:if>
		<xsl:if test="cat_ru:E_mail">эл. почта: <xsl:for-each select="cat_ru:E_mail"><xsl:value-of select="."/><xsl:if test="position()!=last()">,&#160;</xsl:if></xsl:for-each> </xsl:if></xsl:for-each> 
		</xsl:if>	
</xsl:template>
    
<xsl:template match="cat_ru:RFOrganizationFeatures">
	<xsl:if test="cat_ru:OGRN">
		<span>ОГРН: <xsl:value-of select="cat_ru:OGRN" /></span>&#160;
	</xsl:if>
	<xsl:if test="cat_ru:INN">
		<span>ИНН: <xsl:value-of select="cat_ru:INN" /></span>&#160;
	</xsl:if>
	<xsl:if test="cat_ru:KPP">
		<span>	КПП: <xsl:value-of select="cat_ru:KPP" /></span>&#160;
	</xsl:if>
</xsl:template>

<xsl:template match="cat_ru:RBOrganizationFeatures">
	<xsl:if test="cat_ru:UNP">
		<span>УНП: <xsl:value-of select="cat_ru:UNP" /></span>&#160;
	</xsl:if>
	<xsl:if test="cat_ru:RBIdentificationNumber">
		<span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber" /></span>&#160;
	</xsl:if>
</xsl:template>

<xsl:template match="cat_ru:RKOrganizationFeatures">
	<xsl:if test="cat_ru:BIN">
		<span>БИН: <xsl:value-of select="cat_ru:BIN" /></span>&#160;
	</xsl:if>
	<xsl:if test="cat_ru:IIN">
		<span>ИИН: <xsl:value-of select="cat_ru:IIN" /></span>&#160;
	</xsl:if>
	<xsl:for-each select="cat_ru:ITN">
		<span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode" />/<xsl:value-of select="cat_ru:KATOCode" />/<xsl:value-of select="cat_ru:RNN" /><xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/></xsl:if>
			</span>&#160;
	</xsl:for-each>
</xsl:template>

<xsl:template match="cat_ru:Address | dcd:Address | dcd:PostalAddress">
	<xsl:if test="cat_ru:PostalCode"><xsl:value-of select="cat_ru:PostalCode"/>,&#160;</xsl:if>
	<xsl:if test="cat_ru:CounryName"><xsl:value-of select="cat_ru:CounryName" /></xsl:if>
	<xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
	<xsl:if test="cat_ru:Region">
		<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
		<xsl:value-of select="cat_ru:Region" />
	</xsl:if>
	<xsl:if test="cat_ru:City">
		<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
		<xsl:value-of select="cat_ru:City" />
	</xsl:if>
	<xsl:if test="cat_ru:StreetHouse">
		<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
		<xsl:value-of select="cat_ru:StreetHouse"/>
	</xsl:if>
</xsl:template>

<xsl:template match="cat_ru:IdentityCard">
	<xsl:if test="cat_ru:IdentityCardName"><xsl:value-of select="cat_ru:IdentityCardName"/></xsl:if>
	<xsl:if test="cat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
	<xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">&#160;</xsl:if>
	<xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
		<span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			<xsl:text disable-output-escaping="yes" >&amp;nbsp;</xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardNumber"/>
		</span>
		&#160;
	</xsl:if>
	<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName"	>
		Выдан
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
		</xsl:call-template>
		<xsl:text disable-output-escaping="yes" >&amp;nbsp;</xsl:text>
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<br/>
	</xsl:if>
</xsl:template>
<xsl:template match="dcd:DeclRegNumber"><!--код/дата/номер-->
	<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/><xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
	<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
</xsl:template>
<xsl:template name="month_name">
	<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="substring($date, 6, 2)='01'"><xsl:value-of select="'января'"/></xsl:when>
			<xsl:when test="substring($date, 6, 2)='02'"><xsl:value-of select="'февраля'"/></xsl:when>
			<xsl:when test="substring($date, 6, 2)='03'"><xsl:value-of select="'марта'"/></xsl:when>
			<xsl:when test="substring($date, 6, 2)='04'"><xsl:value-of select="'апреля'"/></xsl:when>
			<xsl:when test="substring($date, 6, 2)='05'"><xsl:value-of select="'мая'"/></xsl:when>
			<xsl:when test="substring($date, 6, 2)='06'"><xsl:value-of select="'июня'"/></xsl:when>
			<xsl:when test="substring($date, 6, 2)='07'"><xsl:value-of select="'июля'"/></xsl:when>
			<xsl:when test="substring($date, 6, 2)='08'"><xsl:value-of select="'августа'"/></xsl:when>
			<xsl:when test="substring($date, 6, 2)='09'"><xsl:value-of select="'сентября'"/></xsl:when>
			<xsl:when test="substring($date, 6, 2)='10'"><xsl:value-of select="'октября'"/></xsl:when>
			<xsl:when test="substring($date, 6, 2)='11'"><xsl:value-of select="'ноября'"/></xsl:when>
			<xsl:when test="substring($date, 6, 2)='12'"><xsl:value-of select="'декабря'"/></xsl:when>
		</xsl:choose>
</xsl:template>
</xsl:stylesheet>
