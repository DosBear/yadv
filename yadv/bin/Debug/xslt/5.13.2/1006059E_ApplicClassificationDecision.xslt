<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:acd="urn:customs.ru:Information:CustomsDocuments:ApplicClassificationDecision:5.12.0">
	<!-- Шаблон для типа ApplicClassificationDecisionType -->
	<xsl:template match="acd:ApplicClassificationDecision">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
					padding: 10mm 10mm 10mm;
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
					
					table.persSignature {
                        width: 100%;
                        border-collapse: separate;
                    }

                    table.persSignature, table.persSignature tr td {
                        border: none;
                        margin-top: 10px;
                        border-spacing: 8px 0;
                    }

                    table.persSignature tr td.graphUnderline {
                        padding: 0 6px;
                    }

                    table.persSignature tr td.graphUnderline {
                        border: none;
                        border-bottom: 1px dotted black;
                        text-align: center;
                        vertical-align: bottom;
                    }

                    td.graph, table.persSignature tr td.graph {
                        border: none;
                        font-size: 90%;
                        text-align: center;
                        padding: 0;
                        spacing: 0;
                        white-space: normal;
                    }
                    
                    table.application {
                        border: 1px solid #000000;
                        vertical-align: top;
                        border-collapse: collapse;
                    }

                    table.application td {
                        vertical-align: top;
                        border: 1px solid #000000;
                    }
				</style>
			</head>
			<body>
				<div class="page">
					<xsl:if test="acd:IDDoc='КР'">
						<table border="0" style="width:190mm">
							<tbody>
								<tr>
									<td align="center" style="font-size: 14pt;">
										<b>ЗАЯВЛЕНИЕ<br/>О ПРИНЯНИИ РЕШЕНИЯ ПО КЛАССИФИКАЦИИ</b>
											<br/>
										<br/>
									</td>
								</tr>
								<xsl:if test="acd:CustomsDecl">
									<tr>
										<td>
											<b>Наименование таможенного органа</b><br/>
											<xsl:value-of select="acd:CustomsDecl/cat_ru:Code"/><xsl:text> </xsl:text><xsl:value-of select="acd:CustomsDecl/cat_ru:OfficeName"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td>
										<b>Сведения о заявителе</b><br/>
										<xsl:apply-templates select="acd:Declarant"/>
									</td>
								</tr>
								<xsl:if test="acd:ApplicationRegistration/cat_ru:PrDocumentNumber">
									<tr>
										<td>
											<b>Исходящий номер заявления</b><br/>
											<xsl:value-of select="acd:ApplicationRegistration/cat_ru:PrDocumentNumber"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="acd:ApplicationRegistration/cat_ru:PrDocumentDate">
									<tr>
										<td>
											<b>Дата исходящего заявления</b><br/>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="acd:ApplicationRegistration/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="acd:GoodsDescription or acd:GoodsInformation">
									<tr>
										<td>
											<b>Наименование товара, указанного в заявлении о принятии решения</b><br/>
												<xsl:if test="acd:GoodsDescription">
													<xsl:for-each select="acd:GoodsDescription">
														<xsl:value-of select="."/>
													</xsl:for-each>
													<br/>
												</xsl:if>
												<xsl:apply-templates select="acd:GoodsInformation"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="acd:CustomsModeCode">
									<tr>
										<td>
											<b>Вид таможенной процедуры</b><br/>
											<xsl:value-of select="acd:CustomsModeCode"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td>
										<b>Срок поставки товара</b><br/>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="acd:TermOfDelivery"/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:if test="acd:AttachedDocuments">
									<tr>
										<td>
											<b>Прилагаемые документы</b><br/>
											<xsl:apply-templates select="acd:AttachedDocuments"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td>
										<br/><br/>Подпись заявителя
										<xsl:apply-templates select="acd:PersonSignature"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="acd:IDDoc='ИЗ'">
						<table border="0" style="width:190mm">
							<tbody>
								<tr>
									<td align="center" style="font-size: 14pt;">
										<b>ЗАЯВЛЕНИЕ<br/>О ПРИНЯНИИ РЕШЕНИЯ О ВНЕСЕНИИ ИЗМЕНЕНИЙ В РЕШЕНИЕ<br/>ПО КЛАССИФИКАЦИИ</b>
											<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<b>Сведения о заявителе</b><br/>
										<xsl:apply-templates select="acd:Declarant"/>
									</td>
								</tr>
								<xsl:if test="acd:ApplicationRegistration/cat_ru:PrDocumentNumber">
									<tr>
										<td>
											<b>Исходящий номер заявления</b><br/>
											<xsl:value-of select="acd:ApplicationRegistration/cat_ru:PrDocumentNumber"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="acd:ApplicationRegistration/cat_ru:PrDocumentDate">
									<tr>
										<td>
											<b>Дата исходящего заявления</b><br/>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="acd:ApplicationRegistration/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="acd:PrecedingDecisionRegNumber">
									<tr>
										<td>
											<b>Регистрационный номер решения</b><br/>
											<xsl:apply-templates select="acd:PrecedingDecisionRegNumber"/>
										</td>
									</tr>
									<tr>
										<td>
											<b>Дата принятия решения</b><br/>
											<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="acd:PrecedingDecisionRegNumber/acd:Date"/></xsl:call-template>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="acd:AttachedDocuments">
									<tr>
										<td>
											<b>Прилагаемые документы</b><br/>
											<xsl:apply-templates select="acd:AttachedDocuments"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td>
										<br/><br/>Подпись заявителя
										<xsl:apply-templates select="acd:PersonSignature"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</div>
				<xsl:call-template name="application"/>
			</body>
		</html>
	</xsl:template>
	<!-- таблица приложения -->
	<xsl:template name="application">
		<div class="page">
			<table class="application">
				<tbody>
					<tr style="text-align:center">
						<td>N компонента</td>
						<td>Наименование компонента</td>
						<td>Код ТН ВЭД ЕАЭС</td>
						<td>Количество</td>
						<td>Единица измерения</td>
						<td>Вес нетто (кг)</td>
					</tr>
					<tr style="text-align:center">
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
					</tr>
					<xsl:for-each select="//catESAD_cu:MechanismUnit">
						<xsl:variable name="numPosition" select="position()"/>
						<tr>
							<td align="left" style="padding-left:5mm">
								<xsl:value-of select="position()"/>.
							</td>
							<td align="center">
								<xsl:value-of select="catESAD_cu:UnitDescription"/>
							</td>
							<td align="center" >
								<xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/>
							</td>
							<td align="center" >
								<xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
							</td>
							<td align="center" >
								<xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
								(<xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)
							</td>
								<td align="center" >
								<xsl:value-of select="catESAD_cu:KGWeight"/>
							</td>
						</tr>
						<xsl:for-each select="./catESAD_cu:MechUnitPart">
							<tr>
								<td align="left" style="padding-left:5mm">
									<xsl:value-of select="$numPosition"/>.<xsl:value-of select="position()"/>
								</td>
								<td align="center" >
									<xsl:value-of select="catESAD_cu:PartDescription"/>
								</td>
								<td align="center" >
									<xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/>
								</td>
								<td align="center" >
									<xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:GoodsQuantity"/>
								</td>
								<td align="center" >
									<xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/>
									(<xsl:value-of select="catESAD_cu:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/>)
								</td>
								<td align="center" >
									<xsl:value-of select="catESAD_cu:KGWeight"/>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<!-- Регистраницонный номер-->
	<xsl:template match="acd:PrecedingDecisionRegNumber">
		<xsl:value-of select="acd:IDDoc"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="acd:CountryCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="acd:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring(acd:Date, 3, 2)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="acd:SerialNumber"/>
	</xsl:template>
	<!-- Подпись заявителя -->
   <xsl:template match="acd:PersonSignature">
      <table class="persSignature">
         <tbody>
            <tr>
               <td class="graphUnderline" style="width: 30%">
                  <xsl:value-of select="cat_ru:PersonPost"/>
               </td>
               <td style="width: 5%;"/>
               <td class="graphUnderline" style="width: 30%"/>
               <td style="width: 5%;"/>
               <td class="graphUnderline" style="width: 30%">
                  <xsl:value-of select="cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="cat_ru:PersonMiddleName"/>
               </td>
            </tr>
            <tr>
               <td class="graph">(должность)</td>
               <td/>
               <td class="graph">(подпись)</td>
               <td/>
               <td class="graph">(Ф.И.О.)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
	<!-- Прилагаемые документы -->
	<xsl:template match="acd:AttachedDocuments">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
	</xsl:template>
	<!-- Характеристики товара -->
	<xsl:template match="acd:GoodsInformation">
		марка <xsl:value-of select="acd:GoodsMark"/>
		<xsl:if test="acd:GoodsModel">
			<xsl:text>, модель </xsl:text>
			<xsl:value-of select="acd:GoodsModel"/>
		</xsl:if>
		<xsl:if test="acd:GoodsMarking">
			<xsl:text>, артикул </xsl:text>
			<xsl:value-of select="acd:GoodsMarking"/>
		</xsl:if>
		<xsl:if test="acd:GoodsOtherInfo">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="acd:GoodsOtherInfo"/>
		</xsl:if>
	</xsl:template>
	<!-- Адрес -->
	<xsl:template match="cat_ru:Address">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Декларант -->
	<xsl:template match="acd:Declarant">
		<xsl:if test="acd:Chief">
		<xsl:if test="acd:Chief/cat_ru:PersonPost">
		   <xsl:value-of select="acd:Chief/cat_ru:PersonPost"/><xsl:text>: </xsl:text>
		</xsl:if>
		<xsl:value-of select="acd:Chief/cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="acd:Chief/cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="acd:Chief/cat_ru:PersonMiddleName"/>
		<br/>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
		<xsl:value-of select="cat_ru:OrganizationName"/><br/>
		</xsl:if>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
		<xsl:value-of select="cat_ru:ShortName"/><br/>
		</xsl:if>
		<xsl:if test="cat_ru:Address">
		<xsl:apply-templates select="cat_ru:Address"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
		ОГРН <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
		ИНН <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
		</xsl:if>
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
</xsl:stylesheet>
