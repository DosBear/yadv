<?xml version="1.0" encoding="UTF-8"?>
<!-- Приказ ФТС от 04.02 2019 г. № 169 " О формах документов, предусмотренных стетьей 158 Федерального закона от 2 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации
  и о внесении изменений в отдельные законодательные акты Российской Федерации", в целях вывоза товаров, помещенных под таможенную процедуру свободного склада, и (или) товаров,
изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободного склада, с территории свободного склада на остальную часть таможенной территории 
Евразийского экономического союза без завершения действия таможенной процедуры свободного склада"
Приложение № 2 - Разрешение о вывозе товаров (DocKind1)
Приложение № 4 - Решение о продлении срока вывоза товаров (DocKind2)
-->
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:defwg="urn:customs.ru:Information:CustomsDocuments:DecisionExpFreeWHGoods:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Шаблон отображения даты -->
   <xsl:template match="cat_ru:IssueDate">
      <b>Дата</b>
      <xsl:text> </xsl:text>
      <xsl:call-template name="date">
         <xsl:with-param name="text" select="."/>
      </xsl:call-template>
   </xsl:template>
	<!-- Основной документ -->
	<xsl:template match="defwg:DecisionExpFreeWHGoods">
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
			width: 180mm;
			margin: 10px auto;
			margin-top: 6pt;
			margin-bottom: 6pt;
			padding: 10mm;
			padding-left: 20mm;
			background: #ffffff;
			border: solid 1pt #000000;
			page-break-after: always;
			}

			.marg-top
			{
			margin-top:5mm;
			}

			table
			{
			width: 100%;
            table-layout: fixed;			
			word-wrap: break-word;
			border: 0;
			empty-cells: show;
			border-collapse: collapse;
			margin-top: 1px;
			}

			table.border tr td
			{
			border: 1px solid windowtext;
			}

			.graph {
			font-family: Arial;
			font-size: 10pt;
			}

			.graphLittle 
			{
			font-family: Arial;
			font-size: 7pt;
			vertical-align:top;
			text-align: center;
			}

			.value
			{
			border-bottom: solid 1px black;
			font-style: italic;
			}

			div.title, tr.title td { font-weight:bold;  }
			.bordered { border-collapse: collapse; }
			td.bordered
			{
			border: solid 1px windowtext;
			}

			td.bordered_no_bottom
			{
			border-top: solid 1px windowtext;
			border-bottom: solid 0px windowtext;
			border-left: solid 1px windowtext;
			border-right: solid 1px windowtext;
			}

			td.bordered_no_top
			{
			border-top: solid 0px windowtext;
			border-bottom: solid 1px windowtext;
			border-left: solid 1px windowtext;
			border-right: solid 1px windowtext;
			}

			.border_bottom
			{
			border-bottom: 1px solid black;
			font-style: italic;
			}

			.graphMain
			{
			font-family: Arial;
			font-size: 11pt;
			}

			.graphLittle 
			{
			font-family: Arial;
			font-size: 7pt;
			vertical-align:top;
			}
	
			.graphDelim 
			{
			font-family: Arial;
			font-size: 4pt;
			}

			td
			{
			vertical-align:top;
			padding: 4px;
			}

			td.value.graphMain
			{
			vertical-align:top;
			}

			.graphHeader
			{
			font-family: Arial;
			font-size: 11pt;
			font-weight:bold;
			}

			td.graphHeader
			{
			vertical-align:top;
			}
			td.value.graphHeader
			{
			vertical-align:bottom;
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
			font-size: 9pt;
			}		
			
			.delim {
				height: 7pt;
			}

			.delim_3 {
				height: 3pt;
			}

		</style>
			</head>
			<body>
				<div class="page">
					<xsl:choose>
						<xsl:when test="defwg:DocKind='1'">
							<table>
								<tbody>
									<tr>
										<td class="graphHeader" align="center">
											<xsl:text>Разрешение таможенного органа о вывозе товаров, помещенных под таможенную процедуру 
											свободного склада, и (или) товаров, изготовленных (полученных) из товаров, помещенных 
											под таможенную процедуру свободного склада, с территории свободного склада 
											на остальную часть таможенной территории Евразийского экономического союза 
											без завершения действия таможенной процедуры свободного склада или 
											отказ таможенного органа от выдачи такого разрешения
											</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graphDelim">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="graphMain" align="center">
											<xsl:text>регистрационный № </xsl:text>
											<u>
												<xsl:text>&#160;&#160;</xsl:text>
												<xsl:choose>
													<xsl:when test="defwg:DecisionNumber">
														<xsl:value-of select="defwg:DecisionNumber"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:text>&#160;&#160;</xsl:text>
											</u>
										</td>
									</tr>
									<tr>
										<td class="graphDelim">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<table class="graphMain">
								<tbody valign="top">
									<tr>
										<td width="50%"/>
										<td width="25%"/>
										<td width="25%"/>
									</tr>
									<tr>
										<td class="bordered_no_bottom" align="center">
											<span class="bold"><xsl:text>1. Наименование таможенного органа</xsl:text></span>
										</td>
										<td class="bordered_no_bottom" colspan="2" align="center">
											<span class="bold"><xsl:text>2. Сведения о заявителе</xsl:text></span>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" align="left">
											<xsl:if test="defwg:Customs/cat_ru:OfficeName">
												<xsl:value-of select="defwg:Customs/cat_ru:OfficeName"/>
												<xsl:text> (</xsl:text>
											</xsl:if>
											<xsl:value-of select="defwg:Customs/cat_ru:Code"/>
											<xsl:if test="defwg:Customs/cat_ru:OfficeName">
												<xsl:text>)</xsl:text>
											</xsl:if>
										</td>
										<td class="bordered_no_top" colspan="2" align="left">
											<xsl:apply-templates select="defwg:Applicant"/>
										</td>
									</tr>
									<tr>
										<td class="bordered" colspan="3" align="center">
											<span class="bold"><xsl:text>3. Сведения о товарах, вывозимых за пределы территории свободного склада для совершения операций за его пределами (далее - товары):</xsl:text></span>
										</td>
									</tr>
									<xsl:for-each select="defwg:GoodsInfo">
										<tr>
											<td class="bordered_no_bottom" align="center">
												<span class="bold"><xsl:text>3.1. Наименование товара</xsl:text></span>
											</td>
											<td class="bordered_no_bottom" align="center">
												<span class="bold"><xsl:text>3.2. Количество товара</xsl:text></span>
											</td>
											<td class="bordered_no_bottom" align="center">
												<span class="bold"><xsl:text>3.3. Единица измерения</xsl:text></span>
											</td>
										</tr>
										<tr>
											<td class="bordered_no_top" align="left">
												<xsl:apply-templates select="defwg:GoodsDescription"/>
											</td>
											<td class="bordered_no_top" align="left">
												<xsl:value-of select="translate(defwg:GoodsQuantity/cat_ru:GoodsQuantity, '.', ',')"/>
											</td>
											<td class="bordered_no_top" align="left">
												<xsl:if test="defwg:GoodsQuantity/cat_ru:MeasureUnitQualifierName">
													<xsl:value-of select="defwg:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
													<xsl:text> </xsl:text>
												</xsl:if>
												<xsl:if test="defwg:GoodsQuantity/cat_ru:MeasureUnitQualifierCode">
													<xsl:text>(</xsl:text>
													<xsl:value-of select="defwg:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
													<xsl:text>)</xsl:text>
												</xsl:if>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td class="bordered_no_bottom" colspan="3" align="center">
											<span class="bold"><xsl:text>4. Цель вывоза товаров</xsl:text></span>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" colspan="4" align="left">
											<xsl:apply-templates select="defwg:Purpose"/>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_bottom" align="center">
											<span class="bold"><xsl:text>5. Планируемая дата вывоза товаров</xsl:text></span>
										</td>
										<td class="bordered_no_bottom" colspan="2" align="center">
											<span class="bold"><xsl:text>6. Планируемая дата обратного ввоза товаров</xsl:text></span>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" align="left">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="defwg:ExportDate"/>
											</xsl:call-template>
										</td>
										<td class="bordered_no_top" colspan="2" align="left">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="defwg:ImportDate"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_bottom" align="center">
											<span class="bold"><xsl:text>7. Сведения о лице, которому передаются товары</xsl:text></span>
										</td>
										<td class="bordered_no_bottom" colspan="2" align="center">
											<span class="bold"><xsl:text>8. Место совершения действий с товарами за пределами территории свободного склада</xsl:text></span>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" align="left">
											<xsl:apply-templates select="defwg:ConsigneeInfo"/>
										</td>
										<td class="bordered_no_top" colspan="2" align="left">
											<xsl:apply-templates select="defwg:Place"/>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_bottom" colspan="3" align="center">
											<span class="bold"><xsl:text>9. Приложение (перечень документов, подтверждающих заявленные сведения)</xsl:text></span>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" colspan="3" align="left">
											<xsl:for-each select="defwg:ConfirmDocs">
												<xsl:apply-templates select="."/>
												<xsl:if test="position()!=last()">;<br/></xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_bottom" colspan="3" align="center">
											<span class="bold"><xsl:text>10. Решение таможенного органа</xsl:text></span>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" colspan="3" align="left">
											<xsl:apply-templates select="defwg:DecisionText"/>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_bottom" colspan="3" align="center">
											<span class="bold"><xsl:text>11. Должностное лицо таможенного органа, принявшее решение по вывозу товаров</xsl:text></span>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" colspan="3" align="left">
											<xsl:call-template name="PersonSignature">
												<xsl:with-param name="name" select="defwg:CustomsPersonExp"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_bottom" align="center">
											<span class="bold"><xsl:text>12. Срок обратного ввоза товаров (срок, до истечения которого действие таможенной процедуры свободного склада должно быть завершено)</xsl:text></span>
										</td>
										<td class="bordered_no_bottom" colspan="2" align="center">
											<span class="bold"><xsl:text>15. Обоснование решения таможенного органа по отказу в вывозе товаров</xsl:text></span>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" align="left">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="defwg:ReturnDate"/>
											</xsl:call-template>
										</td>
										<td class="bordered_no_top" colspan="2" align="left">
											<xsl:apply-templates select="defwg:RefusalReason"/>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_bottom" align="center">
											<span class="bold"><xsl:text>13. Продление срока обратного ввоза товаров (срока, до истечения которого действие таможенной процедуры свободного склада должно быть завершено)</xsl:text></span>
										</td>
										<td class="bordered_no_bottom" colspan="2" rowspan="2" align="center">
											<span class="bold"><xsl:text>16. Должностное лицо таможенного органа, принявшее решение о продлении срока обратного ввоза товаров (срока, до истечения которого действие таможенной процедуры свободного склада должно быть завершено)</xsl:text></span>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" align="left">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="defwg:ExtensionReturnDate"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_bottom" align="center">
											<span class="bold"><xsl:text>14. Основание для продления срока обратного ввоза товаров (срока, до истечения которого действие таможенной процедуры свободного склада должно быть завершено)</xsl:text></span>
										</td>
										<td class="bordered_no_top" colspan="2" rowspan="2" align="left">
											<xsl:call-template name="PersonSignature">
												<xsl:with-param name="name" select="defwg:CustomsPersonProlong"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" align="left">
											<xsl:apply-templates select="defwg:ExtensionReason"/>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="defwg:DocKind='2'">
							<table>
								<tbody>
									<tr>
										<td class="graphHeader" align="center">
											<xsl:text>Решение таможенного органа о продлении срока вывоза товаров, помещенных под 
											таможенную процедуру свободного склада, и (или) товаров, изготовленных (полученных) 
											из товаров, помещенных под таможенную процедуру свободного склада, с территории 
											свободного склада на остальную часть таможенной территории Евразийского экономического 
											союза без завершения действия таможенной процедуры свободного склада
											</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="graphDelim">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="graphMain" align="center">
											<xsl:text>регистрационный № </xsl:text>
											<u>
												<xsl:text>&#160;&#160;</xsl:text>
												<xsl:choose>
													<xsl:when test="defwg:DecisionNumber">
														<xsl:value-of select="defwg:DecisionNumber"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:text>&#160;&#160;</xsl:text>
											</u>
										</td>
									</tr>
									<tr>
										<td class="graphDelim">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<table class="graphMain">
								<tbody valign="top">
									<tr>
										<td width="50%"/>
										<td width="25%"/>
										<td width="25%"/>
									</tr>
									<tr>
										<td class="bordered_no_bottom" align="center">
											<span class="bold"><xsl:text>1. Наименование таможенного органа</xsl:text></span>
										</td>
										<td class="bordered_no_bottom" colspan="2" align="center">
											<span class="bold"><xsl:text>2. Сведения о заявителе</xsl:text></span>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" align="left">
											<xsl:if test="defwg:Customs/cat_ru:OfficeName">
												<xsl:value-of select="defwg:Customs/cat_ru:OfficeName"/>
												<xsl:text> (</xsl:text>
											</xsl:if>
											<xsl:value-of select="defwg:Customs/cat_ru:Code"/>
											<xsl:if test="defwg:Customs/cat_ru:OfficeName">
												<xsl:text>)</xsl:text>
											</xsl:if>
										</td>
										<td class="bordered_no_top" colspan="2" align="left">
											<xsl:apply-templates select="defwg:Applicant"/>
										</td>
									</tr>
									<tr>
										<td class="bordered" colspan="3" align="center">
											<span class="bold"><xsl:text>3. Сведения о товаре(ах), в отношении которого(ых) продлевается срок обратного ввоза товаров (срок, до истечения которого действие таможенной процедуры свободного склада должно быть завершено):</xsl:text></span>
										</td>
									</tr>
									<xsl:for-each select="defwg:GoodsInfo">
										<tr>
											<td class="bordered_no_bottom" align="center">
												<span class="bold"><xsl:text>3.1. Наименование товара</xsl:text></span>
											</td>
											<td class="bordered_no_bottom" align="center">
												<span class="bold"><xsl:text>3.2. Количество товара</xsl:text></span>
											</td>
											<td class="bordered_no_bottom" align="center">
												<span class="bold"><xsl:text>3.3. Единица измерения</xsl:text></span>
											</td>
										</tr>
										<tr>
											<td class="bordered_no_top" align="left">
												<xsl:apply-templates select="defwg:GoodsDescription"/>
											</td>
											<td class="bordered_no_top" align="left">
												<xsl:value-of select="translate(defwg:GoodsQuantity/cat_ru:GoodsQuantity, '.', ',')"/>
											</td>
											<td class="bordered_no_top" align="left">
												<xsl:if test="defwg:GoodsQuantity/cat_ru:MeasureUnitQualifierName">
													<xsl:value-of select="defwg:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
													<xsl:text> </xsl:text>
												</xsl:if>
												<xsl:if test="defwg:GoodsQuantity/cat_ru:MeasureUnitQualifierCode">
													<xsl:text>(</xsl:text>
													<xsl:value-of select="defwg:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
													<xsl:text>)</xsl:text>
												</xsl:if>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td class="bordered_no_bottom" align="center">
											<span class="bold"><xsl:text>4. Обоснование продления срока обратного ввоза товаров (срока, до истечения которого действие таможенной процедуры свободного склада должно быть завершено)</xsl:text></span>
										</td>
										<td class="bordered_no_bottom" colspan="2" align="center">
											<span class="bold"><xsl:text>5. Документы, подтверждающие необходимость продления срока обратного ввоза товаров (срока, до истечения которого действие таможенной процедуры свободного склада должно быть завершено)</xsl:text></span>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" align="left">
											<xsl:apply-templates select="defwg:ExtensionReason"/>
										</td>
										<td class="bordered_no_top" colspan="2" align="left">
											<xsl:for-each select="defwg:ConfirmDocs">
												<xsl:apply-templates select="."/>
												<xsl:if test="position()!=last()">;<br/></xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_bottom" colspan="3" align="center">
											<span class="bold"><xsl:text>6. Решение таможенного органа о продлении: срока обратного ввоза товаров (срока, до истечения которого действие таможенной процедуры свободного склада должно быть завершено)</xsl:text></span>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" colspan="3" align="left">
											<xsl:apply-templates select="defwg:DecisionText"/>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_bottom" colspan="3" align="center">
											<span class="bold"><xsl:text>7. Срок продления обратного ввоза товаров (срок, до истечения которого действие таможенной процедуры свободного склада должно быть завершено)</xsl:text></span>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" colspan="3" align="left">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="defwg:ExtensionReturnDate"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_bottom" colspan="3" align="center">
											<span class="bold"><xsl:text>8. Должностное лицо таможенного органа, принявшее решение</xsl:text></span>
										</td>
									</tr>
									<tr>
										<td class="bordered_no_top" colspan="3" align="left">
											<xsl:call-template name="PersonSignature">
												<xsl:with-param name="name" select="defwg:CustomsPersonProlong"/>
											</xsl:call-template>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:otherwise>
							Некорректно указан тип документа (DocKind)
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</body>
		</html>
   </xsl:template>
	<!-- Шаблон для типа RUScat_ru:SubjectDetailsType -->
	<xsl:template match="defwg:Applicant | defwg:ConsigneeInfo">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">,&#160;<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<span class="normal">, </span>
			<span class="italic">Документ, удостоверяющий личность</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:if test="position()=1">; 
				<span class="normal">
					<br/>
				</span>
				<span class="italic">Адрес(а)</span>
				<span class="normal">: </span>
				</xsl:if>
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">, </span>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">: </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">, </span>
			<span class="italic">ОГРН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeatures -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">, </span>
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">, </span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">, </span>
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeatures -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">, </span>
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">, </span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeatures -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">, </span>
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">, </span>
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">, </span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeatures -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="italic">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic"> по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType строка -->
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<span class="italic">Тел</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="italic">Факс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Fax"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="italic">Телекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Telex"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="italic">Email</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="RUScat_ru:IdentityCardCode">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardCode"/>
			</span>
			<span class="normal">&#160;</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<xsl:if test="string-length(RUScat_ru:IdentityCardName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
			</span>
			<xsl:if test="string-length(RUScat_ru:IdentityCardName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries">
			<span class="italic">серия</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
			</span>
			<xsl:if test="string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
				<span class="normal">&#160;</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			<span class="italic">№</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</span>
		</xsl:if>
		<xsl:if test="string-length(RUScat_ru:IdentityCardDate) &gt; 0 or string-length(RUScat_ru:OrganizationName) &gt; 0">
			<!--xsl:if test="string-length(RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(RUScat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if-->
			<span class="normal">, </span>
			<span class="italic">выдан</span>
			<span class="normal">: </span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<span class="normal">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationName">
			<span class="normal">&#160;</span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OrganizationName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IssuerCode">
			<span class="normal">, </span>
			<span class="italic">код подразделения</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IssuerCode"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<span class="normal">, </span>
			<span class="italic">идентификатор организации</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AuthorityId"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">, </span>
			<span class="italic">страна в уд.личности</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CommunicationDetails">
		<span class="normal">, </span>
		<span class="italic">Контактные данные</span>
		<span class="normal">: </span>
		<xsl:variable name="temp">
			<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
		</xsl:variable>
		<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
   <!-- Подпись должностного лица -->
   <xsl:template  name="PersonSignature">
	   <xsl:param name="name"/>
      <table class="custPerson">
         <tbody>
            <tr>
               <td class="border_bottom" style="width: 30%">
                  <xsl:value-of select="$name/cat_ru:PersonPost"/>
               </td>
               <td style="width: 5%;"/>
               <td class="border_bottom" style="width: 30%"><br/></td>
               <td style="width: 5%;"/>
               <td class="border_bottom" style="width: 30%">
                  <xsl:value-of select="$name/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="$name/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="$name/cat_ru:PersonMiddleName"/>
               </td>
            </tr>
            <tr>
               <td class="graphLittle">должность</td>
               <td/>
               <td class="graphLittle">подпись</td>
               <td/>
               <td class="graphLittle">фамилия, имя, отчество<br/>(при наличии)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
	<!-- Шаблон для типа defwg:DTInfoType -->
	<xsl:template match="defwg:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gdt_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
		<xsl:if test="defwg:GoodsNum">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="defwg:GoodsNum"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа defwg:AccountDocType -->
	<xsl:template match="defwg:AccountDoc | defwg:CommissioningDoc | defwg:ConfirmDocs">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='PrDocumentNumber'">
					<xsl:text>№ </xsl:text>
					<xsl:value-of select="."/>
				</xsl:when>
				<xsl:when test="local-name()='PrDocumentDate'">
					<xsl:text>от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="local-name()='GoodsNum'">
					<xsl:text>/ </xsl:text>
					<xsl:value-of select="."/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
   <!-- Отображает название месяца по его номеру -->
   <xsl:template name="monthName">
      <xsl:param name="month"/>
      <xsl:choose>
         <xsl:when test="$month = '01'">января</xsl:when>
         <xsl:when test="$month = '02'">февраля</xsl:when>
         <xsl:when test="$month = '03'">марта</xsl:when>
         <xsl:when test="$month = '04'">апреля</xsl:when>
         <xsl:when test="$month = '05'">мая</xsl:when>
         <xsl:when test="$month = '06'">июня</xsl:when>
         <xsl:when test="$month = '07'">июля</xsl:when>
         <xsl:when test="$month = '08'">августа</xsl:when>
         <xsl:when test="$month = '09'">сентября</xsl:when>
         <xsl:when test="$month = '10'">октября</xsl:when>
         <xsl:when test="$month = '11'">ноября</xsl:when>
         <xsl:when test="$month = '12'">декабря</xsl:when>
      </xsl:choose>
   </xsl:template>
   <!--Шаблон для отображения даты по стандартам русской локали (месяц прописью)-->
   <xsl:template name="date">
      <xsl:param name="text"/>
      <xsl:choose>
         <xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
            <xsl:text>«</xsl:text>
            <!--span-->
               <xsl:value-of select="substring($text,9,2)"/>
               <xsl:text>» </xsl:text>
               <xsl:call-template name="monthName">
                  <xsl:with-param name="month" select="substring($text,6,2)"/>
               </xsl:call-template>
               <xsl:text> </xsl:text>
               <xsl:value-of select="substring($text,1,4)"/>
            <!--/span-->
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$text"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
	<xsl:template name="gdt_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/><xsl:value-of select="substring($dateIn,6,2)"/><xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<span class="normal">
					<xsl:value-of select="substring($dateIn,9,2)"/>
					<xsl:text>.</xsl:text>
					<xsl:value-of select="substring($dateIn,6,2)"/>
					<xsl:text>.</xsl:text>
					<xsl:value-of select="substring($dateIn,1,4)"/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
