<?xml version="1.0" encoding="UTF-8"?>
<!-- Бланк 0 и 2: Приказ ФТС от 24.11.2017 № 1861 Приложение № 1 к Порядку использования в качестве пассажирской таможенной декларации документов, содержащих сведения, необходимые для выпуска товаров для личного пользования, доставляемых перевозчиками (транспортными экспедиторскими компаниями и службами курьерской доставки) в адрес физических лиц - получателей товаров, с применением Единой автоматизированной информационной системы таможенных органов-->
<!-- Бланк 1: Приказ ФТС от 24.11.2017 № 1861 Приложение № 4 к Порядку использования в качестве пассажирской таможенной декларации документов, содержащих сведения, необходимые для выпуска товаров для личного пользования, доставляемых перевозчиками (транспортными экспедиторскими компаниями и службами курьерской доставки) в адрес физических лиц - получателей товаров, с применением Единой автоматизированной информационной системы таможенных органов-->

<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:repapp="urn:customs.ru:Information:CustomsDocuments:RepresentativeApplication:5.13.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="cat_ru:Address">
		<span class="graph">Адрес:</span>
		<!--br/-->
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">
      (<xsl:value-of select="cat_ru:CountryCode"/>)
    </xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:value-of select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="cat_ru:PostalCode">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="cat_ru:PostalCode"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="repapp:Representative">
		<xsl:choose>
			<xsl:when test="cat_ru:RFOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RKOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RBOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures|repapp:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>
        ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
			</span> 
    </xsl:if>
		<xsl:if test="cat_ru:INN">
			<span>
        ИНН: <xsl:value-of select="cat_ru:INN"/>
			</span> 
    </xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>
        КПП: <xsl:value-of select="cat_ru:KPP"/>
			</span> 
    </xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span>
        УНП: <xsl:value-of select="cat_ru:UNP"/>
			</span> 
    </xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span>
        Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
			</span> 
    </xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span>
        БИН: <xsl:value-of select="cat_ru:BIN"/>
			</span> 
    </xsl:if>
		<xsl:if test="cat_ru:IIN">
			<span>
        ИИН: <xsl:value-of select="cat_ru:IIN"/>
			</span> 
    </xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<span>
        ИТН:
        <xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">
          /<xsl:value-of select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="repapp:RepresentativeApplication">
		<html>
			<head>
				<title>Заявление таможенного представителя, используемое в качестве пассажирской таможенной декларации</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
          body {
          background: #ffffff;
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
          border: solid 0pt #000000;
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
          margin-top:20px;
          }

          table {
          width: 100%;
          border: 0;
          empty-cells: show;
          border-collapse: collapse;
          margin-top: 1px;
          }

          td {
          border: 1px solid gray;
          font-family: Courier, serif;
          vertical-align:top;
          }

          .low {
          font: 12;
          font-fase: Courier;
          }
          .graph {
          font-family: Arial;
          font-size: 8pt;
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
          .р{


          <!--text-orientation: sideways-right;-->
          -webkit-transform: rotate(180deg);
          -moz-transform: rotate(180deg);
          -o-transform: rotate(180deg);
          transform: rotate(180deg);
          filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=2);
          }
          .graph1 {
          font-family: Arial;
          font-size: 7pt;
          }
        </style>
			</head>
			<body>
				<div class="album_page">
					<xsl:if test="repapp:ApplicationSign='0' or repapp:ApplicationSign='2'">
						<table style="width:297mm">
							<tr>
								<td align="center" class="graph" style="border-left:1px solid #ffffff; border-top:1px solid #ffffff; border-right:1px solid #ffffff; border-bottom:1px solid #ffffff;">
									<font face="Times new roman" size="3">
										<b>
											<xsl:if test="repapp:ApplicationSign='0'">
						  РЕЕСТР ТОВАРОВ ДЛЯ ЛИЧНОГО ПОЛЬЗОВАНИЯ,<br/> ДОСТАВЛЯЕМЫХ ЭКСПРЕСС-ПЕРЕВОЗЧИКОМ (ТРАНСПОРТНОЙ ЭКСПЕДИТОРСКОЙ КОМПАНИЕЙ<br/>ИЛИ СЛУЖБОЙ КУРЬЕРСКОЙ ДОСТАВКИ) В АДРЕС ФИЗИЧЕСКИХ ЛИЦ<br/>№
                      </xsl:if>
											<xsl:if test="repapp:ApplicationSign='2'">
						  РЕЕСТР, ПРЕДПОЛАГАЮЩИЙ ОПЛАТУ ТАМОЖЕННЫХ ПЛАТЕЖЕЙ
                      </xsl:if>
										</b>
									</font>
								</td>
							</tr>
						</table>
						<table align="center" style="width:297mm">
							<tr>
								<td align="center" class="graph" style="border-left:1px solid #ffffff; border-top:1px solid #ffffff; border-right:1px solid #ffffff;">
									<span class="graph">
										<xsl:if test="repapp:Representative/cat_ru:OrganizationName">
											<xsl:value-of select="repapp:Representative/cat_ru:OrganizationName"/>
											<xsl:if test="position()!=last()">,</xsl:if>
										</xsl:if>
                     <xsl:apply-templates select="repapp:Representative"/>
										<xsl:if test="repapp:Representative/repapp:OKPOID">
                      ОКПО: <xsl:value-of select="repapp:Representative/repapp:OKPOID"/>
										</xsl:if>
										<xsl:if test="repapp:Representative/cat_ru:Address">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="repapp:Representative/cat_ru:Address"/>
										</xsl:if>
                     Лицензия <xsl:value-of select="repapp:Representative/repapp:LicenseNumber"/>
										<xsl:if test="repapp:WarehousePlace/catESAD_ru:CertificateNumber">
                      , СВХ : <xsl:value-of select="repapp:WarehousePlace/catESAD_ru:CertificateNumber"/>
										</xsl:if>
									</span>
								</td>
							</tr>
						</table>
						<div align="center">
							<span class="graph">(наименование таможенного представителя и место его нахождения; идентификационный номер налогоплательщика (ИНН), общероссийский классификатор предприятий и организаций (ОКПО) и код причины постановки на учет (КПП), номер свидетельства о включении в реестр таможенных представителей, номер свидетельства о включении в реестр складов временного хранения склада временного хранения, на котором размещены товары)</span>
						</div>
						<br/>
						<table align="center" style="width:297mm">
							<tr>
								<td align="center" rowspan="2" width="5mm">
									<span class="graph">№ п/п</span>
								</td>
								<td align="center" rowspan="2" width="10mm">
									<span class="graph">
                    Номер индивидуальной накладной
                  </span>
								</td>
								<td align="center" rowspan="2" width="10mm">
									<span class="graph">
                    УИН
                  </span>
								</td>
								<td align="center" rowspan="2" width="10mm">
									<span class="graph">
                    Номер общей авианакладной
                  </span>
								</td>
								<td align="center" rowspan="2" width="10mm">
									<span class="graph">
                    Номер транспортной накладной (при перевозке товаров автомобильным транспортом)
                  </span>
								</td>
								<td align="center" rowspan="2" width="10mm">
									<span class="graph">
                    Отправитель (наименование организации либо ФИО отправителя, страна отправления) 
                  </span>
								</td>
								<td align="center" rowspan="2" width="10mm">
									<span class="graph">
                    Ф.И.О. получателя
                  </span>
								</td>
								<td align="center" rowspan="2" width="10mm">
									<span class="graph">
                    Сведения о документе, удостоверяющем личность получателя<sup>1</sup>
									</span>
								</td>
								<td align="center" rowspan="2" width="10mm">
									<span class="graph">
                    Адрес физического лица - получателя товаров
                  </span>
								</td>
								<td align="center" rowspan="2" width="10mm">
									<span class="graph">
                    ИНН<sup>2</sup>
									</span>
								</td>
								<td align="center" rowspan="2">
									<span class="graph">
                    Наименование товара, код товара по ТН ВЭД ЕАЭС<sup>3</sup>
									</span>
								</td>
								<td align="center" rowspan="2" width="10mm">
									<span class="graph">
                    Кол-во товара
                  </span>
								</td>
								<td align="center" rowspan="2" width="10mm">
									<span class="graph">
                    Ед. изм. товара
                  </span>
								</td>
								<td align="center" rowspan="2" width="10mm">
									<span class="graph">
                    Общий вес отправления, кг
                  </span>
								</td>
								<td align="center" colspan="2" width="10mm">
									<span class="graph">
                    Стоимость в евро, рублях,
                  </span>
								</td>
								<td align="center" rowspan="2" width="20mm">
									<span class="graph">
                    Общая стоимость и общий вес товаров за календарный месяц, ранее поступивших в адрес получателя
                  </span>
								</td>
								<td align="center" colspan="2" width="10mm">
									<span class="graph">Расчет таможенных платежей</span>
								</td>
								<td align="center" rowspan="2" width="30mm">
									<span class="graph">Применение запретов и ограничений<sup>4</sup>
									</span>
								</td>
								<td align="center" rowspan="2" width="10mm">
									<span class="graph">Идентификатор резервирования таможенных платежей (при наличии)</span>
								</td>
								<td align="center" rowspan="2" width="10mm">
									<span class="graph">
                    Примечание<sup>5</sup>
									</span>
								</td>
							</tr>
							<tr>
								<td align="center" width="10mm">
									<span class="graph">
                    евро
                  </span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">
                    руб.
                  </span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">
                    Таможенные пошлины, налоги
                  </span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">
                    Таможенные сборы
                  </span>
								</td>
							</tr>
							<tr>
								<td align="center" width="10mm">
									<span class="graph">1</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">2</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">3</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">4</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">5</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">6</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">7</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">8</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">9</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">10</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">11</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">12</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">13</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">14</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">15</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">16</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">17</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">18</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">19</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">20</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">21</span>
								</td>
								<td align="center" width="10mm">
									<span class="graph">22</span>
								</td>
							</tr>
							<xsl:for-each select="repapp:Consignment">
								<tr>
									<td align="center" style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:value-of select="position()"/>.
                    </span>
									</td>
									<td style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:for-each select="repapp:IndividualWayBill">
												<xsl:if test="cat_ru:PrDocumentNumber">
													<xsl:value-of select="cat_ru:PrDocumentNumber"/>
												</xsl:if>
											</xsl:for-each>
										</span>
									</td>
									<td style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:value-of select="repapp:WayBillID"/>
										</span>
									</td>
									<td style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:for-each select="repapp:WayBill">
												<xsl:if test="repapp:WayBillKind='2'">
													<xsl:if test="cat_ru:PrDocumentNumber">
														<xsl:value-of select="cat_ru:PrDocumentNumber"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</span>
									</td>
									<td style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:for-each select="repapp:WayBill">
												<xsl:if test="repapp:WayBillKind='3'">
													<xsl:if test="cat_ru:PrDocumentNumber">
														<xsl:value-of select="cat_ru:PrDocumentNumber"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</span>
									</td>
									<td style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:if test="repapp:Consignor/cat_ru:OrganizationName">
												<xsl:value-of select="repapp:Consignor/cat_ru:OrganizationName"/>
											</xsl:if>
											<xsl:if test="repapp:Consignor/cat_ru:Address">
												<br/>
												<xsl:if test="repapp:Consignor/cat_ru:Address/cat_ru:CounryName">
													<xsl:value-of select="repapp:Consignor/cat_ru:Address/cat_ru:CounryName"/>
												</xsl:if>
												<xsl:if test="repapp:Consignor/cat_ru:Address/cat_ru:CountryCode">
													<xsl:text> (</xsl:text>
													<xsl:value-of select="repapp:Consignor/cat_ru:Address/cat_ru:CountryCode"/>
													<xsl:text>)</xsl:text>
												</xsl:if>
											</xsl:if>
											<br/>
					  страна: <xsl:value-of select="repapp:Consignor/repapp:ConsignorCountryCode"/>
											<!--<xsl:if test="repapp:Consignor/cat_ru:IdentityCard/cat_ru:IdentityCardNumber">,
						    <xsl:value-of select="repapp:Consignor/cat_ru:IdentityCard/cat_ru:IdentityCardNumber"/></xsl:if>-->
										</span>
									</td>
									<td style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:if test="repapp:Consignee/repapp:JuridicalPerson/repapp:OrganizationName">
												<xsl:value-of select="repapp:Consignee/repapp:JuridicalPerson/repapp:OrganizationName"/>
											</xsl:if>
											<xsl:if test="repapp:Consignee/repapp:Person">
												<xsl:for-each select="repapp:Consignee/repapp:Person">
													<xsl:value-of select="cat_ru:PersonSurname"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="cat_ru:PersonMiddleName"/>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="repapp:Consignee/repapp:ConsigneeSign='1'">
												<xsl:text> по доверенности</xsl:text>
											</xsl:if>
										</span>
									</td>
									<td style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:value-of select="repapp:Consignee/repapp:IdentityCard/repapp:IdentityCardName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="repapp:Consignee/repapp:IdentityCard/repapp:IdentityCardSeries"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="repapp:Consignee/repapp:IdentityCard/repapp:IdentityCardNumber"/>
											<xsl:text> от </xsl:text>
											<xsl:call-template name="date">
												<xsl:with-param name="dateIn" select="repapp:Consignee/repapp:IdentityCard/repapp:IdentityCardDate"/>
											</xsl:call-template>
											<xsl:text> выдан </xsl:text>
											<xsl:value-of select="repapp:Consignee/repapp:IdentityCard/repapp:OrganizationName"/>
										</span>
									</td>
									<td style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:for-each select="repapp:Consignee/repapp:Address/*">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">, </xsl:if>
											</xsl:for-each>
										</span>
									</td>
									<td style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:value-of select="repapp:Consignee/repapp:RFOrganizationFeatures/cat_ru:INN"/>
										</span>
									</td>
									<xsl:for-each select="repapp:Goods">
										<xsl:if test="position()=1">
											<xsl:call-template name="goodsInfoLine1p1">
												<xsl:with-param name="tdStyle" select="'border-top: 2px solid black;'"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<td style="border-top: 2px solid black;"/>
									<td style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:if test="repapp:CustomsDuties/repapp:Duties">
												<xsl:value-of select="repapp:CustomsDuties/repapp:Duties"/>
											</xsl:if>
										</span>
									</td>
									<td style="border-top: 2px solid black">
									  </td>
									<xsl:for-each select="repapp:Goods">
										<xsl:if test="position()=1">
											<xsl:call-template name="goodsInfoLine1p2">
												<xsl:with-param name="tdStyle" select="'border-top: 2px solid black;'"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<td style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:if test="repapp:ReservationID">
												<xsl:value-of select="repapp:ReservationID"/>
											</xsl:if>
										</span>
									</td>
									<td style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:if test="repapp:TaxBase/repapp:DecisionDate">
												<xsl:call-template name="date">
													<xsl:with-param name="dateIn" select="repapp:TaxBase/repapp:DecisionDate"/>
												</xsl:call-template>
												<br/>
											</xsl:if>
											<xsl:if test="repapp:TaxBase/repapp:TaxBaseKind='0'">
												<xsl:if test="repapp:TaxBase/repapp:TaxBaseEuro">
													Основа: <xsl:value-of select="repapp:TaxBase/repapp:TaxBaseEuro"/>
												</xsl:if>
											</xsl:if>
											<xsl:if test="repapp:TaxBase/repapp:TaxBaseKind='1'">
												<xsl:if test="repapp:TaxBase/repapp:TaxBaseWeight">
													Основа: <xsl:value-of select="repapp:TaxBase/repapp:TaxBaseWeight"/>
												</xsl:if>
											</xsl:if>
										</span>
									</td>
								</tr>
								<xsl:for-each select="repapp:Goods">
									<xsl:if test="position()>1">
										<tr>
											<td align="center"/>
											<td width="5%"/>
											<td width="5%"/>
											<td width="5%"/>
											<td width="5%"/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<xsl:call-template name="goodsInfoLine1p1"/>
											<td/>
											<td/>
											<td/>
											<xsl:call-template name="goodsInfoLine1p2"/>
											<td/>
											<td/>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<tr>
									<td align="right" colspan="14">
										<span class="graph">Итоговые показатели:</span>
									</td>
									<td align="center" width="10mm">
										<span class="graph">
											<xsl:if test="repapp:GoodsCostEuro">
												<xsl:value-of select="repapp:GoodsCostEuro"/>
											</xsl:if>
										</span>
									</td>
									<td align="center" width="10mm">
										<span class="graph">
											<xsl:if test="repapp:GoodsCostRuble">
												<xsl:value-of select="repapp:GoodsCostRuble"/>
											</xsl:if>
										</span>
									</td>
									<td align="center" width="100mm" colspan="6">
										<span class="graph">&#160;</span>
									</td>
								</tr>
							</xsl:for-each>
						</table>
						<table width="100%">
							<tbody>
								<tr>
									<td class="graph" style="border: 0px solid white; font-size:8pt;">
										<br/>__________________________________________
									</td>
								</tr>
								<tr>
									<td class="graph" style="border: 0px solid white; font-size:8pt;">
										<sup>1</sup> Для резидентов указывается номер паспорта гражданина Российской Федерации. Для нерезидентов паспортные данные указываются слитно (без разделения серии и номера).
										<br/>
										<sup>2</sup> Идентификационный номер налогоплательщика (ИНН) для граждан Российской Федерации.
										<br/>
										<sup>3</sup> В случае заполнения графы «Расчет таможенных платежей».
										<br/>
										<sup>4</sup> Указывается наличие товаров, в отношении которых применяются запреты и ограничения. В случае наличия таких товаров, указываются сведения о документах, подтверждающих соблюдение запретов и ограничений (вид, номер и дата выдачи документа).
										<br/>
										<sup>5</sup> В графе «Примечание» могут быть указаны номер таможенного приходного ордера и иные сведения, используемые таможенным органом для принятия решения о выпуске товаров, а также принятое таможенным органом решение.
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="repapp:ApplicationSign='1'">
						<table style="width:297mm">
							<tr>
								<td align="center" class="graph" style="border-left:1px solid #ffffff; border-top:1px solid #ffffff; border-right:1px solid #ffffff; border-bottom:1px solid #ffffff;">
									<font face="Times new roman" size="3">
										<b>РЕЕСТР ВЫВОЗИМЫХ ТОВАРОВ ДЛЯ ЛИЧНОГО ПОЛЬЗОВАНИЯ<br/>№</b>
									</font>
								</td>
							</tr>
						</table>
						<table align="center" style="width:297mm">
							<tr>
								<td align="center" class="graph" style="border-left:1px solid #ffffff; border-top:1px solid #ffffff; border-right:1px solid #ffffff;">
									<span class="graph">
										<xsl:if test="repapp:Representative/cat_ru:OrganizationName">
											<xsl:value-of select="repapp:Representative/cat_ru:OrganizationName"/>
											<xsl:if test="position()!=last()">,</xsl:if>
										</xsl:if>
										 <xsl:apply-templates select="repapp:Representative"/>
										<xsl:if test="repapp:Representative/repapp:OKPOID">
                      ОКПО: <xsl:value-of select="repapp:Representative/repapp:OKPOID"/>
										</xsl:if>
										<xsl:if test="repapp:Representative/cat_ru:Address">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="repapp:Representative/cat_ru:Address"/>
										</xsl:if>
                     Лицензия <xsl:value-of select="repapp:Representative/repapp:LicenseNumber"/>
										<xsl:if test="repapp:WarehousePlace/catESAD_ru:CertificateNumber">
                      , СВХ : <xsl:value-of select="repapp:WarehousePlace/catESAD_ru:CertificateNumber"/>
										</xsl:if>
									</span>
								</td>
							</tr>
						</table>
						<div align="center">
							<span class="graph">(наименование таможенного представителя, номер свидетельства о включении в реестр таможенных представителей, номер свидетельства о включении в реестр складов временного хранения,<br/>на которых размещены товары)</span>
						</div>
						<br/>
						<table align="center" style="width:297mm">
							<tr>
								<td align="center" width="10mm">
									<span class="graph">№ п/п</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">Регистрационный номер реестра</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">Порядковый номер отравления (индивидуальной накладной)</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">Номер индивидуальной накладной</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">Номер транспортной накладной (при перевозке товаров автомобильным транспортом)</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">Наименование товара</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">Кол-во товара</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">Общий вес отправления,<br/>кг</span>
								</td>
								<td align="center">
									<span class="graph">Стоимость<br/>в евро, рублях</span>
								</td>
								<td align="center">
									<span class="graph">Примечание<sup>1</sup></span>
								</td>
							</tr>
							<tr>
								<td align="center" width="5mm">
									<span class="graph">1</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">2</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">3</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">4</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">5</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">6</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">7</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">8</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">9</span>
								</td>
								<td align="center" width="32mm">
									<span class="graph">10</span>
								</td>
							</tr>
							<xsl:for-each select="repapp:Consignment">
								<tr>
									<td align="center" style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:value-of select="position()"/>.
										</span>
									</td>
									<td align="center" style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:if test="../repapp:ApplicationRegNumber">
												<xsl:value-of select="../repapp:ApplicationRegNumber/cat_ru:CustomsCode"/>
												<xsl:text> / </xsl:text>
												<xsl:call-template name="russian_date_gtd">
													<xsl:with-param name="dateIn" select="../repapp:ApplicationRegNumber/cat_ru:RegistrationDate"/>
												</xsl:call-template>
												<xsl:text> / </xsl:text>
												<xsl:value-of select="../repapp:ApplicationRegNumber/cat_ru:GTDNumber"/>
											</xsl:if>
										</span>
									</td>
									<td align="center" style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:if test="repapp:PrevListNumeric">
												<xsl:value-of select="repapp:PrevListNumeric"/>
											</xsl:if>
										</span>
									</td>
									<td align="center" style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:for-each select="repapp:IndividualWayBill">
												<xsl:if test="cat_ru:PrDocumentNumber">
													<xsl:value-of select="cat_ru:PrDocumentNumber"/>
												</xsl:if>
											</xsl:for-each>
										</span>
									</td>
									<td align="center" style="border-top: 2px solid black;">
										<span class="graph">
											<xsl:for-each select="repapp:WayBill">
												<xsl:if test="repapp:WayBillKind='3'">
													<xsl:if test="cat_ru:PrDocumentNumber">
														<xsl:value-of select="cat_ru:PrDocumentNumber"/>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</span>
									</td>
									<xsl:for-each select="repapp:Goods">
										<xsl:if test="position()=1">
											<xsl:call-template name="goodsInfoLine4">
												<xsl:with-param name="tdStyle" select="'border-top: 2px solid black;'"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<td align="center" style="border-top: 2px solid black;">
										<span class="graph">

                    </span>
									</td>
								</tr>
								<xsl:for-each select="repapp:Goods">
									<xsl:if test="position()>1">
										<tr>
											<td align="center">
												<span class="graph"/>
											</td>
											<td align="center">
												<span class="graph"/>
											</td>
											<td align="center">
												<span class="graph"/>
											</td>
											<td align="center">
												<span class="graph"/>
											</td>
											<td align="center">
												<span class="graph"/>
											</td>
											<xsl:call-template name="goodsInfoLine4"/>
											<td width="5%"/>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<tr>
									<td align="right" colspan="5">
										<span class="graph">Итоговые показатели:</span>
									</td>
									<td align="center">
										<span class="graph">

                    </span>
									</td>
									<td align="center">
										<span class="graph">

                    </span>
									</td>
									<td align="center">
										<span class="graph">
											<xsl:if test="repapp:GrossWeight">
												<xsl:value-of select="repapp:GrossWeight"/>
											</xsl:if>
										</span>
									</td>
									<td align="center">
										<span class="graph">
											<xsl:if test="repapp:GoodsCost">
												<xsl:value-of select="repapp:GoodsCost"/>
											</xsl:if>
										</span>
									</td>
									<td align="center">
										<span class="graph">

                    </span>
									</td>
								</tr>
							</xsl:for-each>
						</table>
						<table width="100%">
							<tr>
								<td class="graph" style="border: 0px solid white; font-size:8pt;">
									<br/>__________________________________________
								</td>
							</tr>
							<tr>
								<td class="graph" style="border: 0px solid white; font-size:8pt;">
									<sup>1</sup> В графе «Примечание» отражается решение таможенного органа.
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="repapp:ApplicationSign='3'">
						<table style="width:297mm">
							<tr>
								<td align="center" class="graph" style="border-left:1px solid #ffffff; border-top:1px solid #ffffff; border-right:1px solid #ffffff; border-bottom:1px solid #ffffff;">
									<font face="Times new roman" size="3">
										<b>РЕЕСТР ЭКСПРЕСС-ГРУЗОВ<br/>№</b>
									</font>
								</td>
							</tr>
						</table>
						<table align="center" style="width:297mm">
							<tr>
								<td align="center" class="graph" style="border-left:1px solid #ffffff; border-top:1px solid #ffffff; border-right:1px solid #ffffff;">
									<span class="graph">
										<xsl:if test="repapp:Representative/cat_ru:OrganizationName">
											<xsl:value-of select="repapp:Representative/cat_ru:OrganizationName"/>
											<xsl:if test="position()!=last()">,</xsl:if>
										</xsl:if>
                     <xsl:apply-templates select="repapp:Representative"/>
										<xsl:if test="repapp:Representative/repapp:OKPOID">
                      ОКПО: <xsl:value-of select="repapp:Representative/repapp:OKPOID"/>
										</xsl:if>
										<xsl:if test="repapp:Representative/cat_ru:Address">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="repapp:Representative/cat_ru:Address"/>
										</xsl:if>
                     Лицензия <xsl:value-of select="repapp:Representative/repapp:LicenseNumber"/>
										<xsl:if test="repapp:WarehousePlace/catESAD_ru:CertificateNumber">
                      , СВХ : <xsl:value-of select="repapp:WarehousePlace/catESAD_ru:CertificateNumber"/>
										</xsl:if>
									</span>
								</td>
							</tr>
						</table>
						<table class="graph" align="center" style="width:297mm">
							<tbody>
								<tr style="text-align:center;">
									<td>N  п/п</td>
									<td>Номер  индивидуальной накладной</td>
									<td>Номер общей накладной</td>
									<td>Индивидуальный грузоотправитель</td>
									<td>Индивидуальный грузополучатель</td>
									<td>Наименование экспресс-груза</td>
									<td>Код экспресс-груза по ТН ВЭД ЕАЭС</td>
									<td>Кол-во экспресс-грузов</td>
									<td>Вес брутто/нетто, кг</td>
									<td>Фактурная стоимость, в валюте, указанной в ком-ких док-тах</td>
									<td>Там-ная стоимость, в валюте, государств - членов таможенонного союза</td>
									<td>Расчет таможенных платежей</td>
									<td>Сведения о документах, подтверждающих соблюдение запретов и ограничений (вид, № и дата выдачи документа)</td>
									<td>Примечание</td>
								</tr>
								<tr style="text-align:center;">
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
									<td>7</td>
									<td>8</td>
									<td>9</td>
									<td>10</td>
									<td>11</td>
									<td>12</td>
									<td>13</td>
									<td>14</td>
								</tr>
								<xsl:for-each select="repapp:Consignment">
									<tr>
										<td align="center" style="border-top: 2px solid black;">
											<span class="graph">
												<xsl:value-of select="position()"/>.
								</span>
										</td>
										<td style="border-top: 2px solid black;">
											<span class="graph">
												<xsl:for-each select="repapp:IndividualWayBill">
													<xsl:if test="cat_ru:PrDocumentNumber">
														<xsl:value-of select="cat_ru:PrDocumentNumber"/>
													</xsl:if>
												</xsl:for-each>
											</span>
										</td>
										<td style="border-top: 2px solid black;">
											<span class="graph">
												<xsl:for-each select="repapp:WayBill">
													<xsl:if test="repapp:WayBillKind='2'">
														<xsl:if test="cat_ru:PrDocumentNumber">
															<xsl:value-of select="cat_ru:PrDocumentNumber"/>
															<xsl:if test="position()!=last()">
																<br/>
															</xsl:if>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
											</span>
										</td>
										<td style="border-top: 2px solid black;">
											<span class="graph">
												<xsl:if test="repapp:Consignor/cat_ru:OrganizationName">
													<xsl:value-of select="repapp:Consignor/cat_ru:OrganizationName"/>
												</xsl:if>
												<br/>
												<xsl:if test="repapp:Consignor/cat_ru:Address/cat_ru:CounryName">
													<xsl:value-of select="repapp:Consignor/cat_ru:Address/cat_ru:CounryName"/>
												</xsl:if>
												<xsl:if test="repapp:Consignor/cat_ru:Address/cat_ru:CountryCode">
													<xsl:text> (</xsl:text>
													<xsl:value-of select="repapp:Consignor/cat_ru:Address/cat_ru:CountryCode"/>
													<xsl:text>)</xsl:text>
												</xsl:if>
											</span>
										</td>
										<td style="border-top: 2px solid black;">
											<span class="graph">
												<xsl:if test="repapp:Consignee/repapp:JuridicalPerson/repapp:OrganizationName">
													<xsl:value-of select="repapp:Consignee/repapp:JuridicalPerson/repapp:OrganizationName"/>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:Person">
													<xsl:for-each select="repapp:Consignee/repapp:Person">
														<xsl:value-of select="cat_ru:PersonSurname"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:PersonName"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:PersonMiddleName"/>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:RFOrganizationFeatures">
													<br/>
													<xsl:apply-templates select="repapp:Consignee/repapp:RFOrganizationFeatures"/>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:IdentityCard/repapp:IdentityCardSeries">
													<xsl:value-of select="repapp:Consignee[repapp:ConsigneeSign='0']/repapp:IdentityCard/repapp:IdentityCardSeries"/>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:IdentityCard/repapp:IdentityCardNumber">
									 <xsl:value-of select="repapp:Consignee[repapp:ConsigneeSign='0']/repapp:IdentityCard/repapp:IdentityCardNumber"/>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:ConsigneeSign='1'">
													<xsl:text> по доверенности</xsl:text>
												</xsl:if>
											</span>
										</td>
										<xsl:for-each select="repapp:Goods">
											<xsl:if test="position()=1">
												<td style="border-top:2px solid black;">
													<xsl:apply-templates select="repapp:GoodsDescription"/>
													<!--xsl:choose>
														<xsl:when test="repapp:URLGood"><a href="{repapp:URLGood}"><xsl:apply-templates select="repapp:GoodsDescription"/></a></xsl:when>
														<xsl:otherwise><xsl:apply-templates select="repapp:GoodsDescription"/></xsl:otherwise>
													</xsl:choose-->
												</td>
												<td style="border-top:2px solid black;">
													<xsl:value-of select="repapp:GoodsTNVEDCode"/>
												</td>
												<td style="border-top:2px solid black;">
													<xsl:for-each select="repapp:GoodsQuantity">
														<xsl:value-of select="cat_ru:GoodsQuantity"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
														<xsl:if test="position()!=last()">
												,<br/>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td style="border-top:2px solid black;">
													<xsl:value-of select="repapp:GrossWeight"/>
												</td>
												<td style="border-top:2px solid black">
													<xsl:value-of select="repapp:GoodsCost"/>
												</td>
												<td style="border-top:2px solid black">
													<xsl:value-of select="repapp:GoodsCostRuble"/>
												</td>
											</xsl:if>
										</xsl:for-each>
										<td style="border-top:2px solid black">
											<xsl:for-each select="repapp:CustomsDuties">
												<xsl:value-of select="repapp:Duties"/>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
										<xsl:for-each select="repapp:Goods">
											<xsl:if test="position()=1">
												<td style="border-top:2px solid black">
													<xsl:for-each select="repapp:PresentedDocuments">
														<xsl:if test="repapp:DocumentModeCode">
															<xsl:value-of select="repapp:DocumentModeCode"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentNumber">
															<xsl:value-of select="cat_ru:PrDocumentNumber"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentDate">
															<xsl:call-template name="date">
																<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="position()!=last()">
															<br/>
														</xsl:if>
													</xsl:for-each>
												</td>
											</xsl:if>
										</xsl:for-each>
										<td style="border-top:2px solid black;"/>
									</tr>
									<xsl:for-each select="repapp:Goods">
										<xsl:if test="position()>1">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td>
													<xsl:apply-templates select="repapp:GoodsDescription"/>
													<!--xsl:choose>
														<xsl:when test="repapp:URLGood"><a href="{repapp:URLGood}"><xsl:apply-templates select="repapp:GoodsDescription"/></a></xsl:when>
														<xsl:otherwise><xsl:apply-templates select="repapp:GoodsDescription"/></xsl:otherwise>
													</xsl:choose-->
												</td>
												<td>
													<xsl:value-of select="repapp:GoodsTNVEDCode"/>
												</td>
												<td>
													<xsl:for-each select="repapp:GoodsQuantity">
														<xsl:value-of select="cat_ru:GoodsQuantity"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
														<xsl:if test="position()!=last()">
												,<br/>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td>
													<xsl:value-of select="repapp:GrossWeight"/>
												</td>
												<td/>
												<td>
													<xsl:value-of select="repapp:CustomsCost"/>
												</td>
												<td/>
												<td>
													<xsl:for-each select="repapp:PresentedDocuments">
														<xsl:if test="repapp:DocumentModeCode">
															<xsl:value-of select="repapp:DocumentModeCode"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentNumber">
															<xsl:value-of select="cat_ru:PrDocumentNumber"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentDate">
															<xsl:call-template name="date">
																<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="position()!=last()">
															<br/>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td/>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="repapp:ApplicationSign='4'">
						<table style="width:297mm">
							<tr>
								<td align="center" class="graph" style="border-left:1px solid #ffffff; border-top:1px solid #ffffff; border-right:1px solid #ffffff; border-bottom:1px solid #ffffff;">
									<font face="Times new roman" size="3">
										<b>
										  РЕЕСТР РЕЭКСПОРТИРУЕМЫХ/<br/>РЕИМПОРТИРУЕМЫХ ЭКСПРЕСС-ГРУЗОВ<br/>№
										</b>
									</font>
								</td>
							</tr>
						</table>
						<table align="center" style="width:297mm">
							<tr>
								<td align="center" class="graph" style="border-left:1px solid #ffffff; border-top:1px solid #ffffff; border-right:1px solid #ffffff;">
									<span class="graph">
										<xsl:if test="repapp:Representative/cat_ru:OrganizationName">
											<xsl:value-of select="repapp:Representative/cat_ru:OrganizationName"/>
											<xsl:if test="position()!=last()">,</xsl:if>
										</xsl:if>
                     <xsl:apply-templates select="repapp:Representative"/>
										<xsl:if test="repapp:Representative/repapp:OKPOID">
                      ОКПО: <xsl:value-of select="repapp:Representative/repapp:OKPOID"/>
										</xsl:if>
										<xsl:if test="repapp:Representative/cat_ru:Address">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="repapp:Representative/cat_ru:Address"/>
										</xsl:if>
                     Лицензия <xsl:value-of select="repapp:Representative/repapp:LicenseNumber"/>
										<xsl:if test="repapp:WarehousePlace/catESAD_ru:CertificateNumber">
                      , СВХ : <xsl:value-of select="repapp:WarehousePlace/catESAD_ru:CertificateNumber"/>
										</xsl:if>
									</span>
								</td>
							</tr>
						</table>
						<table class="graph" align="center" style="width:297mm">
							<tbody>
								<tr style="text-align:center;">
									<td>N  п/п</td>
									<td>Номер  индивидуальной накладной при вывозе/ввозе</td>
									<td>Номер общей накладной при вывозе/ввозе</td>
									<td>Номер индивидуальной накладной при прибытии</td>
									<td>Индивидуальный грузоотправитель</td>
									<td>Индивидуальный грузополучатель</td>
									<td>Наименование экспресс-груза</td>
									<td>Кол-во экспресс-грузов</td>
									<td>Код экспресс-груза по ТН ВЭД ЕАЭС</td>
									<td>Вес брутто/нетто, кг</td>
									<td>Фактурная стоимость, в валюте, указанной в ком-ких док-тах</td>
									<td>Там-ная стоимость, в валюте, государств - членов таможенонного союза</td>
									<td>Сведения о документах, подтверждающих соблюдение запретов и ограничений (вид, № и дата выдачи документа)</td>
									<td>Примечание</td>
								</tr>
								<tr style="text-align:center;">
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
									<td>7</td>
									<td>8</td>
									<td>9</td>
									<td>10</td>
									<td>11</td>
									<td>12</td>
									<td>13</td>
									<td>14</td>
								</tr>
								<xsl:for-each select="repapp:Consignment">
									<tr>
										<td align="center" style="border-top: 2px solid black;">
											<span class="graph">
												<xsl:value-of select="position()"/>.
								</span>
										</td>
										<td style="border-top: 2px solid black;">
											<span class="graph">
												<xsl:for-each select="repapp:IndividualWayBill">
													<xsl:if test="cat_ru:PrDocumentNumber">
														<xsl:value-of select="cat_ru:PrDocumentNumber"/>
													</xsl:if>
												</xsl:for-each>
											</span>
										</td>
										<td style="border-top: 2px solid black;">
											<span class="graph">
												<xsl:for-each select="repapp:WayBill">
													<xsl:if test="repapp:WayBillKind='2'">
														<xsl:if test="cat_ru:PrDocumentNumber">
															<xsl:value-of select="cat_ru:PrDocumentNumber"/>
															<xsl:if test="position()!=last()">
																<br/>
															</xsl:if>
														</xsl:if>
													</xsl:if>
												</xsl:for-each>
											</span>
										</td>
										<td style="border-top:2px solid black;">
											<!-- не понятно откуда брать -->
										</td>
										<td style="border-top: 2px solid black;">
											<span class="graph">
												<xsl:if test="repapp:Consignor/cat_ru:OrganizationName">
													<xsl:value-of select="repapp:Consignor/cat_ru:OrganizationName"/>
												</xsl:if>
												<br/>
												<xsl:if test="repapp:Consignor/cat_ru:Address/cat_ru:CounryName">
													<xsl:value-of select="repapp:Consignor/cat_ru:Address/cat_ru:CounryName"/>
												</xsl:if>
												<xsl:if test="repapp:Consignor/cat_ru:Address/cat_ru:CountryCode">
													<xsl:text> (</xsl:text>
													<xsl:value-of select="repapp:Consignor/cat_ru:Address/cat_ru:CountryCode"/>
													<xsl:text>)</xsl:text>
												</xsl:if>
											</span>
										</td>
										<td style="border-top: 2px solid black;">
											<span class="graph">
												<xsl:if test="repapp:Consignee/repapp:JuridicalPerson/repapp:OrganizationName">
													<xsl:value-of select="repapp:Consignee/repapp:JuridicalPerson/repapp:OrganizationName"/>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:Person">
													<xsl:for-each select="repapp:Consignee/repapp:Person">
														<xsl:value-of select="cat_ru:PersonSurname"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:PersonName"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:PersonMiddleName"/>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:RFOrganizationFeatures">
													<br/>
													<xsl:apply-templates select="repapp:Consignee/repapp:RFOrganizationFeatures"/>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:IdentityCard/repapp:IdentityCardSeries">
													<xsl:value-of select="repapp:Consignee[repapp:ConsigneeSign='0']/repapp:IdentityCard/repapp:IdentityCardSeries"/>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:IdentityCard/repapp:IdentityCardNumber">
									 <xsl:value-of select="repapp:Consignee[repapp:ConsigneeSign='0']/repapp:IdentityCard/repapp:IdentityCardNumber"/>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:ConsigneeSign='1'">
													<xsl:text> по доверенности</xsl:text>
												</xsl:if>
											</span>
										</td>
										<xsl:for-each select="repapp:Goods">
											<xsl:if test="position()=1">
												<td style="border-top:2px solid black;">
													<xsl:apply-templates select="repapp:GoodsDescription"/>
													<!--xsl:choose>
														<xsl:when test="repapp:URLGood"><a href="{repapp:URLGood}"><xsl:apply-templates select="repapp:GoodsDescription"/></a></xsl:when>
														<xsl:otherwise><xsl:apply-templates select="repapp:GoodsDescription"/></xsl:otherwise>
													</xsl:choose-->
												</td>
												<td style="border-top:2px solid black;">
													<xsl:for-each select="repapp:GoodsQuantity">
														<xsl:value-of select="cat_ru:GoodsQuantity"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
														<xsl:if test="position()!=last()">
												,<br/>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td style="border-top:2px solid black;">
													<xsl:value-of select="repapp:GoodsTNVEDCode"/>
												</td>
												<td style="border-top:2px solid black;">
													<xsl:value-of select="repapp:GrossWeight"/>
												</td>
												<td style="border-top:2px solid black">
													<xsl:value-of select="repapp:GoodsCost"/>
												</td>
												<td style="border-top:2px solid black">
													<xsl:value-of select="repapp:GoodsCostRuble"/>
												</td>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="repapp:Goods">
											<xsl:if test="position()=1">
												<td style="border-top:2px solid black">
													<xsl:for-each select="repapp:PresentedDocuments">
														<xsl:if test="repapp:DocumentModeCode">
															<xsl:value-of select="repapp:DocumentModeCode"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentNumber">
															<xsl:value-of select="cat_ru:PrDocumentNumber"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentDate">
															<xsl:call-template name="date">
																<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="position()!=last()">
															<br/>
														</xsl:if>
													</xsl:for-each>
												</td>
											</xsl:if>
										</xsl:for-each>
										<td style="border-top:2px solid black;"/>
									</tr>
									<xsl:for-each select="repapp:Goods">
										<xsl:if test="position()>1">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td>
													<xsl:apply-templates select="repapp:GoodsDescription"/>
													<!--xsl:choose>
														<xsl:when test="repapp:URLGood"><a href="{repapp:URLGood}"><xsl:apply-templates select="repapp:GoodsDescription"/></a></xsl:when>
														<xsl:otherwise><xsl:apply-templates select="repapp:GoodsDescription"/></xsl:otherwise>
													</xsl:choose-->
												</td>
												<td>
													<xsl:for-each select="repapp:GoodsQuantity">
														<xsl:value-of select="cat_ru:GoodsQuantity"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
														<xsl:if test="position()!=last()">
												,<br/>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td>
													<xsl:value-of select="repapp:GoodsTNVEDCode"/>
												</td>
												<td>
													<xsl:value-of select="repapp:GrossWeight"/>
												</td>
												<td>
													<xsl:value-of select="repapp:GoodsCost"/>
												</td>
												<td>
													<xsl:value-of select="repapp:GoodsCostRuble"/>
												</td>
												<td>
													<xsl:for-each select="repapp:PresentedDocuments">
														<xsl:if test="repapp:DocumentModeCode">
															<xsl:value-of select="repapp:DocumentModeCode"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentNumber">
															<xsl:value-of select="cat_ru:PrDocumentNumber"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentDate">
															<xsl:call-template name="date">
																<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="position()!=last()">
															<br/>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td/>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="repapp:ApplicationSign='5'">
						<table style="width:297mm">
							<tr>
								<td align="center" class="graph" style="border-left:1px solid #ffffff; border-top:1px solid #ffffff; border-right:1px solid #ffffff; border-bottom:1px solid #ffffff;">
									<font face="Times new roman" size="3">
										<b>
                      РЕЕСТР экспортируемых международных почтовых отправлений (МПО)<br/>№
                    </b>
									</font>
								</td>
							</tr>
						</table>
						<table align="center" style="width:297mm">
							<tr>
								<td align="center" class="graph" style="border-left:1px solid #ffffff; border-top:1px solid #ffffff; border-right:1px solid #ffffff;">
									<span class="graph">
										<xsl:if test="repapp:Representative/cat_ru:OrganizationName">
											<xsl:value-of select="repapp:Representative/cat_ru:OrganizationName"/>
											<xsl:if test="position()!=last()">,</xsl:if>
										</xsl:if>
                     <xsl:apply-templates select="repapp:Representative"/>
										<xsl:if test="repapp:Representative/repapp:OKPOID">
                      ОКПО: <xsl:value-of select="repapp:Representative/repapp:OKPOID"/>
										</xsl:if>
										<xsl:if test="repapp:Representative/cat_ru:Address">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates select="repapp:Representative/cat_ru:Address"/>
										</xsl:if>
                     Лицензия <xsl:value-of select="repapp:Representative/repapp:LicenseNumber"/>
										<xsl:if test="repapp:WarehousePlace/catESAD_ru:CertificateNumber">
                      , СВХ : <xsl:value-of select="repapp:WarehousePlace/catESAD_ru:CertificateNumber"/>
										</xsl:if>
									</span>
								</td>
							</tr>
						</table>
						<table class="graph" align="center" style="width:297mm">
							<tbody>
								<tr style="text-align:center;">
									<td>N  п/п</td>
									<td>Идентификационный номер МПО</td>
									<td>Отправитель</td>
									<td>Получатель</td>
									<td>Наименование товаров</td>
									<td>Количество товаров</td>
									<td>Код товаров по ТН ВЭД ЕАЭС</td>
									<td>Вес брутто/нетто, кг.</td>
									<td>Фактурная стоимость, в валюте, указанной в сопроводительных документах</td>
									<td>Таможенная стоимость, в валюте государств-членов Евразийского экономического союза</td>
									<td>Сведения о документах, подтверждающих соблюдение запретов и ограничений (вид, № и дата выдачи документа)</td>
									<td>Примечание</td>
								</tr>
								<tr style="text-align:center;">
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
									<td>7</td>
									<td>8</td>
									<td>9</td>
									<td>10</td>
									<td>11</td>
									<td>12</td>
								</tr>
								<xsl:for-each select="repapp:Consignment">
									<tr>
										<td align="center" style="border-top: 2px solid black;">
											<span class="graph">
												<xsl:value-of select="position()"/>.
								</span>
										</td>
										<td style="border-top: 2px solid black;">
											<span class="graph">
												<xsl:for-each select="repapp:IndividualWayBill">
													<xsl:value-of select="cat_ru:PrDocumentNumber"/>
													<!--xsl:value-of select="repapp:MPO_Number"/-->
												</xsl:for-each>
											</span>
										</td>
										<td style="border-top: 2px solid black;">
											<span class="graph">
												<xsl:if test="repapp:Consignor/cat_ru:OrganizationName">
													<xsl:value-of select="repapp:Consignor/cat_ru:OrganizationName"/>
												</xsl:if>
												<br/>
												<xsl:if test="repapp:Consignor/cat_ru:Address/cat_ru:CounryName">
													<xsl:value-of select="repapp:Consignor/cat_ru:Address/cat_ru:CounryName"/>
												</xsl:if>
												<xsl:if test="repapp:Consignor/cat_ru:Address/cat_ru:CountryCode">
													<xsl:text> (</xsl:text>
													<xsl:value-of select="repapp:Consignor/cat_ru:Address/cat_ru:CountryCode"/>
													<xsl:text>)</xsl:text>
												</xsl:if>
											</span>
										</td>
										<td style="border-top: 2px solid black;">
											<span class="graph">
												<xsl:if test="repapp:Consignee/repapp:JuridicalPerson/repapp:OrganizationName">
													<xsl:value-of select="repapp:Consignee/repapp:JuridicalPerson/repapp:OrganizationName"/>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:Person">
													<xsl:for-each select="repapp:Consignee/repapp:Person">
														<xsl:value-of select="cat_ru:PersonSurname"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:PersonName"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="cat_ru:PersonMiddleName"/>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:RFOrganizationFeatures">
													<br/>
													<xsl:apply-templates select="repapp:Consignee/repapp:RFOrganizationFeatures"/>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:IdentityCard/repapp:IdentityCardSeries">
													<xsl:value-of select="repapp:Consignee[repapp:ConsigneeSign='0']/repapp:IdentityCard/repapp:IdentityCardSeries"/>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:IdentityCard/repapp:IdentityCardNumber">
									 <xsl:value-of select="repapp:Consignee[repapp:ConsigneeSign='0']/repapp:IdentityCard/repapp:IdentityCardNumber"/>
												</xsl:if>
												<xsl:if test="repapp:Consignee/repapp:ConsigneeSign='1'">
													<xsl:text> по доверенности</xsl:text>
												</xsl:if>
											</span>
										</td>
										<xsl:for-each select="repapp:Goods">
											<xsl:if test="position()=1">
												<td style="border-top:2px solid black;">
													<xsl:apply-templates select="repapp:GoodsDescription"/>
													<!--xsl:choose>
														<xsl:when test="repapp:URLGood"><a href="{repapp:URLGood}"><xsl:apply-templates select="repapp:GoodsDescription"/></a></xsl:when>
														<xsl:otherwise><xsl:apply-templates select="repapp:GoodsDescription"/></xsl:otherwise>
													</xsl:choose-->
												</td>
												<td style="border-top:2px solid black;">
													<xsl:for-each select="repapp:GoodsQuantity">
														<xsl:value-of select="cat_ru:GoodsQuantity"/>
														<xsl:if test="cat_ru:MeasureUnitQualifierCode | cat_ru:MeasureUnitQualifierName">
												(<xsl:if test="cat_ru:MeasureUnitQualifierCode">
																<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/> 
												</xsl:if>
															<xsl:if test="cat_ru:MeasureUnitQualifierName">
																<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
															</xsl:if>)
											</xsl:if>
														<xsl:if test="position()!=last()">
												,<br/>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td style="border-top:2px solid black;">
													<xsl:value-of select="repapp:GoodsTNVEDCode"/>
												</td>
												<td style="border-top:2px solid black;">
													<xsl:value-of select="repapp:GrossWeight"/>
												</td>
												<td style="border-top:2px solid black">
													<xsl:value-of select="repapp:GoodsCost"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="../repapp:Currency"/>
												</td>
												<td style="border-top:2px solid black">
													<xsl:value-of select="repapp:CustomsCost"/>
												</td>
												<td style="border-top:2px solid black">
													<xsl:for-each select="repapp:PresentedDocuments">
														<xsl:if test="repapp:DocumentModeCode">
															<xsl:value-of select="repapp:DocumentModeCode"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentNumber">
															<xsl:value-of select="cat_ru:PrDocumentNumber"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentDate">
															<xsl:call-template name="date">
																<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="position()!=last()">
															<br/>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td style="border-top:2px solid black;">
													<xsl:value-of select="repapp:Comment"/>
												</td>
											</xsl:if>
										</xsl:for-each>
									</tr>
									<xsl:for-each select="repapp:Goods">
										<xsl:if test="position()>1">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td>
													<xsl:apply-templates select="repapp:GoodsDescription"/>
													<!--xsl:choose>
														<xsl:when test="repapp:URLGood"><a href="{repapp:URLGood}"><xsl:apply-templates select="repapp:GoodsDescription"/></a></xsl:when>
														<xsl:otherwise><xsl:apply-templates select="repapp:GoodsDescription"/></xsl:otherwise>
													</xsl:choose-->
												</td>
												<td>
													<xsl:for-each select="repapp:GoodsQuantity">
														<xsl:value-of select="cat_ru:GoodsQuantity"/>
														<xsl:if test="cat_ru:MeasureUnitQualifierCode | cat_ru:MeasureUnitQualifierName">
												(<xsl:if test="cat_ru:MeasureUnitQualifierCode">
																<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/> 
												</xsl:if>
															<xsl:if test="cat_ru:MeasureUnitQualifierName">
																<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
															</xsl:if>)
											</xsl:if>
														<xsl:if test="position()!=last()">
												,<br/>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td>
													<xsl:value-of select="repapp:GoodsTNVEDCode"/>
												</td>
												<td>
													<xsl:value-of select="repapp:GrossWeight"/>
												</td>
												<td>
													<xsl:value-of select="repapp:GoodsCost"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="../repapp:Currency"/>
												</td>
												<td>
													<xsl:value-of select="repapp:CustomsCost"/>
												</td>
												<td>
													<xsl:for-each select="repapp:PresentedDocuments">
														<xsl:if test="repapp:DocumentModeCode">
															<xsl:value-of select="repapp:DocumentModeCode"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentNumber">
															<xsl:value-of select="cat_ru:PrDocumentNumber"/>
															<xsl:text> </xsl:text>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentDate">
															<xsl:call-template name="date">
																<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="position()!=last()">
															<br/>
														</xsl:if>
													</xsl:for-each>
												</td>
												<td>
													<xsl:value-of select="repapp:Comment"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="goodsInfoLine1p1">
		<xsl:param name="tdStyle"/>
		<xsl:element name="td">
			<xsl:if test="$tdStyle">
				<xsl:attribute name="style"><xsl:value-of select="$tdStyle"/></xsl:attribute>
			</xsl:if>
			<span class="graph">
				<xsl:apply-templates select="repapp:GoodsDescription"/>
				<!--xsl:choose>
					<xsl:when test="repapp:URLGood"><a href="{repapp:URLGood}"><xsl:apply-templates select="repapp:GoodsDescription"/></a></xsl:when>
					<xsl:otherwise><xsl:apply-templates select="repapp:GoodsDescription"/></xsl:otherwise>
				</xsl:choose-->
				<xsl:if test="repapp:GoodsTNVEDCode">
					<xsl:text>, </xsl:text>
					<xsl:value-of select="repapp:GoodsTNVEDCode"/>
				</xsl:if>
			</span>
		</xsl:element>
		<xsl:element name="td">
			<xsl:if test="$tdStyle">
				<xsl:attribute name="style"><xsl:value-of select="$tdStyle"/></xsl:attribute>
			</xsl:if>
			<span class="graph">
				<xsl:value-of select="repapp:GoodsQuantity/cat_ru:GoodsQuantity"/>
			</span>
		</xsl:element>
		<xsl:element name="td">
			<xsl:if test="$tdStyle">
				<xsl:attribute name="style"><xsl:value-of select="$tdStyle"/></xsl:attribute>
			</xsl:if>
			<span class="graph">
				<xsl:value-of select="repapp:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
			</span>
		</xsl:element>
		<xsl:element name="td">
			<xsl:if test="$tdStyle">
				<xsl:attribute name="style"><xsl:value-of select="$tdStyle"/></xsl:attribute>
			</xsl:if>
			<span class="graph">
				<xsl:value-of select="repapp:GrossWeight"/>
			</span>
		</xsl:element>
		<xsl:element name="td">
			<xsl:if test="$tdStyle">
				<xsl:attribute name="style"><xsl:value-of select="$tdStyle"/></xsl:attribute>
			</xsl:if>
			<span class="graph">
				<xsl:value-of select="repapp:GoodsCostEuro"/>
			</span>
		</xsl:element>
		<xsl:element name="td">
			<xsl:if test="$tdStyle">
				<xsl:attribute name="style"><xsl:value-of select="$tdStyle"/></xsl:attribute>
			</xsl:if>
			<span class="graph">
				<xsl:if test="repapp:GoodsCostRuble">
					<xsl:value-of select="repapp:GoodsCostRuble"/>
				</xsl:if>
			</span>
		</xsl:element>
	</xsl:template>
	<xsl:template name="goodsInfoLine1p2">
		<xsl:param name="tdStyle"/>
		<xsl:element name="td">
			<xsl:if test="$tdStyle">
				<xsl:attribute name="style"><xsl:value-of select="$tdStyle"/></xsl:attribute>
			</xsl:if>
			<xsl:for-each select="repapp:PresentedDocuments">
				<span class="graph">
					<xsl:if test="repapp:DocumentModeCode">
						<xsl:value-of select="repapp:DocumentModeCode"/>
					</xsl:if>
					<xsl:text> </xsl:text>
					<xsl:if test="cat_ru:PrDocumentNumber">
						<xsl:value-of select="cat_ru:PrDocumentNumber"/>
					</xsl:if>
					<xsl:text> </xsl:text>
					<xsl:if test="cat_ru:PrDocumentDate">
						<xsl:call-template name="date">
							<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					</xsl:if>
					<br/>
				</span>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="goodsInfoLine4">
		<xsl:param name="tdStyle"/>
		<xsl:element name="td">
			<xsl:if test="$tdStyle">
				<xsl:attribute name="style"><xsl:value-of select="$tdStyle"/></xsl:attribute>
			</xsl:if>
			<span class="graph">
				<xsl:apply-templates select="repapp:GoodsDescription"/>
				<!--xsl:choose>
					<xsl:when test="repapp:URLGood"><a href="{repapp:URLGood}"><xsl:apply-templates select="repapp:GoodsDescription"/></a></xsl:when>
					<xsl:otherwise><xsl:apply-templates select="repapp:GoodsDescription"/></xsl:otherwise>
				</xsl:choose-->
			</span>
		</xsl:element>
		<xsl:element name="td">
			<xsl:if test="$tdStyle">
				<xsl:attribute name="style"><xsl:value-of select="$tdStyle"/></xsl:attribute>
			</xsl:if>
			<span class="graph">
				<xsl:for-each select="repapp:GoodsQuantity">
					<xsl:value-of select="cat_ru:GoodsQuantity"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
					<xsl:if test="position()!=last()">
						<br/>
					</xsl:if>
				</xsl:for-each>
			</span>
		</xsl:element>
		<xsl:element name="td">
			<xsl:if test="$tdStyle">
				<xsl:attribute name="style"><xsl:value-of select="$tdStyle"/></xsl:attribute>
			</xsl:if>
			<span class="graph">
				<xsl:value-of select="repapp:GrossWeight"/>
			</span>
		</xsl:element>
		<xsl:element name="td">
			<xsl:if test="$tdStyle">
				<xsl:attribute name="style"><xsl:value-of select="$tdStyle"/></xsl:attribute>
			</xsl:if>
			<span class="graph">
				<xsl:if test="repapp:GoodsCost">
					<xsl:value-of select="repapp:GoodsCost"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="../repapp:Currency"/>
				</xsl:if>
			</span>
		</xsl:element>
	</xsl:template>
	<xsl:template name="date">
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
</xsl:stylesheet>
