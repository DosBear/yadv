<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rdd="urn:customs.ru:Information:ExchangeDocuments:ReqDataDecl:5.14.2" xmlns:xs="http://www.w3.org/2001/XMLSchema">
 <!-- Шаблон для типа ReqDataDeclType -->
<xsl:template match="rdd:ReqDataDecl">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					.marg-top
					{
					margin-top:5mm;
					}

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					table.border tr td
					{
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
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
					p{text-indent: 20px; margin: 0;}
				</style>
			</head>
			<body>
				<div class="page">
					<xsl:if test="rdd:DocKind=1">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>ЗАПРОС ДОКУМЕНТОВ И (ИЛИ) СВЕДЕНИЙ</b><br/>
											<xsl:text> от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="rdd:ResolDate"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td width="50%">
										<xsl:value-of select="rdd:OfficeName"/>
									</td>
									<td width="50%">
										<xsl:value-of select="rdd:DeclName"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td style="border-bottom: 2px solid black;text-indent:20px;">
										<xsl:text>В соответствии с пунктом 4 статьи 325 Таможенного кодекса Евразийского экономического союза уведомляем, что в ходе проверки </xsl:text>
										<b>
											<xsl:text>декларации на товары № </xsl:text>
											<u>
												<xsl:apply-templates select="rdd:GTDID"/>
											</u>
										</b>
										<xsl:text> и документов и сведений, обнаружены следующие признаки, указывающие на то, что сведения о таможенной стоимости товаров, заявленных в таможенной декларации, должным образом не подтверждены либо могут являться недостоверными:</xsl:text>
										<br/>
										<u>
											<xsl:apply-templates select="rdd:Violations"/>
										</u>
									</td>
								</tr>
								<tr>
									<td style="text-indent:20px;">
										<xsl:text>В соответствии с пунктом 7 статьи 325 Таможенного кодекса Евразийского экономического союза Вам необходимо </xsl:text>
										<b>
											<xsl:text>в срок</xsl:text>
											<xsl:text> до </xsl:text>
											<!--xsl:apply-templates mode="time_words" select="rdd:DateLimit"/-->
											<xsl:apply-templates mode="date_words" select="rdd:DateLimit"/>
											<xsl:text> года</xsl:text>
										</b>
										<xsl:text> предоставить следующие документы и (или) сведения любо объяснения причин, по которым такие документы и (или) сведения не погут быть представлены и (или) отсутствуют:</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<xsl:apply-templates mode="table" select="."/>
						<p>Запрошенные документы и (или) сведения должны быть представлены одним комплектом (одновременно).</p>
						<p>Одновременно с запрошенными таможенным органом документами и (или) сведениями могут быть представлены иные документы и (или) сведения в целях подтверждения достоверности и полноты сведений, заявленных в таможенной декларации, и (или) сведений, содержащихся в иных документах.</p>
						<br/>
						<p><xsl:apply-templates mode="signs" select="rdd:PreReleaseSign"/>В соответствии с пунктами 6,12 статьи 325 Таможенного кодекса Евразийского экономического союза информируем о возможности произвести выпуск товаров в соответствии со статьей 121 Таможенного кодекса Евразийского экономического союза (до завершения проверки таможенных, иных документов и (или) сведений).</p>
						<br/>
						<p><xsl:apply-templates mode="signs" select="rdd:GuaranteeSign"/>Для выпуска товаров Вам необходимо
							<b>
								<xsl:text> в срок</xsl:text>
								<xsl:text> до </xsl:text>
								<xsl:choose>
									<xsl:when  test="rdd:DateGuarantee">
										<!--xsl:apply-templates mode="time_words" select="rdd:DateLimit"/-->
										<xsl:apply-templates mode="date_words" select="rdd:DateGuarantee"/>
									</xsl:when>
									<xsl:otherwise>
										<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
									</xsl:otherwise>
								</xsl:choose>	
								<xsl:text> года </xsl:text>
							</b>
							предоставить обеспечение исполнения обязанности по уплате таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин.
						</p>
						<br/>
						<p><xsl:apply-templates mode="signs" select="rdd:ReleaseSign"/>При выпуске товаров в соответствии со статьей 121 Таможенного кодекса Евразийского экономического союза документы и (или) сведения, запрошенные таможенным органом, могут быть представлены после выпуска товаров
							<b>
								<xsl:text> в срок</xsl:text>
								<xsl:text> до </xsl:text>
								<xsl:choose>
									<xsl:when  test="rdd:DateRelease">
										<!--xsl:apply-templates mode="time_words" select="rdd:DateLimit"/-->
										<xsl:apply-templates mode="date_words" select="rdd:DateRelease"/>
									</xsl:when>
									<xsl:otherwise>
										<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
									</xsl:otherwise>
								</xsl:choose>	
	
								<xsl:text> года </xsl:text>
							</b>
						</p>
						<br/>
						<br/>
						<div style="width:100%;text-align:right;">
							<xsl:value-of select="rdd:CustomsPerson/cat_ru:PersonName"/>
						</div>
						<!-- br/>
						<br/>
						<br/>
						<br/>
						<div style="border-top: 1px solid black; width:50mm;"/>
						<div style="width:100%;font-size:8pt;">
						* Указывается срок в соответствии с пунктом 7 статьи 325 ТК ЕАЭС:<br/>
						<p>1) не позднее, чем за 4 часа до истечения срока, указанного в пункте 3 статьи 119 ТК ЕАЭС, - если запрос документов и (или) сведений связан с проверкой сведений, содержащихся в таможенной декларации, и документах, представленных при подаче таможенной декларации;</p>
						<p>2) не позднее, чем за 1 рабочий день до истечения срока, установленного таможенным органом при продлении срока выпуска товаров в соответствии с пунктами 4-6 статьи 119 ТК ЕАЭС, - если запрос документв и (или) сведений связан с проверкой сведений, содержащихся в таможенной декларации, и документах, представленных в соответствии с пунктом 2 статьи 325 ТК ЕАЭС, и проверяемые сведения влияют на размер таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин.</p>
						<br/>
						** Указывается срок выпуска товарова, установленный:<br/>
						<p>в пункте 3 статьи 119 ТК ЕАЭС, - если запрос документов и (или) сведений связан с проверкой сведений, содержащихся в таможенной декларации, и документах, представленных при подаче таможенной декларации;</p>
						<p>в пункте 6 статьи 119 ТК ЕАЭС, - если запрос документов и (или) сведений связан с проверкой сведений, содержащихся в таможенной декларации, и документах, представленнх в соответствии с пунктом 2 статьи 325 ТК ЕАЭС, и проверяемые сведения влияют на размер таможенных пошлин, налогов, специальных, антидемпинговых, компенсационных пошлин.</p>
						<br/>
						*** Указывается срок, не превышающий 60 календарных дней со дня регистрации таможенной декларации, за исключением случая, предусмотренного пунктом 2 статьи 314 ТК ЕАЭС.
						</div-->
					</xsl:if>
					<xsl:if test="rdd:DocKind=2">
						<table class="w190">
							<tbody>
								<tr>
									<td align="center" class="graphMain">
										<font size="4">
											<b>ЗАПРОС<br/>
											ДОПОЛНИТЕЛЬНЫХ ДОКУМЕНТОВ И (ИЛИ) СВЕДЕНИЙ<br/>
											В СООТВЕТСТВИИ С ПУНКТОМ 15 СТАТЬИ 325 ТК ЕАЭС</b><br/>
											<xsl:text> от </xsl:text>
											<xsl:apply-templates mode="russian_date" select="rdd:ResolDate"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rdd:OfficeName"/>
									</td>
									<td width="20%"/>
									<td width="40%" style="border-bottom: 1px solid black;">
										<xsl:value-of select="rdd:DeclName"/>
									</td>
								</tr>
								<tr align="center" valign="top">
									<td style="font-size: 8pt; font-style: italic;">(наименование таможенного органа)</td>
									<td></td>
									<td style="font-size: 8pt; font-style: italic;">(наименование декларанта или таможенного представителя)</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<p style="border-bottom: 2px solid black; text-indent:20px;">
							Уведомляем, что представленные документы и (или) сведения в соответствии с пунктами 1 и 4 статьи 325 Таможенного кодекса ЕАЭС не устраняют основания для проведения проверки таможенных, иных документов и (или) сведений в отношении таможенной стоимости товаров, заявленных в декларации на товары №
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="rdd:GTDID"/>
							<xsl:text>, </xsl:text>
							по следующим основаниям:
							<br/>
							<u>
								<xsl:apply-templates select="rdd:Violations"/>
							</u>
						</p>
						<br/>
						<p style="text-indent: 20px;">
							Для целей установления достоверности и полноты проверяемых сведений, заявленных в таможенной декларации и (или) сведений, содержащихся в иных документах, в соответствии с пунктом 15 статьи 325 Таможенного кодекса ЕАЭС необходимо в срок до
							<xsl:text> </xsl:text>
							<xsl:apply-templates mode="date_words" select="rdd:DateLimit"/>
							<xsl:text> года </xsl:text>
							представить следующие документы и (или) сведения:
						</p>
						<xsl:apply-templates mode="table" select="."/>
						<br/>
						<br/>
						<table class="w190">
							<tbody>
								<tr align="center">
									<td style="border-bottom:1px solid black;">
										<xsl:value-of select="rdd:CustomsPerson/cat_ru:PersonName"/>
										<xsl:if test="rdd:CustomsPerson/cat_ru:LNP">
											<xsl:text>, ЛНП: </xsl:text>
											<xsl:value-of select="rdd:CustomsPerson/cat_ru:LNP"/>
										</xsl:if>
									</td>
								</tr>
								<tr align="center">
									<td style="font-size:8pt; font-style: italic;">(Ф.И.О. должностного лица уполномоченного таможенного органа, ЭЦП)</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template mode="signs" match="*">
		<xsl:variable name="color">
			<xsl:choose>
				<xsl:when test=". = 'true' or . = 1"/>
				<xsl:otherwise>color: white;</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div style="display: inline-block; border: 1px solid black; width:5mm; height:5 mm;text-align:center;{$color}">
			V
		</div>
	</xsl:template>
	
	<xsl:template mode="table" match="*">
		<table width="100%">
			<tbody>
				<tr valign="top" align="center">
					<td class="bordered" width="5%">№ п/п</td>
					<td class="bordered">Перечень заявленных сведений, требующих подтверждения/уточнения</td>
					<td class="bordered">Перечень запрашиваемых документов и (или) сведений</td>
					<td class="bordered">Примечание</td>
				</tr>
				<tr align="center">
					<td class="bordered">1</td>
					<td class="bordered">2</td>
					<td class="bordered">3</td>
					<td class="bordered">4</td>
				</tr>
				<xsl:for-each select="rdd:CustomsCostInf">
					<tr valign="top">
						<td class="bordered">
							<xsl:value-of select="rdd:Position"/>
						</td>
						<td class="bordered">
							<xsl:apply-templates select="rdd:CustCostInf"/>
						</td>
						<td class="bordered">
							<xsl:for-each select="rdd:ReqDocuments">
								<xsl:value-of select="rdd:PrDocumentName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="rdd:PrDocumentNumber"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates mode="russian_date" select="rdd:PrDocumentDate"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="rdd:RequestPositionID"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="rdd:DocCode"/>
								<xsl:if test="rdd:CommKind">
									<xsl:choose>
										<xsl:when test="rdd:CommKind=0"> документ из архива декларанта </xsl:when>
										<xsl:otherwise> Способ представления документа: <xsl:value-of select="rdd:CommKind"/></xsl:otherwise>
									</xsl:choose>
								</xsl:if>	
								<xsl:apply-templates select="rdd:Comment"/>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</td>
						<td class="bordered">
							<xsl:apply-templates select="rdd:Comment"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="rdd:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="num_date" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	
	<xsl:template mode="num_date" match="*">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:value-of select="substring(.,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring(.,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring(.,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template mode="time_words" match="*">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:value-of select="substring(.,12,2)"/>
				<xsl:text> часов </xsl:text>
				<xsl:value-of select="substring(.,14,2)"/>
				<xsl:text> минут </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template mode="date_words" match="*">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:text> "</xsl:text>
				<xsl:value-of select="substring(.,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:if test="substring(.,6,2)='01'">января</xsl:if>
				<xsl:if test="substring(.,6,2)='02'">февраля</xsl:if>
				<xsl:if test="substring(.,6,2)='03'">марта</xsl:if>
				<xsl:if test="substring(.,6,2)='04'">апреля</xsl:if>
				<xsl:if test="substring(.,6,2)='05'">мая</xsl:if>
				<xsl:if test="substring(.,6,2)='06'">июня</xsl:if>
				<xsl:if test="substring(.,6,2)='07'">июля</xsl:if>
				<xsl:if test="substring(.,6,2)='08'">августа</xsl:if>
				<xsl:if test="substring(.,6,2)='09'">сентября</xsl:if>
				<xsl:if test="substring(.,6,2)='10'">октября</xsl:if>
				<xsl:if test="substring(.,6,2)='11'">ноября</xsl:if>
				<xsl:if test="substring(.,6,2)='12'">декабря</xsl:if>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring(.,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template mode="russian_date" match="*">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:value-of select="substring(.,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring(.,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring(.,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>