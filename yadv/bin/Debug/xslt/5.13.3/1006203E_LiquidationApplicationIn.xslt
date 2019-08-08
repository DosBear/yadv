<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:liqapin="urn:customs.ru:Information:CustomsDocuments:LiquidationApplicationIn:5.12.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="liqapin:LiquidationApplicationIn">
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>Разрешение на помещение товаров под таможенную процедуру отказа в пользу государства</title>
				<style>
					body {
					background: #cccccc;
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
					p.ConsPlusNonformat, li.ConsPlusNonformat, div.ConsPlusNonformat
					{mso-style-name:ConsPlusNonformat;
					margin:0cm;
					margin-bottom:.0001pt;
					text-autospace:none;
					font-size:10.0pt;
					font-family:"Arial";}
				</style>
			</head>
			<body>
				<div class="page">

					<p class='ConsPlusNonformat' style='text-align:left; margin-bottom:5mm'>
						<font size="4">
							Наименование таможенного органа<br/>
							<b>
								<xsl:value-of select="liqapin:Customs/cat_ru:OfficeName" />
							</b>
						</font>
					</p>

					<p class='ConsPlusNonformat' style='text-align:center; margin-bottom:5mm'>
						<font size="3">
							<b>
								Разрешение на помещение товаров <br/>
								под таможенную процедуру уничтожения
							</b>
						</font>
					</p>

					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						1. Наименование,  адрес  и  место государственной  регистрации заявителя
					</p>
					<p class='ConsPlusNonformat'>
						<xsl:apply-templates mode="organization" select="liqapin:OEZ_Resident"/><br/>
						<xsl:if test="liqapin:OEZ_Resident/cat_ru:Address">
						<xsl:apply-templates mode="address" select="liqapin:OEZ_Resident/cat_ru:Address"/><br/>
						</xsl:if>
					</p>

					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						2. Наименование, местонахождение (адрес и место государственной регистрации) лица, осуществляющего хранение товаров
					</p>
					<p class='ConsPlusNonformat'>
						<xsl:apply-templates mode="organization" select="liqapin:StorageOrganization"/><br/>
						<xsl:if test="liqapin:StorageOrganization/cat_ru:Address">
						<xsl:apply-templates mode="address" select="liqapin:StorageOrganization/cat_ru:Address"/><br/>
						</xsl:if>
					</p>

					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						3. Фактическое местонахождение товаров на территории Российской Федерации
					</p>
					<p class='ConsPlusNonformat'>
						<xsl:if test="liqapin:GoodsPlace">
						<xsl:apply-templates mode="address" select="liqapin:GoodsPlace"/><br/>
						</xsl:if>
					</p>


					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						4.	Место (адрес), где будут совершаться операции по уничтожению
						<xsl:apply-templates mode="address" select="liqapin:LiquidationPlace"/>
					</p>

					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						5. Причины выведения товаров из оборота
						<span style='width:30mm;display:inline-block;border-bottom: solid 1px black'>
							<xsl:for-each select="liqapin:LiquidationReasons">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
						</span>
					</p>

					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						6. Способ (способы) уничтожения товаров
						<span style='width:30mm;display:inline-block;border-bottom: solid 1px black'>
							<xsl:for-each select="//liqapin:LiquidationGoods">
								<xsl:for-each select="liqapin:ProspectiveLiquidationMethod">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()"><xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text></xsl:if>
								</xsl:for-each>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
						</span>
					</p>

					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						7. Наименование товаров
						<span style='width:30mm;display:inline-block;border-bottom: solid 1px black'>
							<xsl:for-each select=".//liqapin:LiquidationGoods">
								<xsl:for-each select="liqapin:GoodDescription">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()"><xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text></xsl:if>
								</xsl:for-each>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
						</span>
					</p>

					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						8. Классификационный(-ые) код(-ы) по ТН ВЭД ЕАЭС на уровне 10 знаков
						<span style='width:30mm;display:inline-block;border-bottom: solid 1px black'>
							<xsl:for-each select=".//liqapin:LiquidationGoods/liqapin:GoodsTNVEDCode">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
						</span>
					</p>
					
					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						9. Количество товаров
						<span style='width:30mm;display:inline-block;border-bottom: solid 1px black'>
							<xsl:value-of select="sum(.//liqapin:LiquidationGoods//liqapin:GoodsQuantity/cat_ru:GoodsQuantity)"/>
						</span>
					</p>
					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						10. Место (адрес) нахождения (хранения) предполагаемых отходов, которые должны обрабатываться в результате уничтожения товаров
					</p>
					<p class='ConsPlusNonformat'>
						<xsl:for-each select="liqapin:WasteProducts">
							<xsl:apply-templates mode="address" select="liqapin:WastePlace"/><br/>
						</xsl:for-each>
					</p>
					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						11. Предполагаемое использование и/или распоряжение этими отходами
					</p>
					<span style='border-bottom: solid 1px black;width:100%;display:inline-block'>
						<p class='ConsPlusNonformat'>
							<xsl:if test="liqapin:OperationSign = 0">уничтожение на территории ОЭЗ</xsl:if>
							<xsl:if test="liqapin:OperationSign = 1">вывоз с территории ОЭЗ с целью уничтожения</xsl:if>
						</p>
					</span>
					
					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						12. Количество и срок вывоза отходов (если отходы предполагается вывозить с территории Российской Федерации)
					</p>
					<span style='border-bottom: solid 1px black;width:100%;display:inline-block'>
						<p class='ConsPlusNonformat'>
							<xsl:for-each select="liqapin:WasteProducts">
								<xsl:value-of select="position()"/>.
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="liqapin:OutputDate"/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="liqapin:WasteQuantity/cat_ru:GoodsQuantity"/> <xsl:value-of select="liqapin:WasteQuantity/cat_ru:MeasureUnitQualifierName"/>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</p>
					</span>
					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						13. Срок, необходимый для транспортировки товаров из их местонахождения в место уничтожения
					</p>
					<span style='border-bottom: solid 1px black;width:100%;display:inline-block'>
						<p class='ConsPlusNonformat'>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="liqapin:TransportationDate"/>
							</xsl:call-template>
						</p>
					</span>
					<p class='ConsPlusNonformat' style='padding-top:1.5mm'>
						14. Срок, необходимый для уничтожения товаров, с указанием времени окончания проведения операций по уничтожению всех декларируемых товаров в декларации на товары заявленным(-ыми) способом(-ами)
					</p>
					<span style='border-bottom: solid 1px black;width:100%;display:inline-block'>
						<p class='ConsPlusNonformat'>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="liqapin:LiquidationDuration"/>
							</xsl:call-template>
						</p>
					</span>
					<br/><br/>
					<table>
						<tbody>
							<tr>
								<td width="30%" style="font-family:Arial;font-size:10pt">Подпись должностного лица<br/>таможенного органа, заверенная печатью</td>
								<td width="30%"></td>
								<td></td>
							</tr>
							<tr>
								<td style="font-family:Arial;font-size:10pt">
									<xsl:value-of select="//liqapin:CustomsPerson/cat_ru:PersonName"/>
									<xsl:text> ЛНП </xsl:text>
									<xsl:value-of select="//liqapin:CustomsPerson/cat_ru:LNP"/>
								</td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template mode="organization" match="*">
		<span style='border-bottom: solid 1px black;width:100%;display:inline-block'>
			<xsl:if test="cat_ru:OrganizationName">
				<xsl:value-of select="cat_ru:OrganizationName"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<xsl:value-of select="cat_ru:ShortName"/>
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:value-of select="concat('ИНН ', cat_ru:RFOrganizationFeatures/cat_ru:INN)"/>,
				</xsl:if>
			</xsl:if>
		</span>
	</xsl:template>
	
	<xsl:template mode="address" match="*">
		<span style='border-bottom: solid 1px black;width:100%;display:inline-block'>
			<xsl:if test="cat_ru:PostalCode">
				<xsl:value-of select="cat_ru:PostalCode"/>,
			</xsl:if>
			<xsl:if test="cat_ru:CountryCode">
				<xsl:value-of select="cat_ru:CountryCode"/>,
			</xsl:if>
			<xsl:if test="cat_ru:CounryName">
				<xsl:value-of select="cat_ru:CounryName"/>,
			</xsl:if>
			<xsl:if test="cat_ru:Region">
				<xsl:value-of select="cat_ru:Region"/>,
			</xsl:if>
			<xsl:if test="cat_ru:City">
				<xsl:value-of select="cat_ru:City"/>,
			</xsl:if>
			<xsl:if test="cat_ru:StreetHouse">
				<xsl:value-of select="cat_ru:StreetHouse"/>
			</xsl:if>
		</span>
	</xsl:template>
	
	<xsl:template name="PrintSplittedStr">
		<xsl:param name="strIn" />
		<xsl:param name="len" select="125" />
		<xsl:choose>
			<xsl:when test="string-length($strIn) &lt; $len">
				<xsl:if test="string-length($strIn) != 0">
					<span style='border-bottom: solid 1px black;width:100%;display:inline-block'>
						<xsl:value-of select="$strIn"/>
					</span>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="left">
					<xsl:call-template name="reverse">
						<xsl:with-param name="pStr" select="substring($strIn, 1, $len)" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="SpacePos" select="string-length($left) - string-length(substring-before($left, ' '))"/>
				<xsl:message>
					<xsl:value-of select="$SpacePos" />
				</xsl:message>

				<span style='border-bottom: solid 1px black;width:100%;display:inline-block'>
					<xsl:value-of select="substring($strIn, 1, $SpacePos)"/>
				</span>
				<xsl:call-template name="PrintSplittedStr">
					<xsl:with-param name="strIn" select="substring($strIn, $SpacePos + 1)" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

	<xsl:template name="reverse">
		<xsl:param name="pStr"/>

		<xsl:variable name="vLength" select="string-length($pStr)"/>
		<xsl:choose>
			<xsl:when test="$vLength = 1">
				<xsl:value-of select="$pStr"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="vHalfLength" select="floor($vLength div 2)"/>
				<xsl:variable name="vrevHalf1">
					<xsl:call-template name="reverse">
						<xsl:with-param name="pStr"
								 select="substring($pStr, 1, $vHalfLength)"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="vrevHalf2">
					<xsl:call-template name="reverse">
						<xsl:with-param name="pStr"
								 select="substring($pStr, $vHalfLength+1)"/>
					</xsl:call-template>
				</xsl:variable>

				<xsl:value-of select="concat($vrevHalf2, $vrevHalf1)"/>
			</xsl:otherwise>
		</xsl:choose>
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
