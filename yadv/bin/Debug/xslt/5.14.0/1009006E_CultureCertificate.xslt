<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru culc" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:culc="urn:customs.ru:Information:SertifDocuments:CultureCertificate:5.14.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0">
	<xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="culc:CultureCertificate">
		<html>
			<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
			<style type="text/css">
                    body {
						background: #cccccc;
                    }

                    div.page {
                        width: 180mm;
                        margin: auto;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        /*padding-left: 20mm;*/
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

                    @media print {
                        div.page {
                            border: none;
                            padding: 0;
                        }
                    }
                     .graph12 {
                        font-family: Arial, serif, bold;
                        font-size: 12pt;}
                        
                        .graph10 {
                        font-family: Arial, serif;
                        font-size: 10pt; }
                        
                    .graph10_underline {
                        font-family: Arial, serif;
                        font-size: 10pt; text-decoration:underline;}

                    .graph8 {
                        font-family: Arial, serif;
                        font-size: 8pt;}

                       td {
                        font-family: Arial, serif;
                    }
                     .underlined {
                        border-bottom: solid 1pt #000000;
                    }
                    </style>
			<xsl:variable name="type" select="culc:ExportType"/>
			<div class="page">
				<table align="center" style="width:170mm">
					<tr>
						<td align="center" class="graph12">СВИДЕТЕЛЬСТВО №  
						<xsl:value-of select="culc:RegNumber"/>
							<br/>
							на право вывоза культурных ценностей с территории<br/>
										Российской Федерации
					</td>
					</tr>
					<tr>
						<td class="graph10">Выдано </td>
					</tr>
					<tr>
						<td>
							<br/>
						</td>
					</tr>
					<tr class="graph10">
						<td align="center" class="underlined">
							<xsl:apply-templates select="culc:OrganizationIssued"/>
						</td>
					</tr>
					<tr>
						<td align="center" class="graph8">(фамилия, имя, отчество физического лица
                        или наименование юридического лица)</td>
					</tr>
					<tr>
						<td>
							<br/>
						</td>
					</tr>
					<tr>
						<td align="center" class="graph10">
						на право
                  <!--<xsl:variable name="type" select="culc:ExportType"/>-->
							<xsl:choose>
								<xsl:when test="$type='1'"> постоянного</xsl:when>
								<xsl:when test="$type='0'"> временного</xsl:when>
							</xsl:choose> вывоза культурных ценностей:
					</td>
					</tr>
				</table>
				<br/>
				<xsl:if test="culc:NumSheets">
					<table>
						<tr>
							<td class="graph10">
							Список предметов на <u>
									<xsl:value-of select="culc:NumSheets"/>
								</u> листах прилагается
						</td>
						</tr>
					</table>
				</xsl:if>
				<xsl:if test="culc:NumFoto or culc:FlagImage='true' or culc:FlagImage = '1'">
					<table>
						<tr>
							<td class="graph10">
								<xsl:if test="culc:FlagImage='true' or culc:FlagImage = '1'">Имеются изображения предметов. </xsl:if>
								<xsl:if test="culc:NumFoto">
								Фотографии предметов в количестве 
								<u>
										<xsl:value-of select="culc:NumFoto"/> </u>
								 шт. прилагаются
							</xsl:if>
							</td>
						</tr>
					</table>
				</xsl:if>
				<table>
					<tr>
						<td class="graph10" style="width:30%">Культурные ценности вывозятся в </td>
						<td align="center" valign="bottom" class="underlined" style="width:40%">
							<span class="graph10">
								<xsl:value-of select="culc:CountryName"/>
							</span>
						</td>
						<td style="width:30%"/>
					</tr>
					<tr>
						<td/>
						<td align="center" class="graph8">(название страны)</td>
						<td/>
					</tr>
				</table>
				<xsl:if test="$type='false' or $type='f' or $type='0'">
					<table style="width: 100%">
						<tr>
							<td class="graph10" style="width: 15%">Цель вывоза </td>
							<td class="underlined" style="width: 50%">
								<span class="graph10">
									<xsl:value-of select="culc:Target"/>
								</span>
							</td>
							<td align="right" class="graph10" style="width: 15%">срок вывоза </td>
							<td align="center" valign="bottom" class="underlined" style="width: 20%">
								<span class="graph10">
									<xsl:value-of select="culc:Term"/>/<xsl:value-of select="culc:UnitTime"/>
								</span>
							</td>
						</tr>
						<tr>
							<td/>
							<td align="center" class="graph8">(заполняется при временном вывозе)</td>
							<td colspan="2"/>
						</tr>
					</table>
				</xsl:if>
				<br/>
				<table align="center" style="width:100%">
					<tr>
						<td class="graph10" style="width:35%">Вывоз разрешен на основании решения, </td>
						<td align="center" class="underlined" style="width:65%">
							<xsl:value-of select="culc:DecisionInf/cat_ru:PrDocumentName"/>
							<span class="graph10"> выданного <xsl:value-of select="culc:DecisionInf/culc:StateStructure"/>
							</span>
						</td>
					</tr>
					<tr>
						<td/>
						<td align="center" class="graph8">(наименование государственного органа, выдавшего свидетельство)</td>
					</tr>
				</table>
				<table align="center" style="width:100%">
					<tr>
						<td align="center" class="graph10">от  <u>
								<xsl:choose>
									<xsl:when test="culc:DecisionInf/cat_ru:PrDocumentDate">
										<xsl:for-each select="culc:DecisionInf/cat_ru:PrDocumentDate">
											<xsl:call-template name="Date"/> </xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:for-each select="culc:DateIssued">
											<xsl:call-template name="Date"/> </xsl:for-each>
									</xsl:otherwise>
								</xsl:choose>
							</u>
					№ <u>
								<xsl:value-of select="culc:DecisionInf/cat_ru:PrDocumentNumber"/>
							</u>
						</td>
					</tr>
					<tr>
						<td align="right" class="graph10" colspan="2">М.П.<br/>
						</td>
					</tr>
					<tr>
						<td align="center" class="underlined" colspan="2">
							<span class="graph10">
								<xsl:value-of select="culc:PersonIssued/cat_ru:PersonSurname"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="culc:PersonIssued/cat_ru:PersonName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="culc:PersonIssued/cat_ru:PersonMiddleName"/> 
						</span>
						</td>
					</tr>
					<tr>
						<td align="center" class="graph8" colspan="2">(подпись должностного лица государственного органа, выдавшего свидетельство, его фамилия, инициалы)
</td>
					</tr>
					<tr>
						<td align="center" class="underlined" colspan="2">
							<span class="graph10">
								<xsl:for-each select="culc:DateIssued">
									<xsl:call-template name="Date"/>
								</xsl:for-each> 
					
						<xsl:value-of select="culc:PlaceIssued"/>
							</span>
						</td>
					</tr>
					<tr>
						<td align="center" class="graph8" colspan="2">(дата и место выдачи свидетельства)</td>
					</tr>
					<xsl:if test="culc:StartDate">
						<tr>
							<td align="center" class="underlined" colspan="2">
								<span class="graph10">
									<xsl:for-each select="culc:StartDate">
										<xsl:call-template name="Date"/>
									</xsl:for-each> 
					  </span>
							</td>
						</tr>
						<tr>
							<td align="center" class="graph8" colspan="2">(дата начала действия свидетельства)</td>
						</tr>
					</xsl:if>
					<xsl:if test="culc:EndDate">
						<tr>
							<td align="center" class="underlined" colspan="2">
								<span class="graph10">
									<xsl:for-each select="culc:EndDate">
										<xsl:call-template name="Date"/>
									</xsl:for-each> 
					  </span>
							</td>
						</tr>
						<tr>
							<td align="center" class="graph8" colspan="2">(дата окончания действия свидетельства)</td>
						</tr>
					</xsl:if>
					<xsl:if test="culc:LastUpdate">
						<tr>
							<td align="center" class="underlined" colspan="2">
								<span class="graph10">
									<xsl:for-each select="culc:LastUpdate">
										<xsl:call-template name="Date"/>
									</xsl:for-each> 
					  </span>
							</td>
						</tr>
						<tr>
							<td align="center" class="graph8" colspan="2">(дата последнего обновления документа)</td>
						</tr>
					</xsl:if>
					<!--tr>
               <td class="graph10" colspan="2">Отметки таможни: 
					<xsl:for-each select="culc:CustomsMark"> 
							<xsl:value-of select="."/>
                  </xsl:for-each>
                  <br/>
                  <br/>
               </td>
            </tr-->
					<tr>
						<td align="center" class="graph10" colspan="2">
							<br/>
							<br/>
						СПИСОК КУЛЬТУРНЫХ ЦЕННОСТЕЙ
				  </td>
					</tr>
				</table>
				<table border="1" cellpadding="1" cellspacing="0" style="width:100%" align="center">
					<tbody>
						<tr>
							<td align="center">Наименование</td>
							<xsl:if test="//culc:Description">
								<td align="center" style="width:40%">Описание</td>
							</xsl:if>
							<td align="center" style="width:20%">Количество</td>
						</tr>
						<xsl:for-each select="culc:CulturalValuesList">
							<tr>
								<td align="center" class="graph10">
									<xsl:for-each select="culc:CulturalName">
										<xsl:value-of select="."/>
									</xsl:for-each>
								</td>
								<xsl:if test="//culc:Description">
									<td align="center" class="graph10" style="width:40%">
										<xsl:for-each select="culc:Description">
											<xsl:value-of select="."/>
										</xsl:for-each>
									</td>
								</xsl:if>
								<td align="center" class="graph10" style="width:20%">
									<xsl:value-of select="culc:Quantity/cat_ru:GoodsQuantity"/> 
								<xsl:value-of select="culc:Quantity/cat_ru:MeasureUnitQualifierName"/>
									<xsl:if test="culc:Quantity/cat_ru:MeasureUnitQualifierCode"> (<xsl:value-of select="culc:Quantity/cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</div>
			<xsl:if test="culc:BDRDID or culc:OrganizationIssued/RUScat_ru:RFOrganizationFeatures or culc:OrganizationIssued/RUScat_ru:Address or culc:OrgUnitCode">
				<div class="page">
					<table align="center">
						<tr>
							<td align="center" class="graph12">ДОПОЛНИТЕЛЬНАЯ ИНФОРМАЦИЯ</td>
						</tr>
					</table>
					<br/>
					<table align="center" border="1" cellpadding="1" cellspacing="0" class="graph10" style="width: 100%">
						<xsl:if test="culc:BDRDID">
							<tr>
								<td style="width: 40%">Идентификатор документа по БД РД</td>
								<td style="width: 60%">
									<xsl:value-of select="culc:BDRDID"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="culc:OrganizationIssued/RUScat_ru:RFOrganizationFeatures or culc:OrganizationIssued/RUScat_ru:Address">
							<xsl:for-each select="culc:OrganizationIssued">
								<tr>
									<td style="width: 40%; border">Сведения о лице или об организации, которому(й) выдан сертификат</td>
									<td style="width: 60%; border">
										<xsl:for-each select="RUScat_ru:OrganizationName">
											<xsl:value-of select="."/>
										</xsl:for-each>
										<xsl:if test="RUScat_ru:ShortName">
											<xsl:if test="RUScat_ru:OrganizationName"> (</xsl:if>
											<xsl:value-of select="RUScat_ru:ShortName"/>
											<xsl:if test="RUScat_ru:OrganizationName">)</xsl:if>
										</xsl:if>
										<xsl:for-each select="RUScat_ru:RFOrganizationFeatures">
											<xsl:if test="cat_ru:OGRN"> ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
											</xsl:if>
											<xsl:if test="cat_ru:INN"> ИНН: <xsl:value-of select="cat_ru:INN"/>
											</xsl:if>
											<xsl:if test="cat_ru:KPP"> КПП: <xsl:value-of select="cat_ru:KPP"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="RUScat_ru:Address"> Юридический адрес: <xsl:value-of select="RUScat_ru:Address"/>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="culc:OrgUnitCode">
							<tr>
								<td style="width: 40%">Мнемоника отправителя запроса</td>
								<td style="width: 60%">
									<xsl:value-of select="culc:OrgUnitCode"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="culc:Owner">
							<tr>
								<td style="width: 40%">Владелец культурной ценности</td>
								<td style="width: 60%">
									<xsl:value-of select="culc:Owner"/>
								</td>
							</tr>
						</xsl:if>
					</table>
				</div>
			</xsl:if>
		</html>
	</xsl:template>
	<xsl:template name="Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="culc:OrganizationIssued">
		<xsl:if test="RUScat_ru:OrganizationName">
			<xsl:for-each select="RUScat_ru:OrganizationName">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:ShortName">
			<xsl:if test="string-length(RUScat_ru:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="RUScat_ru:ShortName"/>
			<xsl:if test="string-length(RUScat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/>
		<xsl:if test="string-length(RUScat_ru:OrganizationName) &gt; 0 or string-length(RUScat_ru:ShortName) &gt; 0 or string-length(RUScat_ru:RFOrganizationFeatures) &gt; 0 or string-length(RKOrganizationFeatures) &gt; 0 or string-length(RBOrganizationFeatures) &gt; 0 or string-length(RAOrganizationFeatures) &gt; 0 or string-length(KGOrganizationFeatures) &gt; 0">,&#160;</xsl:if>
		<xsl:value-of select="RUScat_ru:Address"/>
		<xsl:if test="string-length(RUScat_ru:OrganizationName) &gt; 0 or string-length(RUScat_ru:ShortName) &gt; 0 or string-length(RUScat_ru:RFOrganizationFeatures) &gt; 0 or string-length(RKOrganizationFeatures) &gt; 0 or string-length(RBOrganizationFeatures) &gt; 0 or string-length(RAOrganizationFeatures) &gt; 0 or string-length(KGOrganizationFeatures) &gt; 0  or string-length(RUScat_ru:Address) &gt; 0">,&#160;</xsl:if>
		<xsl:value-of select="culc:HeadFIO"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RFOrganizationFeatures">
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
	<!-- Шаблон для типа RUScat_ru:RKOrganizationFeatures -->
	<xsl:template match="RUScat_ru:RKOrganizationFeatures">
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
	<!-- Шаблон для типа RUScat_ru:RBOrganizationFeatures -->
	<xsl:template match="RUScat_ru:RBOrganizationFeatures">
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
	<!-- Шаблон для типа RUScat_ru:RAOrganizationFeatures -->
	<xsl:template match="RUScat_ru:RAOrganizationFeatures">
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
	<!-- Шаблон для типа RUScat_ru:KGOrganizationFeatures -->
	<xsl:template match="RUScat_ru:KGOrganizationFeatures">
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
	<xsl:template name="Date">
	"<xsl:value-of select="substring (., 9, 2)"/>" 
					<xsl:variable name="month" select="substring(., 6, 2)"/>
		<xsl:choose>
			<xsl:when test="$month=1">января</xsl:when>
			<xsl:when test="$month=2">февраля</xsl:when>
			<xsl:when test="$month=3">марта</xsl:when>
			<xsl:when test="$month=4">апреля</xsl:when>
			<xsl:when test="$month=5">мая</xsl:when>
			<xsl:when test="$month=6">июня</xsl:when>
			<xsl:when test="$month=7">июля</xsl:when>
			<xsl:when test="$month=8">августа</xsl:when>
			<xsl:when test="$month=9">сентября</xsl:when>
			<xsl:when test="$month=10">октября</xsl:when>
			<xsl:when test="$month=11">ноября</xsl:when>
			<xsl:when test="$month=12">декабря</xsl:when>
		</xsl:choose> 					
					<xsl:value-of select="substring(., 1, 4)"/> г.
	</xsl:template>
</xsl:stylesheet>
