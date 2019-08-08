<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:ats="urn:customs.ru:Information:CustomsDocuments:ActThievingSampling:5.12.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
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
	<xsl:template name="russian_date2">
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
	<xsl:template match="ats:ActThievingSampling">
		<html>
			<head>
				<title>Акт отбора проб и (или) образцов товаров</title>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.normal3{
							
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.normal4{
							
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: medium none;
							}
							.bold2{
							font-weight: bold;
							font-family:Arial;
							font-size: 13pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.normal2{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 13pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 8pt;
						font-weight: bold;
						}				
						.bordered {
					border: solid 1pt #000000;
										}			
					</style>
			</head>
			<body>
				<div class="page">
					<table border="0">
						<tbody>
							<tr>
								<td align="center" class="bold2" colspan="3" style="width:190mm">
									<xsl:value-of select="ats:Customs/cat_ru:OfficeName"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(наименование таможенного органа)
								</td>
							</tr>
							<tr>
								<td align="center" class="bold" colspan="3" style="width:190mm">
									Акт отбора проб и (или) образцов товаров
								</td>
							</tr>
							<tr>
								<td align="center" class="normal" style="width:50mm">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="ats:Date"/>
									</xsl:call-template>г.
								</td>
								<td style="width:77mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="center" class="normal" style="width:63mm">
									<xsl:value-of select="ats:Number"/>
								</td>
							</tr>
							<xsl:choose>
								<xsl:when test="ats:TakeSample">
									<tr>
										<td align="left" class="normal3" colspan="3" style="width:190mm">
											<xsl:if test="ats:TakeSample">I.
											<xsl:value-of select="ats:TakeSample/cat_ru:PersonPost"/>
												<xsl:text>,</xsl:text>
												<xsl:value-of select="ats:TakeSample/cat_ru:PersonSurname"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:TakeSample/cat_ru:PersonName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:TakeSample/cat_ru:PersonMiddleName"/>
												<xsl:text> </xsl:text>
											</xsl:if>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<tr>
								<td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(должность, фамилия, инициалы должностного лица таможенного органа, отобравшего пробы и (или) образцы товаров)
								</td>
							</tr>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">
										в присутствии:
										</td>
							</tr>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">
										декларанта, иного лица, обладающего полномочиями в отношении товаров, или их представителей, представителя назначенного оператора почтовой связи (при отборе проб и (или) образцов товаров, перемещаемых в международных почтовых отправлениях)
								</td>
							</tr>
							<!--tr>
                        <td align="left" class="normal4" colspan="3" style="width:190mm">
										представителей 
										</td>
                     </tr-->
							<xsl:for-each select="ats:PersonPresent">
								<tr>
									<td align="center" class="normal3" colspan="23" style="width:190mm">
										<xsl:apply-templates select="."/>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства )
								</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">
										понятых: 
										</td>
							</tr>
							<xsl:for-each select="ats:Witness">
								<tr>
									<td align="center" class="normal3" colspan="3" style="width:190mm">
										<xsl:apply-templates select="."/>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства )
								</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">
										иных лиц: 
									</td>
							</tr>
							<xsl:for-each select="ats:OtherParticipant">
								<tr>
									<td align="center" class="normal3" colspan="3" style="width:190mm">
										<xsl:apply-templates select="."/>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства )
								</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">
							с участием:
							</td>
							</tr>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">	
								таможенного эксперта (эксперта):
								</td>
							</tr>
							<xsl:for-each select="ats:Expert">
								<tr>
									<td align="center" class="normal3" colspan="3" style="width:190mm">
										<xsl:apply-templates select="."/>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства )
								</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">	
								специалиста:
								</td>
							</tr>
							<xsl:for-each select="ats:Specialist">
								<tr>
									<td align="center" class="normal3" colspan="3" style="width:190mm">
										<xsl:apply-templates select="."/>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства )
								</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">	
							которому разъяснены его права и обязанности, установленные статьей 346 Таможенного кодекса Евразийского экономического союза, иных лиц:
							</td>
							</tr>
							<xsl:for-each select="ats:OtherSpecialist">
								<tr>
									<td align="center" class="normal3" colspan="3" style="width:190mm">
										<xsl:apply-templates select="."/>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства )
								</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">	
									в соответствии со статьей 393 Таможенного кодекса Евразийского экономического союза произвел отбор проб и (или) образцов товаров из числа
									<span class="normal3">
										<xsl:for-each select="ats:NameObject">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</span>
								</td>
							</tr>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">	
							принадлежащих
							<span class="normal3">
										<xsl:if test="ats:Accessories/ats:AccessoriesOrganization">
											<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:Organization/cat_ru:OrganizationName"/>,
										<xsl:if test="ats:Accessories/ats:AccessoriesOrganization/ats:Organization/cat_ru:RFOrganizationFeatures">
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:Organization/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>, 
												<xsl:text> ИНН </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:Organization/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>, 
												<xsl:text> КПП </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:Organization/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>,
										</xsl:if>
											<xsl:if test="ats:Accessories/ats:AccessoriesOrganization/ats:Organization/cat_ru:RBOrganizationFeatures">
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:Organization/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>,
										</xsl:if>
											<xsl:if test="ats:Accessories/ats:AccessoriesOrganization/ats:Organization/cat_ru:RKOrganizationFeatures">
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:Organization/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:Organization/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:Organization/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:Organization/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:Organization/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:Organization/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>,
										</xsl:if>
											<br/>
											<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:OrganizationPerson/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:OrganizationPerson/cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:OrganizationPerson/cat_ru:PersonMiddleName"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
											<xsl:if test="ats:Accessories/ats:AccessoriesOrganization/ats:LegalAddress">
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:LegalAddress/cat_ru:PostalCode"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:LegalAddress/cat_ru:CountryCode"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:LegalAddress/cat_ru:CounryName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:LegalAddress/cat_ru:Region"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:LegalAddress/cat_ru:City"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesOrganization/ats:LegalAddress/cat_ru:StreetHouse"/>
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="ats:Accessories/ats:AccessoriesPerson">
											<xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/cat_ru:PersonMiddleName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/ats:YearBirth"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/ats:BirthPlace"/>
											<xsl:text> </xsl:text>
											<xsl:if test="ats:Accessories/ats:AccessoriesPerson/ats:IdentityCard">
												<xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/ats:IdentityCard/cat_ru:IdentityCardName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/ats:IdentityCard/cat_ru:IdentityCardSeries"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/ats:IdentityCard/cat_ru:IdentityCardNumber"/>
												<xsl:text> </xsl:text>
												<!--xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/ats:IdentityCard/cat_ru:RBIdentificationNumber"/-->
											</xsl:if>
											<xsl:if test="ats:Accessories/ats:AccessoriesPerson/ats:Address">
												<xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/ats:Address/cat_ru:PostalCode"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/ats:Address/cat_ru:CountryCode"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/ats:Address/cat_ru:CounryName"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/ats:Address/cat_ru:Region"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/ats:Address/cat_ru:City"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="ats:Accessories/ats:AccessoriesPerson/ats:Address/cat_ru:StreetHouse"/>
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(указать полное наименование организации, обладающей полномочиями в отношении товаров, его представителя, место нахождения; для физического лица - фамилия, инициалы, год и место рождения, наименование и номер документа, удостоверяющего личность, место жительства )
								</td>
							</tr>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">	
							находившихся
						<span class="normal3">
										<xsl:value-of select="ats:Accessories/ats:LocationObject"/>
									</span>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(на складе временного хранения, в ручной клади, багаже, почтовом отправлении №, вагоне и т.д.)
								</td>
							</tr>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">	
							перемещаемых (перемещенных) из
						<span class="normal3">
										<xsl:value-of select="ats:Accessories/ats:Departure"/>
									</span> в <span class="normal3">
										<xsl:value-of select="ats:Accessories/ats:Arrival"/>
									</span>,
							</td>
							</tr>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">	
							и представленных
						<span class="normal3">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="ats:DatePresentation"/>
										</xsl:call-template>
									</span> к таможенному контролю, о чем составлен настоящий акт. 
							</td>
							</tr>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">	
							II. Перед началом отбора проб и (или) образцов товаров лицам, указанными в разделе I, должностным лицом таможенного органа разъяснено их право присутствовать при всех действиях, проводимых при отборе проб и (или) образцов товаров, и делать заявления, давать пояснения, подлежащие внесению в акт.
							</td>
							</tr>
							<xsl:for-each select="ats:PersonPresent">
								<tr>
									<td align="left" class="normal3" style="width:50mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="normal3" style="width:77mm">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" style="width:50mm">
								(подпись)
								</td>
									<td align="center" class="graphLittle" style="width:77mm">
								(фамилия, инициалы)
								</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ats:Witness">
								<tr>
									<td align="left" class="normal3" style="width:50mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="normal3" style="width:77mm">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" style="width:50mm">
								(подпись)
								</td>
									<td align="center" class="graphLittle" style="width:77mm">
								(фамилия, инициалы)
								</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ats:OtherParticipant">
								<tr>
									<td align="left" class="normal3" style="width:50mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="normal3" style="width:77mm">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" style="width:50mm">
								(подпись)
								</td>
									<td align="center" class="graphLittle" style="width:77mm">
								(фамилия, инициалы)
								</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ats:Expert">
								<tr>
									<td align="left" class="normal3" style="width:50mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="normal3" style="width:77mm">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" style="width:50mm">
								(подпись)
								</td>
									<td align="center" class="graphLittle" style="width:77mm">
								(фамилия, инициалы)
								</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ats:Specialist">
								<tr>
									<td align="left" class="normal3" style="width:50mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="normal3" style="width:77mm">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" style="width:50mm">
								(подпись)
								</td>
									<td align="center" class="graphLittle" style="width:77mm">
								(фамилия, инициалы)
								</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ats:OtherSpecialist">
								<tr>
									<td align="left" class="normal3" style="width:50mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="normal3" style="width:77mm">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" style="width:50mm">
								(подпись)
								</td>
									<td align="center" class="graphLittle" style="width:77mm">
								(фамилия, инициалы)
								</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ats:Accessories/ats:AccessoriesOrganization/ats:OrganizationPerson">
								<tr>
									<td align="left" class="normal3" style="width:50mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="normal3" style="width:77mm">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" style="width:50mm">
								(подпись)
								</td>
									<td align="center" class="graphLittle" style="width:77mm">
								(фамилия, инициалы)
								</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ats:Accessories/ats:AccessoriesPerson">
								<tr>
									<td align="left" class="normal3" style="width:50mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="normal3" style="width:77mm">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" style="width:50mm">
								(подпись)
								</td>
									<td align="center" class="graphLittle" style="width:77mm">
								(фамилия, инициалы)
								</td>
									<td style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">	
							III. Отбор проб и (или) образцов товаров проводился в условиях
							</td>
							</tr>
							<tr align="center">
								<td align="center " class="normal3" colspan="3" style="width:190mm">
									<xsl:value-of select="ats:TermsThievingSampling/ats:Weather"/> и  
							<xsl:if test="ats:TermsThievingSampling/ats:Light= '1'">
							естественном освещении
							</xsl:if>
									<xsl:if test="ats:TermsThievingSampling/ats:Light= '0'">
							искусственном освещении
							</xsl:if>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(пасмурной, солнечной погоды и т.д.)          (естественном, искусственном освещении)
							</td>
							</tr>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">	
							по адресу: <span class="normal3">
										<xsl:if test="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:WarehousePlace">
											<!--xsl:choose>
                                    <xsl:when test="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:WarehousePlace/catESAD_ru:DocumentModeCode = '1'">
									Лицензия
									</xsl:when>
                                    <xsl:otherwise>
									Свидетельство
									</xsl:otherwise>
                                 </xsl:choose-->
								№  <xsl:value-of select="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:WarehousePlace/catESAD_ru:CertificateNumber"/>
											<xsl:value-of select="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:WarehousePlace/catESAD_ru:CustomsOfficeID"/>
									дата выдачи
									<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:WarehousePlace/catESAD_ru:CertificateDate"/>
											</xsl:call-template>г.
										</xsl:if>
										<xsl:value-of select="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:GoodsLocationPlace/catESAD_ru:GoodsLocationPlaceDesc"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:GoodsLocationPlace/catESAD_ru:CustomsOfficeID"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:GoodsLocationPlace/catESAD_ru:RailwayStationCode"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:GoodsLocationPlace/catESAD_ru:RailwayStationName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:GoodsLocationPlace/catESAD_ru:Address/cat_ru:PostalCode"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:GoodsLocationPlace/catESAD_ru:Address/cat_ru:CountryCode"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:GoodsLocationPlace/catESAD_ru:Address/cat_ru:CounryName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:GoodsLocationPlace/catESAD_ru:Address/cat_ru:Region"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:GoodsLocationPlace/catESAD_ru:Address/cat_ru:City"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ats:TermsThievingSampling/ats:AddressThievingSampling/ats:GoodsLocationPlace/catESAD_ru:Address/cat_ru:StreetHouse"/>
									</span>
								</td>
							</tr>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">	
									При отборе проб и (или) образцов товаров применялись технические средства:
								</td>
							</tr>
							<tr>
								<td align="left" class="normal3" colspan="3" style="width:190mm">
									<xsl:for-each select="ats:TermsThievingSampling/ats:Arrangement">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td align="left" class="normal4" colspan="3" style="width:190mm">	
							IV. По настоящему акту в качестве 
						<span class="normal3">
										<xsl:choose>
											<xsl:when test="ats:TermsThievingSampling/ats:Sample= '1'"> пробы</xsl:when>
											<xsl:otherwise> образцы товаров</xsl:otherwise>
										</xsl:choose>
									</span>
									<br/> отобраны:
									
							</td>
							</tr>
						</tbody>
					</table>
					<table border="1" cellspacing="0" style="width:190mm">
						<tbody>
							<tr>
								<td align="center" class="graphMain" style="width:10mm">№ п/п</td>
								<td align="center" class="graphMain" style="width:100mm"> Наименование, индивидуальные признаки объектов, отобранных в качестве проб и (или) образцов товаров&lt;*&gt;</td>
								<td align="center" class="graphMain" style="width:40mm">Количество, вес</td>
								<td align="center" class="graphMain" style="width:40mm">Стоимость</td>
							</tr>
							<xsl:for-each select="ats:InfoObject">
								<tr>
									<td align="center" class="graphMain" style="width:10mm">
										<xsl:value-of select="ats:Position"/>
									</td>
									<td align="center" class="graphMain" style="width:100mm">
										<xsl:apply-templates select="ats:NameOdject"/>
									</td>
									<td align="center" class="graphMain" style="width:40mm">
										<xsl:value-of select="ats:QuantityWeight"/>
										<xsl:if test="ats:Unit">
											<xsl:text> (</xsl:text>
											<xsl:value-of select="ats:Unit"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</td>
									<td align="center" class="graphMain" style="width:40mm">
										<xsl:value-of select="ats:Cost"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ats:Currency"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<table style="width:190mm">
						<tbody>
							<tr>
								<td class="normal3" style="width:190mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:for-each select="ats:Application">
										<xsl:value-of select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" style="width:190mm">
								(если есть приложения, указать)
							</td>
							</tr>
							<tr>
								<td class="normal4" style="width:190mm">
									Отобранные пробы и (или) образцы товаров&#160;
									<span class="normal3">
										<xsl:for-each select="ats:DescriptionSample">
											<xsl:choose>
												<xsl:when test="ats:Danger= 'true' or ats:Danger= 't' or ats:Danger= '1'"> являются опасными</xsl:when>
												<xsl:otherwise>не являются опасными</xsl:otherwise>
											</xsl:choose>
											<xsl:text>, </xsl:text>
											<xsl:choose>
												<xsl:when test="ats:Perishable= 'true' or ats:Perishable= 't' or ats:Perishable= '1'">являются подвергающимися быстрой порче</xsl:when>
												<xsl:otherwise>не являются подвергающимися быстрой порче</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
									</span>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" style="width:190mm">
								(являются/не являются опасными, подвергающимися быстрой порче,
							</td>
							</tr>
							<tr>
								<td class="normal3" style="width:190mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="ats:DescriptionSample/ats:DangerKind"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="ats:DescriptionSample/ats:PeriodStorage"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="ats:DescriptionSample/ats:StorageConditions"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" style="width:190mm">
									если опасность существует - указать вид опасности, для товаров, подвергающихся быстрой порче, – указать сроки и условия хранения)
								</td>
							</tr>
							<tr>
								<td class="normal4" style="width:190mm">
									V. Отобранные пробы и (или) образцы товаров упакованы 
									<span class="normal3">
										<xsl:value-of select="ats:Packing/ats:KindPacking"/>
									</span>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" style="width:190mm">
								(вид упаковки, пояснительные надписи, заверенные
							</td>
							</tr>
							<tr>
								<td class="normal3" style="width:190mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="ats:Packing/ats:ExplanatoryLabels"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" style="width:190mm">
								декларантом, иным лицом, обладающим полномочиями в отношении товаров, или их представителями, представителем назначенного оператора почтовой связи (при отборе проб и (или) образцов товаров, перемещаемых в международных почтовых отправлениях), понятыми, специалистом, таможенным экспертом (экспертом), должностным лицом таможенного органа, производившим отбор проб и (или) образцов товаров)
							</td>
							</tr>
							<tr>
								<td class="normal3" style="width:190mm">
									<xsl:value-of select="ats:Packing/ats:NumberSeal"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" style="width:190mm">
								(номер пломбы (если применяется при упаковке проб и (или) образцов товаров))
							</td>
							</tr>
							<tr>
								<td class="graphLittle" style="width:190mm">
						_______________________________________ <br/>
						* Описание товара, внешний вид, фирменный знак, клемо изготовителя и страны изготовления.	
							
							</td>
							</tr>
							<tr>
								<td class="normal4" style="width:190mm">
							VI. Заявления, замечания присутствующих лиц:
							</td>
							</tr>
							<xsl:for-each select="ats:Observation">
								<tr>
									<td class="normal3" style="width:190mm">
										<xsl:value-of select="ats:ObservationContents"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ats:PersonSignatureObservation/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ats:PersonSignatureObservation/cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ats:PersonSignatureObservation/cat_ru:PersonMiddleName"/>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td align="center" class="graphLittle" style="width:190mm">
								(указать содержание и фамилию, инициалы лица, сделавшего заявление или замечание, если есть приложение - указать)
								</td>
							</tr>
							<tr>
								<td class="graphMain" style="width:190mm">
								Акт прочитан. Записано правильно.
								</td>
							</tr>
						</tbody>
					</table>
					<table style="width:190mm">
						<tbody>
							<tr>
								<td class="normal4" colspan="3" style="width:190mm">	
							Понятые
							</td>
							</tr>
							<xsl:for-each select="ats:Witness">
								<tr>
									<td class="normal3" style="width:64mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="normal3" style="width:63mm">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</td>
									<td class="normal4" style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" style="width:64mm">
								(подпись)
								</td>
									<td align="center" class="graphLittle" style="width:63mm">
								(фамилия, инициалы)
								</td>
									<td class="normal4" style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td class="normal4" colspan="3" style="width:190mm">	
							Присутствующие (участвующие) лица:
							</td>
							</tr>
							<xsl:for-each select="ats:PersonPresent">
								<tr>
									<td class="normal3" style="width:64mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="normal3" style="width:63mm">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</td>
									<td class="normal4" style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" style="width:64mm">
								(подпись)
								</td>
									<td align="center" class="graphLittle" style="width:63mm">
								(фамилия, инициалы)
								</td>
									<td class="normal4" style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ats:OtherParticipant">
								<tr>
									<td align="center" class="normal3" style="width:64mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="normal3" style="width:63mm">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</td>
									<td class="normal4" style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" style="width:64mm">
								(подпись)
								</td>
									<td align="center" class="graphLittle" style="width:63mm">
								(фамилия, инициалы)
								</td>
									<td class="normal4" style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ats:Expert">
								<tr>
									<td class="normal3" style="width:64mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="normal3" style="width:63mm">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</td>
									<td class="normal4" style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" style="width:64mm">
								(подпись)
								</td>
									<td align="center" class="graphLittle" style="width:63mm">
								(фамилия, инициалы)
								</td>
									<td class="normal4" style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ats:Specialist">
								<tr>
									<td class="normal3" style="width:64mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="normal3" style="width:63mm">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</td>
									<td class="normal4" style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" style="width:64mm">
								(подпись)
								</td>
									<td align="center" class="graphLittle" style="width:63mm">
								(фамилия, инициалы)
								</td>
									<td class="normal4" style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ats:OtherSpecialist">
								<tr>
									<td class="normal3" style="width:64mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
									<td align="center" class="normal3" style="width:63mm">
										<xsl:value-of select="cat_ru:PersonSurname"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="cat_ru:PersonName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</td>
									<td class="normal4" style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphLittle" style="width:64mm">
								(подпись)
								</td>
									<td align="center" class="graphLittle" style="width:63mm">
								(фамилия, инициалы)
								</td>
									<td class="normal4" style="width:63mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td class="normal4" colspan="3" style="width:190mm">	
							Акт составил
							<span class="normal3">
										<xsl:value-of select="ats:PersonSignatureAuthorAct/cat_ru:PersonPost"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="ats:PersonSignatureAuthorAct/cat_ru:PersonSurname"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="ats:PersonSignatureAuthorAct/cat_ru:PersonName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="ats:PersonSignatureAuthorAct/cat_ru:PersonMiddleName"/>
									</span>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(должность, фамилия, инициалы должностного лица таможенного органа)
								</td>
							</tr>
							<tr>
								<td class="normal3" colspan="3" style="width:190mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle" colspan="3" style="width:190mm">
								(подпись должностного лица таможенного органа)
								</td>
							</tr>
							<tr>
								<td class="normal4" colspan="2" style="width:127mm">	
							Копию настоящего акта получил
							<span class="normal3">
										<xsl:value-of select="ats:CopyReceived/cat_ru:PersonSurname"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="ats:CopyReceived/cat_ru:PersonName"/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
										<xsl:value-of select="ats:CopyReceived/cat_ru:PersonMiddleName"/>
									</span>
								</td>
								<td class="normal3" style="width:63mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<tr>
									<td align="center" class="graphLittle" colspan="2" style="width:127mm">
								(фамилия,  инициалы)
								</td>
									<td align="center" class="graphLittle" style="width:63mm">
								(подпись)
								</td>
								</tr>
								<tr>
									<td align="center" class="normal3" style="width:64mm">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="ats:DateTakeDuplicateAct"/>
										</xsl:call-template>г.
							</td>
									<td class="normal4" colspan="2" style="width:126mm">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<td align="center" class="graphLittle" style="width:64mm">
								(дата получения копии акта)
								</td>
								<td align="center" class="graphLittle" colspan="2" style="width:126mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ats:PersonInfoType -->
	<xsl:template match="ats:PersonPresent | ats:Witness | ats:OtherParticipant | ats:Expert | ats:Specialist | ats:OtherSpecialist">
		<xsl:if test="ats:PlaceEmployment/cat_ru:OrganizationName">
			<xsl:value-of select="ats:PlaceEmployment/cat_ru:OrganizationName"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="ats:PlaceEmployment/cat_ru:RFOrganizationFeatures">
			<xsl:value-of select="ats:PlaceEmployment/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="ats:PlaceEmployment/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="ats:PlaceEmployment/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>,
			</xsl:if>
		<xsl:if test="ats:PlaceEmployment/cat_ru:RBOrganizationFeatures">
			<xsl:value-of select="ats:PlaceEmployment/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>,
			</xsl:if>
		<xsl:if test="ats:PlaceEmployment/cat_ru:RKOrganizationFeatures">
			<xsl:value-of select="ats:PlaceEmployment/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="ats:PlaceEmployment/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="ats:PlaceEmployment/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>
			<xsl:value-of select="ats:PlaceEmployment/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>
			<xsl:value-of select="ats:PlaceEmployment/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>
			<xsl:value-of select="ats:PlaceEmployment/cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>,
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="ats:IdentityCard">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="ats:IdentityCard/cat_ru:IdentityCardName"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="ats:IdentityCard/cat_ru:IdentityCardSeries"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="ats:IdentityCard/cat_ru:IdentityCardNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="ats:AddressWitness">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="ats:AddressWitness/cat_ru:PostalCode"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="ats:AddressWitness/cat_ru:CountryCode"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="ats:AddressWitness/cat_ru:CounryName"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="ats:AddressWitness/cat_ru:Region"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="ats:AddressWitness/cat_ru:City"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="ats:AddressWitness/cat_ru:StreetHouse"/>
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
