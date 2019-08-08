<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns="http://www.w3.org/1999/xhtml" 
                xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" 
                xmlns:trdecl_CU="urn:customs.ru:Information:CustomsDocuments:TransportDeclaration_CU:5.12.0"  
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Таможенная декларация на транспортное средство</title>
				<style type="text/css">
					body {background: #CCCCCC; font-size: 9pt;}
					div.page {
					height: 297mm;
					width: 210mm;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding:	10mm;
					padding-left:	20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					/*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
					@media print {div.page {border: none; margin: 0; padding: 0;}}

					.ts tr td {
					text-align:center;
					height:25px
					}

					table tbody tr td {
					vertical-align:top;
					}

					.text {font-size: 11pt;}

					.commonTable1 {
					border-color:black;
					border-bottom:0px;
					padding-left:10px;
					padding-top:6px;
					}

					.commonTable2 {
					border-color:black;
					border-bottom:0px;
					padding-left:10px;
					padding-top:6px;
					padding-bottom:6px;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<h2 style="font:20px">ТАМОЖЕННАЯ ДЕКЛАРАЦИЯ НА ТРАНСПОРТНОЕ СРЕДСТВО</h2>
					<xsl:apply-templates select="trdecl_CU:TransportDeclaration_CU"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="trdecl_CU:TransportDeclaration_CU">
		<!--1. Ввоз / вывоз-->
		<table border="1" cellpadding="0" cellspacing="0" style="border-color:black; border-bottom:0px; padding-top:6px" width="100%">
			<tbody>
				<tr>
					<td height="55px" width="40%">
						<span style="width:10px"/>
						<span class="text">
							1. Ввоз -
							<table border="1" style="display:inline; ">
								<tr>
									<td height="14px" style="border:0; font:9px " width="10px">
										<xsl:if test="trdecl_CU:Status = '1'">X</xsl:if>
									</td>
								</tr>
							</table>
							<span class="text" style="width:20px"/>
							Вывоз -
							<table border="1" style="display:inline;">
								<tr>
									<td height="14px" style="border:0; font:9px " width="10px">
										<xsl:if test="trdecl_CU:Status = '0'">X</xsl:if>
									</td>
								</tr>
							</table>
						</span>
						<br/>
						<br/>
					</td>
					<td height="50px" style="padding-top:11px" width="60%">
						<span style="width:10px"/>
						<span class="text">2. Регистрационный № </span>
						<xsl:if test="trdecl_CU:TDTSOpenRegNum">
							<xsl:apply-templates select="trdecl_CU:TDTSOpenRegNum"/>
						</xsl:if>
						<xsl:if test="trdecl_CU:TDTSOpenRegNum and trdecl_CU:TDTSCloseRegNum"><xsl:text>/</xsl:text></xsl:if>
						<xsl:if test="trdecl_CU:TDTSCloseRegNum">
							<xsl:apply-templates select="trdecl_CU:TDTSCloseRegNum"/>
						</xsl:if>
						<br/>
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
		<!--3. Транспортное средство:-->
		<table border="1" cellpadding="0" cellspacing="0" class="commonTable1" width="100%">
			<tr>
				<td colspan="2">
					<span style="width:10px"/>
					<span class="text">3. Транспортное средство:</span>
					<table border="1" cellpadding="0" cellspacing="0" class="TS" style="border-color:black; margin:5px; font: 10pt; font-family: Times;" width="98%">
						<tr>
							<td align="center">марка, модель</td>
							<td align="center">тип</td>
							<td align="center">номер регистрации</td>
							<td align="center">страна регистрации</td>
							<td align="center">идентификационный номер</td>
						</tr>
						<xsl:for-each select="trdecl_CU:TSInfo">
							<tr>
								<td>
									<xsl:value-of select="trdecl_CU:TransportMeans/trdecl_CU:Mark"/>
									<xsl:if test="(trdecl_CU:TransportMeans/trdecl_CU:Mark) and (trdecl_CU:TransportMeans/trdecl_CU:Model)">, </xsl:if>
									<xsl:value-of select="trdecl_CU:TransportMeans/trdecl_CU:Model"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td>
									<xsl:value-of select="trdecl_CU:TransportMeans/trdecl_CU:Kind"/>
								</td>
								<td>
									<xsl:value-of select="trdecl_CU:TransportMeans/trdecl_CU:TransportRegNumber"/>
								</td>
								<td>
									<xsl:value-of select="trdecl_CU:TransportMeans/trdecl_CU:TransportNationalityName"/>
								</td>
								<td>
									<xsl:value-of select="trdecl_CU:TransportMeans/trdecl_CU:VIN"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</td>
			</tr>
		</table>
		<!--4. Лицо, осуществляющее перевозку товаров-->
		<table border="1" cellpadding="0" cellspacing="0" class="commonTable2" width="100%">
			<tr>
				<td>
					<span class="text">4. Лицо, осуществляющее перевозку товаров</span>
					<br/>
					<xsl:choose>
						<xsl:when test="trdecl_CU:Shipping/trdecl_CU:Carrier">
							<xsl:apply-templates select="trdecl_CU:Shipping/trdecl_CU:Carrier"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:for-each select="trdecl_CU:Shipping/trdecl_CU:DateStamp">
								<xsl:if test="position()>1">
									<br/>
								</xsl:if>
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
					<br/>
					<span class="text" style="margin-left:10px;">Лицо, ответственное за использование транспортного средства</span>
					<br/>
				</td>
			</tr>
		</table>
		<!--5. Маршрут / 6. Экипаж-->
		<table border="1" cellpadding="0" cellspacing="0" class="commonTable1" width="100%">
			<tr>
				<td border="1" style="border-bottom:0;" width="50%">
					<span class="text">5. Маршрут</span>
				</td>
				<td style="border-bottom:0;" width="50%">
					<span class="text"> 6. Экипаж</span>
				</td>
			</tr>
			<tr>
				<td style="border-top:0;  padding-left:24px">
					<span class="text">
						<xsl:value-of select="trdecl_CU:Route/trdecl_CU:Destination/trdecl_CU:DestinationCountry"/>
						<xsl:if test="trdecl_CU:Route/trdecl_CU:Destination/trdecl_CU:DestinationCountryCode">
							(<xsl:value-of select="trdecl_CU:Route/trdecl_CU:Destination/trdecl_CU:DestinationCountryCode"/>)
						</xsl:if>
						<br/>
						<xsl:value-of select="trdecl_CU:Route/trdecl_CU:Destination/trdecl_CU:DestinationPlace"/>
					</span>
				</td>
				<td style="border-top:0;  padding-left:24px">
					<span class="text">
						<xsl:value-of select="trdecl_CU:CrewInfo/trdecl_CU:CrewDescription"/>
						<br/>
						<xsl:if test="trdecl_CU:CrewInfo/trdecl_CU:TotalMemberCount">
							Общее количество членов экипажа <xsl:value-of select="trdecl_CU:CrewInfo/trdecl_CU:TotalMemberCount"/>
						</xsl:if>
					</span>
				</td>
			</tr>
		</table>
		<!--7. Пассажиры / 8. Припасы / 9. Сведения о товаре-->
		<table border="1" cellpadding="0" cellspacing="0" class="commonTable2" width="100%">
			<tr>
				<td width="30%">
					<xsl:apply-templates select="trdecl_CU:Passengers"/>
				</td>
				<td width="30%">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td>
									<span class="text">8. Припасы</span>
								</td>
								<td align="right" class="text" style="padding-right:4px" width="40px">Да - </td>
								<td>
									<table border="1" style="display:inline;">
										<tr>
											<td height="14px" style="border:0; font:9px " width="10px">
												<xsl:if test="(trdecl_CU:StoreInfo = 'true') or (trdecl_CU:StoreInfo = 't') or (trdecl_CU:StoreInfo = '1') ">X</xsl:if>
											</td>
										</tr>
									</table>
								</td>
								<td width="20px"/>
							</tr>
							<tr style="padding-top:6px">
								<td>
									<span/>
								</td>
								<td align="right" class="text" style="padding-right:4px">Нет - </td>
								<td>
									<table border="1" style="display:inline;">
										<tr>
											<td height="14px" style="border:0; font:9px " width="10px">
												<xsl:if test="(trdecl_CU:StoreInfo = false()) or (trdecl_CU:StoreInfo = 'false') or (trdecl_CU:StoreInfo = 'f') or (trdecl_CU:StoreInfo = '0')">X</xsl:if>
											</td>
										</tr>
									</table>
								</td>
								<td width="20px"/>
							</tr>
						</tbody>
					</table>
					<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
				</td>
				<td width="40%">
					<xsl:apply-templates select="trdecl_CU:GoodsInfo"/>
				</td>
			</tr>
		</table>
		<!--10. Запасные части и оборудование-->
		<xsl:apply-templates select="trdecl_CU:OperatingEquipment"/>
		<!--11. Цель ввоза/вывоза / 12. Дополнительные сведения-->
		<table border="1" cellpadding="0" cellspacing="0" class="commonTable1" width="100%">
			<tbody>
				<tr>
					<td style="border-bottom:0" width="50%">
						<span class="text">11. Цель ввоза/вывоза </span>
					</td>
					<td style="border-bottom:0" width="50%">
						<span class="text">12. Дополнительные сведения</span>
					</td>
				</tr>
				<tr>
					<td style="border-top:0">
						<span class="text">
							<xsl:choose>
								<xsl:when test="trdecl_CU:Purpose = 1">
									для начала международной перевозки грузов, пассажиров и (или) багажа на таможенной территории;
								</xsl:when>
								<xsl:when test="trdecl_CU:Purpose = 2">
									для начала международной перевозки грузов, пассажиров и (или) багажа за пределы таможенной территории
								</xsl:when>
								<xsl:when test="trdecl_CU:Purpose = 3">
									для завершения международной перевозки грузов, пассажиров и (или) багажа на таможенной территории
								</xsl:when>
								<xsl:when test="trdecl_CU:Purpose = 4">
									для завершения международной перевозки грузов, пассажиров и (или) багажа за пределами таможенной территории
								</xsl:when>
								<xsl:when test="trdecl_CU:Purpose = 5">
									иное
								</xsl:when>
							</xsl:choose>
						</span>
					</td>
					<td style="border-top:0; vertical-align:top">
						<span class="text">
							<xsl:value-of select="trdecl_CU:AdditionalInfo"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</span>
					</td>
				</tr>
			</tbody>
		</table>
		<!--13. Подпись / дата-->
		<xsl:apply-templates select="trdecl_CU:Signer"/>
		<!--Таможенный контроль-->
		<xsl:call-template name="customsControl"/>
	</xsl:template>
	<xsl:template match="trdecl_CU:Carrier">
		<span class="text" style="margin-left:24px">
			<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:if test="cat_ru:OrganizationName">, </xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
		</span>
		<br/>
		<span class="text" style="margin-left:24px">
			<xsl:value-of select="trdecl_CU:CarrierAddress/cat_ru:CounryName"/>
			<xsl:if test="trdecl_CU:CarrierAddress/cat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="trdecl_CU:CarrierAddress/cat_ru:Region"/>
			<xsl:if test="trdecl_CU:CarrierAddress/cat_ru:Region">, </xsl:if>
			<xsl:value-of select="trdecl_CU:CarrierAddress/cat_ru:City"/>
			<xsl:if test="trdecl_CU:CarrierAddress/cat_ru:City">, </xsl:if>
			<xsl:value-of select="trdecl_CU:CarrierAddress/cat_ru:StreetHouse"/>
		</span>
		<br/>
		<span class="text" style="margin-left:24px">
			<xsl:value-of select="trdecl_CU:Representative/cat_ru:PersonSurname"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="trdecl_CU:Representative/cat_ru:PersonName"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="trdecl_CU:Representative/cat_ru:PersonMiddleName"/>
		</span>
	</xsl:template>
	<xsl:template match="trdecl_CU:Passengers">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td>
						<span class="text">7. Пассажиры</span>
					</td>
					<td align="right" class="text" style="padding-right:4px" width="40px">Да - </td>
					<td>
						<table border="1" style="display:inline;">
							<tr>
								<td height="14px" style="border:0; font:9px " width="10px">
									<xsl:if test="(trdecl_CU:TSMPPassenger = 'true') or (trdecl_CU:TSMPPassenger = '1') or (trdecl_CU:TSMPPassenger = 't')">X</xsl:if>
								</td>
							</tr>
						</table>
					</td>
					<td align="center" width="40px">
						<xsl:if test="(trdecl_CU:TSMPPassenger = 'true') or (trdecl_CU:TSMPPassenger = '1') or (trdecl_CU:TSMPPassenger = 't')">
							<xsl:value-of select="trdecl_CU:MemberCount"/>
						</xsl:if>
					</td>
				</tr>
				<tr style="padding-top:6px">
					<td>
						<span/>
					</td>
					<td align="right" class="text" style="padding-right:4px">Нет - </td>
					<td>
						<table border="1" style="display:inline;">
							<tr>
								<td height="14px" style="border:0; font:9px " width="10px">
									<xsl:if test="(trdecl_CU:TSMPPassenger = false()) or (trdecl_CU:TSMPPassenger = 'f') or (trdecl_CU:TSMPPassenger = '0' or (trdecl_CU:TSMPPassenger = 'false'))">X</xsl:if>
								</td>
							</tr>
						</table>
					</td>
					<td/>
				</tr>
				<!--xsl:if test="trdecl_CU:AdditionalInfo">
					<tr>
						<td colspan="3">
							<xsl:for-each select="trdecl_CU:AdditionalInfo">
								<xsl:value-of select="."/>
								<br/>
							</xsl:for-each>
						</td>
					</tr>
				</xsl:if-->
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="trdecl_CU:GoodsInfo">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td>
						<span class="text">9. Сведения о товаре</span>
					</td>
					<td align="right" class="text" style="padding-right:4px" width="40px">Да - </td>
					<td>
						<table border="1" style="display:inline;">
							<tr>
								<td height="14px" style="border:0; font:9px " width="10px">
									<xsl:if test="(. = 'true') or (. = 't') or (. = '1') ">X</xsl:if>
								</td>
							</tr>
						</table>
					</td>
					<td width="40px"/>
				</tr>
				<tr style="padding-top:6px">
					<td>
						<span/>
					</td>
					<td align="right" class="text" style="padding-right:4px">Нет - </td>
					<td>
						<table border="1" style="display:inline;">
							<tr>
								<td height="14px" style="border:0; font:9px " width="10px">
									<xsl:if test="(. = false()) or (. = 'false') or (. = 'f') or (. = '0')">X</xsl:if>
								</td>
							</tr>
						</table>
					</td>
					<td width="40px"/>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="trdecl_CU:OperatingEquipment">
		<table border="1" cellpadding="0" cellspacing="0" style="border-color:black; padding-left:10px; border-bottom:0px; padding-bottom:2px" width="100%">
			<tr style="padding-top:6px;">
				<td style="border-bottom:0">
					<span class="text">10. Запасные части и оборудование</span>
				</td>
			</tr>
			<tr>
				<td style="border-top:0; border-bottom:0; height:60px">
					<span class="text">
						Да -
						<table border="1" style="display:inline; ">
							<tr>
								<td height="14px" style="border:0; font:9px " width="10px">
									<xsl:if test="(trdecl_CU:GoodsSign = 'true') or (trdecl_CU:GoodsSign = 't') or (trdecl_CU:GoodsSign = '1')">X</xsl:if>
								</td>
							</tr>
						</table>
					</span>
					<span class="text" style="margin-left:20px">
						Нет -
						<table border="1" style="display:inline;">
							<tr>
								<td height="14px" style="border:0; font:9px " width="10px">
									<xsl:if test="(trdecl_CU:GoodsSign = false()) or (trdecl_CU:GoodsSign = 'false') or (trdecl_CU:GoodsSign = '0') or (trdecl_CU:GoodsSign = 'f')">X</xsl:if>
								</td>
							</tr>
						</table>
					</span>
				</td>
			</tr>
			<xsl:if test="trdecl_CU:EquipmentDescription">
				<tr>
					<td style="border-top:0; border-bottom:0">
						<xsl:for-each select="trdecl_CU:EquipmentDescription/trdecl_CU:EquipmentName">
							<span class="text">
								<xsl:value-of select="."/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</span>
						</xsl:for-each>
						<span class="text">
							<xsl:value-of select="trdecl_CU:EquipmentDescription/cat_ru:GoodsQuantity"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:if test="trdecl_CU:EquipmentDescription/cat_ru:MeasureUnitQualifierName">
								<xsl:value-of select="trdecl_CU:EquipmentDescription/cat_ru:MeasureUnitQualifierName"/>
							</xsl:if>
							<xsl:if test="trdecl_CU:EquipmentDescription/cat_ru:MeasureUnitQualifierCode">
								(Код единицы измерения - <xsl:value-of select="trdecl_CU:EquipmentDescription/cat_ru:MeasureUnitQualifierCode"/>)
							</xsl:if>
						</span>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<xsl:template match="trdecl_CU:Signer">
		<table border="1" cellpadding="0" cellspacing="0" class="commonTable1" width="100%">
			<tbody>
				<tr>
					<td style="border-bottom:0">
						<span class="text">13. Подпись лица, заявляющего сведения</span>
						<span class="text" style="text-decoration: underline;">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:value-of select="cat_ru:PersonSurname"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:value-of select="cat_ru:PersonName"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:if test="cat_ru:PersonMiddleName">
								<xsl:value-of select="cat_ru:PersonMiddleName"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:if>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</span>
						<span class="text" style="margin-left:15px">дата заполнения</span>
						<span class="text" style="text-decoration: underline;">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
							</xsl:call-template>
						</span>
					</td>
				</tr>
				<tr>
					<td style="border-top:0; height:50px">
						<span class="text">
							<xsl:if test="trdecl_CU:RepresentativeName">
								Наименование таможенного представителя:
								<xsl:value-of select="trdecl_CU:RepresentativeName"/>
								<br/>
							</xsl:if>
							<xsl:if test="trdecl_CU:Sertificate">
								<xsl:choose>
									<xsl:when test="trdecl_CU:Sertificate/cat_ru:PrDocumentName">
										<xsl:value-of select="trdecl_CU:Sertificate/cat_ru:PrDocumentName"/>
									</xsl:when>
									<xsl:otherwise>Свидетельство о включении в реестр таможенных представителей:</xsl:otherwise>
								</xsl:choose>
								<xsl:value-of select="trdecl_CU:Sertificate/cat_ru:PrDocumentNumber"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="trdecl_CU:Sertificate/cat_ru:PrDocumentDate"/>
								</xsl:call-template>
								<br/>
							</xsl:if>
							<xsl:if test="trdecl_CU:ServiceContract">
								<xsl:choose>
									<xsl:when test="trdecl_CU:ServiceContract/cat_ru:PrDocumentName">
										<xsl:value-of select="trdecl_CU:Sertificate/cat_ru:PrDocumentName"/>
									</xsl:when>
									<xsl:otherwise>
										Договор на оказание услуг по совершению таможенных операций в отношении временно ввозимых (вывозимых) ТСМП:
									</xsl:otherwise>
								</xsl:choose>
								<xsl:value-of select="trdecl_CU:ServiceContract/cat_ru:PrDocumentNumber"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="trdecl_CU:ServiceContract/cat_ru:PrDocumentDate"/>
								</xsl:call-template>
								<br/>
							</xsl:if>
						</span>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="customsControl">
		<table border="1" cellpadding="0" cellspacing="0" class="commonTable1" width="100%">
			<tbody>
				<tr>
					<td align="center" colspan="3" style="padding-top:3px; padding-bottom:2px; font:20px">ТАМОЖЕННЫЙ КОНТРОЛЬ</td>
				</tr>
			</tbody>
		</table>
		<table border="1" cellpadding="0" cellspacing="0" style="border-color:black; padding-left:10px" width="100%">
			<tbody>
				<tr>
					<td width="33%">
						<table border="2" style="display:inline; margin-left:-11px; margin-top:-1px">
							<tr>
								<th align="center" height="14px" style="border:0; font:14px; font-weight:bold " width="16px">A</th>
							</tr>
						</table>
						<span class="text" style="margin-left:10px;">Таможенный орган, оформивший временный ввоз (вывоз) - </span>
						<div class="text" style="margin-top:20px">дата регистрации ТДТС</div>
						<div class="text" style="margin-top:33px">формы таможенного контроля</div>
						<div class="text" style="margin-top:15px; margin-bottom:20px">Срок временного ввоза</div>
					</td>
					<td width="34%">
						<table border="2" style="display:inline; margin-left:-11px; margin-top:-1px">
							<tr>
								<th align="center" height="14px" style="border:0; font:14px; font-weight:bold " width="16px">B</th>
							</tr>
						</table>
						<span class="text" style="margin-left:10px;">Таможенный орган, оформивший завершение временного ввоза (вывоза) - </span>
						<div class="text" style="margin-top:20px">дата регистрации ТДТС</div>
						<div class="text" style="margin-top:33px">формы таможенного контроля</div>
					</td>
					<td width="33%">
						<table border="2" style="display:inline; margin-left:-11px; margin-top:-1px">
							<tr>
								<th align="center" height="14px" style="border:0; font:14px; font-weight:bold " width="16px">C</th>
							</tr>
						</table>
						<span class="text" style="margin-left:10px;">Промежуточный таможенный орган - </span>
						<div class="text" style="margin-top:37px">дата совершения таможенной операции - </div>
						<div class="text" style="margin-top:16px">формы таможенного контроля</div>
						<div class="text" style="margin-top:15px; margin-bottom:10px">Продление срока временного ввоза</div>
					</td>
				</tr>
				<tr>
					<td height="80px">Особые отметки</td>
					<td>Особые отметки</td>
					<td>Особые отметки</td>
				</tr>
			</tbody>
		</table>
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
	<xsl:template match="trdecl_CU:DateStamp">
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="trdecl_CU:Date"/>
		</xsl:call-template>;
		<xsl:apply-templates select="trdecl_CU:RWStation"/>;
		<xsl:if test="trdecl_CU:Customs">
			<xsl:apply-templates select="trdecl_CU:Customs"/>;
		</xsl:if>
		<xsl:apply-templates select="trdecl_CU:Officer"/>;
	</xsl:template>
	<xsl:template match="trdecl_CU:RWStation">
		станция: <xsl:value-of select="trdecl_CU:StationCode"/>
		<xsl:if test="trdecl_CU:StationName">
			(<xsl:value-of select="trdecl_CU:StationName"/>)
		</xsl:if>
		<xsl:if test="trdecl_CU:RailwayCode">
			, код ж/д <xsl:value-of select="trdecl_CU:RailwayCode"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="trdecl_CU:Customs">
		ТО :
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			(<xsl:value-of select="cat_ru:OfficeName"/>)
		</xsl:if>
	</xsl:template>
	<xsl:template match="trdecl_CU:Officer">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		</xsl:if>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
		</xsl:call-template>
	</xsl:template>
		<xsl:template name="date_tdtsrn">
		<xsl:param name="dateIn"/>
		<xsl:value-of select="substring($dateIn,9,2)"/><xsl:value-of select="substring($dateIn,6,2)"/><xsl:value-of select="substring($dateIn,3,2)"/>
	</xsl:template>
	<xsl:template match="trdecl_CU:TDTSOpenRegNum | trdecl_CU:TDTSCloseRegNum">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="date_tdtsrn"><xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/></xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="trdecl_CU:TransportModeCode"/>
		<xsl:text></xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
</xsl:stylesheet>
