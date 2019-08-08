<?xml version="1.0" encoding="utf-8"?>
<!--
Письмо ФТС России от 27.09.2018 № 01-54/61519 "О направлении проекта приказа ФТС России" (Приложение 16)
Приказ ФТС России "Об утверждении форм документов, применяемых при проведении таможенных проверок, порядков их заполнения и 
порядка внесения изменений (дополнений) в решение о проведении выездной таможенной проверки"
Приложение 16 Акт о возврате изъятых документов
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.0" xmlns:arsd="urn:customs.ru:Information:CustomsAuditDocuments:ActReSeizureDocs:5.14.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0">
	<!-- Шаблон для типа ActReSeizureDocsType -->
	<xsl:template match="arsd:ActReSeizureDocs">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div.page {
					width: 210mm;
					max-width: 210mm;
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
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					.inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
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
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ<br/>(МИНФИН РОССИИ)<br/>
										<br/>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА<br/>
									</font>
								</td>
							</tr>
							<tr>
								<td class="value" align="center">
									<xsl:value-of select="arsd:CustomActArresting/cat_ru:OfficeName"/>
									<xsl:if test="arsd:CustomActArresting/cat_ru:OfficeName and arsd:CustomActArresting/cat_ru:Code">
										<xsl:text> (</xsl:text>
									</xsl:if>
									<xsl:value-of select="arsd:CustomActArresting/cat_ru:Code"/>
									<xsl:if test="arsd:CustomActArresting/cat_ru:OfficeName and arsd:CustomActArresting/cat_ru:Code">
										<xsl:text>)</xsl:text>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="descr">(наименование таможенного органа)</td>
							</tr>
							<tr align="center" valign="top">
								<td>
									<br/>
									<br/>
									<b>АКТ</b>
									<br/>о возврате изъятых документов
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr valign="bottom" align="center">
												<td width="20%" class="value">
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="arsd:ActDate"/>
													</xsl:call-template>
												</td>
												<td/>
												<td width="20%" class="value">
													<xsl:value-of select="arsd:ActPlace"/>
												</td>
											</tr>
											<tr>
												<td class="descr"><!--(дата)--></td>
												<td/>
												<td class="descr">(место составления)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>	
							<tr>
								<td>
									<xsl:text>Должностным лицом (должностными лицами) </xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:for-each select="arsd:ApproverPersonInfo">
												<xsl:apply-templates mode="person" select="arsd:ApproverPerson"/>
												<xsl:if test="position()!=last()"><xsl:text>; </xsl:text></xsl:if>
											</xsl:for-each>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (отчество указывается при наличии) должностного лица таможенного органа, составившего акт)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>на основании постановления о возврате изъятых документов </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="person" select="arsd:ResolutionInfo/adt_cat:CustomsIssued/adt_cat:ApproverPerson"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<!--xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (отчество указывается при наличии) лица, вынесшего постановление)'"/-->
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:text> от  </xsl:text>
									<xsl:call-template name="russian_date_month"><xsl:with-param name="dateIn" select="arsd:ResolutionInfo/adt_cat:CustomsIssued/adt_cat:ApproverPerson/cat_ru:IssueDate"/></xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>проверяемому лицу (либо его представителю): </xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="ResponsiblePerson" select="arsd:InspectedPerson"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>переданы документы: </xsl:text>
								</td>
							</tr>
							<tr>
								<table>
									<tbody>
										<tr>
											<td class="value" width="99%">
												<xsl:for-each select="arsd:DocsInfo">
													<xsl:value-of select="position()"/>
													<xsl:text>) </xsl:text>
													<xsl:for-each select="arsd:DocsInfo">
														<xsl:apply-templates mode="document" select="."/>
														<xsl:if test="position()!=last()">; </xsl:if>
													</xsl:for-each>
													<xsl:if test="arsd:InventorySheetNumber">
														<xsl:text>Опись на </xsl:text>
														<xsl:value-of select="arsd:InventorySheetNumber"/>
														<xsl:text> листах</xsl:text>
													</xsl:if>
													<xsl:if test="position()!=last()"><br/></xsl:if>
												</xsl:for-each>
											</td>
											<td valign="bottom" align="right" width="1%">,</td>
										</tr>
									</tbody>
								</table>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>изъятые по акту</xsl:text>
									<xsl:if test="arsd:ResolutionInfo/adt_cat:Date">
										<xsl:text> от </xsl:text>
										<u><xsl:call-template name="russian_date_month"><xsl:with-param name="dateIn" select="arsd:ResolutionInfo/adt_cat:Date"/></xsl:call-template></u>
									</xsl:if>
									<!--xsl:if test="arsd:ResolutionInfo/adt_cat:Number">
										<xsl:text> № </xsl:text>
										<u><xsl:value-of select="arsd:ResolutionInfo/adt_cat:Number"/></u>
									</xsl:if-->
									<xsl:text>, копия акта изъятия документов на </xsl:text>
									<u>&#160;&#160;<xsl:value-of select="arsd:ActSeizureDocs/arsd:SheetNumber"/>&#160;&#160;</u>
									листах прилагается.
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Замечания: </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="arsd:Comment"><xsl:apply-templates select="arsd:Comment"/></xsl:when>
												<xsl:otherwise><xsl:text>  замечания отсутствуют</xsl:text></xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(содержание замечаний лиц, участвовавших при возврате документов)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:for-each select="arsd:CommentPerson">
										<xsl:call-template name="signature">
											<xsl:with-param name="data" select="."/>
											<xsl:with-param name="descr" select="'(должность, фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества)'"/>
										</xsl:call-template>
									</xsl:for-each>	
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Документы передал:</xsl:text>
									<xsl:call-template name="signature">
										<xsl:with-param name="data" select="arsd:ApproverPersonInfo[1]/arsd:ApproverPerson"/>
									</xsl:call-template>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="value">
									<br/>
									<xsl:text>Документы принял:</xsl:text><br/>
									<xsl:apply-templates mode="AccepedDocs" select="arsd:AccepedDocs"/>
								</td>
							</tr>
						</tbody>
					</table>		
					<table>	
						<tbody>
							<tr>
								<td>
									<br/>
									<xsl:text>Второй экземпляр настоящего акта получил:</xsl:text>
									<xsl:apply-templates mode="SecondExempReceived" select="arsd:SecondExempReceived"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<u>
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="arsd:SecondExempReceived/adt_cat:Date"/>
										</xsl:call-template>
									</u>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="document" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="arsd:DocsDescription"/>
		<xsl:text> </xsl:text>
		<xsl:if test="arsd:DocsQuantity">
			<xsl:text>, кол-во: </xsl:text>
			<xsl:value-of select="arsd:DocsQuantity"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="quantity" match="*">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="signature2ndCopy" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="35%" class="value">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td></td>
					<td width="20%" class="value">
					</td>
					<td/>
					<td width="35%" class="value">
						<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName|cat_ru:OrganizationName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr valign="top">
					<td class="descr">(должность)</td>
					<td></td>
					<td class="descr">(подпись)</td>
					<td/>
					<td class="descr">(фамилия, инициалы имени и<br/>отчества (инициал отчества<br/>указывается при наличии отчества)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="signature">
		<xsl:param name="data"/>
		<xsl:param name="descr"/>
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="70%" class="value">
						<xsl:apply-templates mode="person" select="$data"/>
					</td>
					<td/>
					<td width="25%" class="value"></td>
				</tr>
				<tr valign="top">
					<td class="descr"><xsl:value-of select="$descr"/></td>
					<td/>
					<td class="descr">(подпись)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="signature" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="35%"></td>
					<td></td>
					<td width="20%" class="value">
					</td>
					<td/>
					<td width="35%" class="value">
						<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName|cat_ru:OrganizationName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr valign="top">
					<td></td>
					<td></td>
					<td class="descr">(подпись)</td>
					<td/>
					<td class="descr">(фамилия, инициалы имени и<br/>отчества (инициал отчества<br/>указывается при наличии отчества)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="person_nopost" match="*">
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="person" match="*">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="organization">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:PersonId"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="details" select="RUScat_ru:CommunicationDetails"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="adt_cat:FactAddress">
			<xsl:text> факт. адрес: </xsl:text>
			<xsl:apply-templates select="adt_cat:FactAddress" mode="address"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="ResponsiblePerson">
		<xsl:if test="adt_cat:ResponsiblePerson/cat_ru:PersonPost">
			<xsl:value-of select="adt_cat:ResponsiblePerson/cat_ru:PersonPost"/>
			<xsl:text>, </xsl:text>
		</xsl:if>	
		<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
			<xsl:text>организация: </xsl:text>
			<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
				<xsl:value-of select="cat_ru:ShortName"/>
			</xsl:if>
			<xsl:text>, </xsl:text>
		</xsl:if>	
		<xsl:value-of select="adt_cat:ResponsiblePerson/cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="adt_cat:ResponsiblePerson/cat_ru:PersonName"/>
		<xsl:if test="adt_cat:ResponsiblePerson/cat_ru:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="adt_cat:ResponsiblePerson/cat_ru:PersonMiddleName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="adt_cat:AuthoritesDocument">
			<xsl:text>, документ, удостоверяющий полномочия: </xsl:text>
			<xsl:apply-templates mode="document" select="adt_cat:AuthoritesDocument"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="AccepedDocs">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="70%" class="value">
						<xsl:if test="cat_ru:PersonPost">
							<xsl:value-of select="cat_ru:PersonPost"/>
							<xsl:text>, </xsl:text>
						</xsl:if>	
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:if test="cat_ru:PersonMiddleName">
							<xsl:text> </xsl:text>
							<xsl:value-of select="cat_ru:PersonMiddleName"/>
						</xsl:if>
						<xsl:if test="adt_cat:IdentityCard">
							<xsl:text>, </xsl:text>
							<xsl:apply-templates mode="identity" select="adt_cat:IdentityCard"/>
						</xsl:if>
						<xsl:if test="adt_cat:AuthoritesDocument">
							<xsl:text>, документ, удостоверяющий полномочия: </xsl:text>
							<xsl:apply-templates mode="document" select="adt_cat:AuthoritesDocument"/>
						</xsl:if>
					</td>
					<td/>
					<td width="25%" class="value"></td>
				</tr>
				<tr valign="top">
					<td/>
					<td/>
					<td class="descr">(подпись)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="SecondExempReceived">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="70%" class="value">
						<xsl:apply-templates mode="person_nopost" select="."/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates mode="identity" select="adt_cat:Passport"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates mode="document" select="adt_cat:AuthoritesDocument"/>
					</td>
					<td/>
					<td width="25%" class="value"></td>
				</tr>
				<tr valign="top">
					<td class="descr">(должность, фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) лица, получившего второй экземпляр акта)</td>
					<td/>
					<td class="descr">(подпись)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template mode="details" match="*">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> т.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:for-each select="RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="month">
		<xsl:param name="number"/>
		<xsl:if test="$number='01'">января</xsl:if>
		<xsl:if test="$number='02'">февраля</xsl:if>
		<xsl:if test="$number='03'">марта</xsl:if>
		<xsl:if test="$number='04'">апреля</xsl:if>
		<xsl:if test="$number='05'">мая</xsl:if>
		<xsl:if test="$number='06'">июня</xsl:if>
		<xsl:if test="$number='07'">июля</xsl:if>
		<xsl:if test="$number='08'">августа</xsl:if>
		<xsl:if test="$number='09'">сентября</xsl:if>
		<xsl:if test="$number='10'">октября</xsl:if>
		<xsl:if test="$number='11'">ноября</xsl:if>
		<xsl:if test="$number='12'">декабря</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:call-template name="month"><xsl:with-param name="number" select="substring($dateIn,6,2)"/></xsl:call-template> 
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> г.</xsl:text>
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
