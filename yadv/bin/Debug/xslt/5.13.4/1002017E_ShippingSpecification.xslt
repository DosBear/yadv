<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:catComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonAgregateTypesCust:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ss="urn:customs.ru:Information:CommercialFinanceDocuments:ShippingSpecification:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="/">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Отгрузочная спецификация</title>
				<style type="text/css">
                    body {background: #CCCCCC;}

                    div.page {
                        width: 297mm;
                        margin: auto;
                        padding: 10mm 5mm 10mm 5mm;
                        background: white;
                        border: solid 1px black;
                        page-break-after: always;
                        margin-top: 10px;
                    }

                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
                    @media print {
                        div.page {border: none; margin: 0; padding: 0;}
                    }

                    table.items {
                        border: solid 1px black;
                        border-collapse: collapse;
                        emptyCells: show;
                        font-family: Arial;
                        font-size: 8pt;
                    }

                    .items th {
                        background: #F0F0F0;
                        vertical-align: middle;
                        font-weight: bold;
                    }

                    .items td, th {
                        border: solid 1px black;
                        padding: 3px;
                        vertical-align: top;
                    }

                    .items td.blank {
                        border: none;
                        width: 10px;
                    }

                    table.markup {
                        border: none;
                        border-collapse: collapse;
                        emptyCells: show;
                        width: 100%;
                    }

                    .markup td, th {
                        padding: 3px;
                    }

                    h2 {
                        text-align: center;
                    }

                    h3 {
                        text-align: center;
                    }

                    .bold {
                        font-weight: bold;
                    }

                    @media print {
                        div.page {
                            border: none;
                        }
                    }
                </style>
			</head>
			<body>
				<div class="page">
					<xsl:apply-templates select="ss:ShippingSpecification"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ss:ShippingSpecification">
		<h2>
            Отгрузочная спецификация
            <xsl:call-template name="PrDocument">
				<xsl:with-param name="base" select="ss:Specification"/>
			</xsl:call-template>
		</h2>
		<table class="markup">
			<tr>
				<td class="bold">Отправитель, продавец:</td>
				<td class="bold">Получатель, покупатель:</td>
			</tr>
			<tr>
				<td>
					<xsl:call-template name="OrganizationBaseType">
						<xsl:with-param name="base" select="ss:Sender"/>
					</xsl:call-template>
				</td>
				<td>
					<xsl:call-template name="OrganizationBaseType">
						<xsl:with-param name="base" select="ss:Receiver"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<p>
            Договор внешнеэкономической сделки
            <xsl:call-template name="PrDocument">
				<xsl:with-param name="base" select="ss:ActivitiesAgreement"/>
			</xsl:call-template>
            .
        </p>
		<xsl:variable name="row2">
			<xsl:choose>
				<xsl:when test="count(//ss:GoodMarking) &gt; 0">
					<xsl:value-of select="1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="row5">
			<xsl:choose>
				<xsl:when test="count(//ss:TNVED) &gt; 0">
					<xsl:value-of select="1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="row8">
			<xsl:choose>
				<xsl:when test="count(//ss:Place) &gt; 0">
					<xsl:value-of select="1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="row9">
			<xsl:choose>
				<xsl:when test="count(//ss:PakageNumber) &gt; 0">
					<xsl:value-of select="1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="row10">
			<xsl:choose>
				<xsl:when test="count(//ss:Quantity) &gt; 0">
					<xsl:value-of select="1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="row11">
			<xsl:choose>
				<xsl:when test="count(//ss:Weight) &gt; 0">
					<xsl:value-of select="1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="row12">
			<xsl:choose>
				<xsl:when test="count(//ss:Dimensions) &gt; 0">
					<xsl:value-of select="1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="row13">
			<xsl:choose>
				<xsl:when test="count(//ss:Price) &gt; 0">
					<xsl:value-of select="1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="row14">
			<xsl:choose>
				<xsl:when test="count(//ss:Cost) &gt; 0">
					<xsl:value-of select="1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="row15">
			<xsl:choose>
				<xsl:when test="count(//ss:CurrencyCode) &gt; 0">
					<xsl:value-of select="1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="row16">
			<xsl:choose>
				<xsl:when test="count(//ss:Transport[catESAD_cu:ContainerNumber]) &gt; 0">
					<xsl:value-of select="1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="row17">
			<xsl:choose>
				<xsl:when test="count(//ss:Notes) &gt; 0">
					<xsl:value-of select="1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="sum_row" select="5+ $row2+$row5+$row8+$row9+$row10"/>
		<h3>Товары отгрузочной спецификации</h3>
		<table class="items">
			<tr>
				<th rowspan="2">№</th>
				<xsl:if test="$row2=1">
					<th rowspan="2">Марка модель</th>
				</xsl:if>
				<th rowspan="2">Артикул</th>
				<th rowspan="2">Код товара</th>
				<xsl:if test="$row5=1">
					<th rowspan="2">Код ТН ВЭД ЕАЭС</th>
				</xsl:if>
				<th rowspan="2">Наименование товара</th>
				<th rowspan="2">Документ о качестве</th>
				<xsl:if test="$row8=1">
					<th rowspan="2">Описание груз. мест (вид, кол-во, вес)</th>
				</xsl:if>
				<xsl:if test="$row9=1">
					<th rowspan="2">Номера мест</th>
				</xsl:if>
				<xsl:if test="$row10=1">
					<th rowspan="2">Кол-во товара</th>
				</xsl:if>
				<xsl:if test="$row11=1">
					<th colspan="2">Вес</th>
				</xsl:if>
				<xsl:if test="$row12=1">
					<th rowspan="2">Размеры</th>
				</xsl:if>
				<xsl:if test="$row13=1">
					<th rowspan="2">Цена товара</th>
				</xsl:if>
				<xsl:if test="$row14=1">
					<th rowspan="2">Стоимость товара</th>
				</xsl:if>
				<xsl:if test="$row15=1">
					<th rowspan="2">Валюта</th>
				</xsl:if>
				<xsl:if test="$row16=1">
					<th rowspan="2">Номера контейнеров</th>
				</xsl:if>
				<xsl:if test="$row17=1">
					<th rowspan="2">Доп. инф-я</th>
				</xsl:if>
			</tr>
			<tr>
				<xsl:if test="$row11=1">
					<th>нетто</th>
					<th>брутто</th>
				</xsl:if>
			</tr>
			<xsl:for-each select="ss:Goods">
				<tr>
					<td>
						<xsl:value-of select="position()"/>
					</td>
					<xsl:if test="$row2=1">
						<td style="font-size:7pt">
							<xsl:value-of select="ss:GoodMarking"/>
						</td>
					</xsl:if>
					<td style="font-size:7pt">
						<xsl:value-of select="ss:Articul"/>
					</td>
					<td style="font-size:7pt">
						<xsl:value-of select="ss:Code"/>
					</td>
					<xsl:if test="$row5=1">
						<td style="font-size:7pt">
							<xsl:value-of select="ss:TNVED"/>
						</td>
					</xsl:if>
					<td style="font-size:7pt">
						<xsl:value-of select="ss:Description"/>
					</td>
					<td style="font-size:7pt">
						<xsl:for-each select="ss:QualityDocument">
							<xsl:value-of select="cat_ru:PrDocumentName"/>&#160;
						<xsl:if test="cat_ru:PrDocumentNumber">№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>&#160;</xsl:if>
							<xsl:if test="cat_ru:PrDocumentDate">
							от <xsl:call-template name="Date">
									<xsl:with-param name="text" select="cat_ru:PrDocumentDate"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:for-each>
					</td>
					<xsl:if test="$row8=1">
						<td align="center" style="font-size:7pt">
							<xsl:for-each select="ss:Place/*">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
						</td>
					</xsl:if>
					<xsl:if test="$row9=1">
						<td style="font-size:7pt">
							<xsl:apply-templates select="ss:PakageNumber"/>
						</td>
					</xsl:if>
					<xsl:if test="$row10=1">
						<td style="font-size:7pt">
							<xsl:value-of select="ss:Quantity"/>&#160;
						<xsl:value-of select="ss:MeasureUnitQualifierName"/>
							<xsl:if test="ss:MeasureUnitQualifierCode and not(ss:MeasureUnitQualifierName)">(код: <xsl:value-of select="ss:MeasureUnitQualifierCode"/>)</xsl:if>
						</td>
					</xsl:if>
					<xsl:if test="$row11=1">
						<td style="font-size:7pt" align="right">
							<xsl:value-of select="ss:Weight/catComFin_ru:NetWeightQuantity"/>
						</td>
						<td style="font-size:7pt" align="right">
							<xsl:value-of select="ss:Weight/catComFin_ru:GrossWeightQuantity"/>
						</td>
					</xsl:if>
					<xsl:if test="$row12=1">
						<td style="font-size:7pt">
							<xsl:value-of select="ss:Dimensions"/>
						</td>
					</xsl:if>
					<xsl:if test="$row13=1">
						<td style="font-size:7pt" align="right">
							<xsl:value-of select="ss:Price"/>
						</td>
					</xsl:if>
					<xsl:if test="$row14=1">
						<td style="font-size:7pt" align="right">
							<xsl:value-of select="ss:Cost"/>
						</td>
					</xsl:if>
					<xsl:if test="$row15=1">
						<td style="font-size:7pt" align="center">
							<xsl:value-of select="ss:CurrencyCode"/>
						</td>
					</xsl:if>
					<xsl:if test="$row16=1">
						<td style="font-size:7pt">
							<xsl:apply-templates select="ss:Transport/catESAD_cu:ContainerNumber"/>
						</td>
					</xsl:if>
					<xsl:if test="$row17=1">
						<td style="font-size:7pt">
							<xsl:value-of select="ss:Notes"/>
						</td>
					</xsl:if>
				</tr>
			</xsl:for-each>
			<tr>
				<td colspan="{$sum_row}">Итого:</td>
				<xsl:if test="$row11=1">
					<td align="right">
						<xsl:value-of select="sum(//ss:Goods/ss:Weight/catComFin_ru:NetWeightQuantity)"/>
					</td>
					<td align="right">
						<xsl:value-of select="sum(//ss:Goods/ss:Weight/catComFin_ru:GrossWeightQuantity)"/>
					</td>
				</xsl:if>
				<xsl:if test="$row12=1">
					<td/>
				</xsl:if>
				<xsl:if test="$row13=1">
					<td/>
				</xsl:if>
				<xsl:if test="$row14=1">
					<td align="right">
						<xsl:value-of select="sum(//ss:Goods/ss:Cost)"/>
					</td>
				</xsl:if>
				<xsl:if test="$row15=1">
					<td/>
				</xsl:if>
				<xsl:if test="$row16=1">
					<td/>
				</xsl:if>
				<xsl:if test="$row17=1">
					<td/>
				</xsl:if>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="catESAD_cu:ContainerNumber">
		<xsl:if test="position() > 1">,</xsl:if>
		<xsl:value-of select="catESAD_cu:ContainerIdentificaror"/>
	</xsl:template>
	<xsl:template match="ss:PakageNumber">
		<xsl:if test="position() > 1">,</xsl:if>
		<xsl:value-of select="."/>
	</xsl:template>
	<!--Шаблоны общего вида-->
	<xsl:template name="PrDocument">
		<xsl:param name="base"/>
		<xsl:if test="$base/cat_ru:PrDocumentNumber">№
            <xsl:value-of select="$base/cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="$base/cat_ru:PrDocumentDate">
            от
            <xsl:call-template name="Date">
				<xsl:with-param name="text" select="$base/cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="OrganizationBaseType">
		<xsl:param name="base"/>
		<table class="markup">
			<tr>
				<td colspan="2">
					<xsl:value-of select="$base/cat_ru:OrganizationName"/>
					<xsl:if test="$base/cat_ru:ShortName">(<xsl:value-of select="$base/cat_ru:ShortName"/>)
                    </xsl:if>
				</td>
			</tr>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
				<tr>
					<td class="bold" style="width: 1%;">ОГРН:</td>
					<td>
						<xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN">
				<tr>
					<td class="bold">ИНН:</td>
					<td>
						<xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
				<tr>
					<td class="bold">КПП:</td>
					<td>
						<xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!--Дата по стандарту русской локали-->
	<xsl:template name="Date">
		<xsl:param name="text"/>
		<xsl:choose>
			<xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
				<xsl:value-of select="substring($text,9,2)"/>.<xsl:value-of select="substring($text,6,2)"/>.<xsl:value-of select="substring($text,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--Документ о качестве-->
	<xsl:template match="ss:QualityDocument">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="Date">
				<xsl:with-param name="text" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>