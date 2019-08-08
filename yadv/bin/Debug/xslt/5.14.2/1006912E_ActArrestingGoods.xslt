<?xml version="1.0" encoding="utf-8"?>
<!-- 
Письмо ФТС России от 27.09.2018 № 01-54/61519 "О направлении проекта приказа ФТС России" (Приложение 8)
Приказ ФТС России "Об утверждении форм документов, применяемых при проведении таможенных проверок, порядков их заполнения и 
порядка внесения изменений (дополнений) в решение о проведении выездной таможенной проверки"
Приложение 8 Акт о наложении ареста на товары
  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.0" xmlns:aag="urn:customs.ru:Information:CustomsAuditDocuments:ActArrestingGoods:5.14.0">
	<!-- Шаблон для типа ActArrestingGoodsType -->
	<xsl:template match="aag:ActArrestingGoods">
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
									<xsl:value-of select="aag:CustomActArresting/cat_ru:OfficeName"/>
									<xsl:if test="aag:CustomActArresting/cat_ru:OfficeName and aag:CustomActArresting/cat_ru:Code">
										<xsl:text> (</xsl:text>
									</xsl:if>
									<xsl:value-of select="aag:CustomActArresting/cat_ru:Code"/>
									<xsl:if test="aag:CustomActArresting/cat_ru:OfficeName and aag:CustomActArresting/cat_ru:Code">
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
									<br/>о наложении ареста на товары
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr valign="bottom" align="center">
												<td width="20%" class="value">
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="aag:ActDate"/>
													</xsl:call-template>
												</td>
												<td/>
												<td width="20%" class="value">
													<xsl:value-of select="aag:ActPlace"/>
												</td>
											</tr>
											<tr>
												<td class="descr">(дата)</td>
												<td/>
												<td class="descr">(место составления)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
									<xsl:text>Арест товаров начат: </xsl:text>
									<u>&#160;<xsl:value-of select="substring(aag:ActTimeBegin, 1, 5)"/>&#160;</u>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Арест товаров окончен: </xsl:text>
									<u>&#160;<xsl:value-of select="substring(aag:ActTimeEnd, 1, 5)"/>&#160;</u>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Должностное лицо таможенного органа:</xsl:text>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="person" select="aag:CustomActArresting/adt_cat:ApproverPerson"/>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
										<xsl:with-param name="comma" select="1"/>
									</xsl:call-template>
									<xsl:text>руководствуясь подпунктом 6 пункта 2 статьи 335 Таможенного кодекса Евразийского экономического союза, а также статьей 233 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации» и на основании постановления о наложении ареста на товары</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="person" select="aag:ResolutionInfo/adt_cat:CustomsIssued/adt_cat:ApproverPerson"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (отчество указывается при наличии) лица, вынесшего постановление о наложении ареста на товары)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:text>от </xsl:text><u>&#160;
									<xsl:call-template name="russian_date_month"><xsl:with-param name="dateIn" select="aag:ResolutionInfo/adt_cat:Date"/></xsl:call-template>
									&#160;</u>&#160;
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>в присутствии:</xsl:text>
									<br/>
									<xsl:text>лица, у которого обнаружены товары, либо его представителя:</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="aag:PersonOwnGoods/cat_ru:OrganizationName"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="person" select="aag:PersonOwnGoods/adt_cat:ResponsiblePerson"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="identity" select="aag:PersonOwnGoods/RUScat_ru:IdentityCard"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="document" select="aag:PersonOwnGoods/adt_cat:AuthoritesDocument"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>понятых:</xsl:text>
									<xsl:for-each select="aag:Witnesses">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="position()"/>
												<xsl:text>. </xsl:text>
												<xsl:apply-templates mode="person" select="."/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates mode="identity" select="./adt_cat:Passport"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates mode="address" select="./adt_cat:ResidencePlace"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность, место жительства)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>иных лиц, участвующих в наложении ареста на товары:</xsl:text>
									<xsl:for-each select="aag:OtherPersons">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="position()"/>
												<xsl:text>. </xsl:text>
												<xsl:value-of select="adt_cat:Job"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates mode="person" select="."/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates mode="identity" select="adt_cat:IdentityCard"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'(место работы, должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность)'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>с участием специалиста:</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="aag:Specialist/adt_cat:Job"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="person" select="aag:Specialist"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="identity" select="aag:Specialist/adt_cat:IdentityCard"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(место работы, должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность)'"/>
										<xsl:with-param name="width" select="'100%'"/>
										<xsl:with-param name="comma" select="1"/>
									</xsl:call-template>
									<xsl:text>которому разъяснены его права и обязанности, установленные статьей 346 Таможенного кодекса Евразийского экономического союза,</xsl:text>
									<br/>
									<xsl:text>наложен арест на следующие товары:</xsl:text>
									<br/>
									<xsl:for-each select="aag:GoodsInfo/aag:Goods">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
											<xsl:value-of select="position()"/>
											<xsl:text>) </xsl:text>
											<xsl:apply-templates select="aag:GoodsDescription"/>
											<xsl:if test="aag:GoodsQuantity">
												<xsl:text>; кол-во: </xsl:text>
												<xsl:apply-templates mode="quantity" select="aag:GoodsQuantity"/>
											</xsl:if>
											<xsl:if test="aag:GoodsCharacteristics">
												<xsl:text>; индивидуальные признаки: </xsl:text>
												<xsl:apply-templates select="aag:GoodsCharacteristics"/>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									</xsl:for-each>
									<xsl:if test="aag:GoodsInfo/aag:FixInfo">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:text>Сведения о применении способов фиксации: </xsl:text>
												<xsl:apply-templates select="aag:GoodsInfo/aag:FixInfo"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Средства идентификации:</xsl:text><br/>
									<xsl:for-each select="aag:Seal">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="aag:IdentNumber"/>
												<xsl:text> </xsl:text>
												<xsl:choose>
													<xsl:when test="aag:IdentKind=1">пломба</xsl:when>
													<xsl:when test="aag:IdentKind=2">печать</xsl:when>
													<xsl:when test="aag:IdentKind=3">иное</xsl:when>
												</xsl:choose>
												<xsl:if test="aag:IdentDesc">
													<xsl:text>; прим.: </xsl:text>
													<xsl:value-of select="aag:IdentDesc"/>
												</xsl:if>
												<xsl:if test="aag:Quantity">
													<xsl:text>; кол-во: </xsl:text>
													<xsl:value-of select="aag:Quantity"/>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Товары переданы на хранение </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="organization" select="aag:PersonStorGoods"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:if test="aag:StoragePlace">
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:text>Место хранения: </xsl:text>
												<xsl:apply-templates mode="address" select="aag:StoragePlace"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Лицу, которому товары переданы на хранение, объявлено о запрете распоряжаться и пользоваться товарами без разрешения таможенного органа и оглашены положения части 3 статьи 233 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации»</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data" select="' '"/>
										<xsl:with-param name="description" select="'(подпись представителя указанного лица)'"/>
										<xsl:with-param name="width" select="'50%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>Замечания: </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="aag:PersonsNotesInfo"><xsl:apply-templates select="aag:PersonsNotesInfo"/></xsl:when>
												<xsl:otherwise>  замечания отсутствуют</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(содержание замечаний лиц, участвовавших в производстве ареста или присутствовавших при его проведении, либо указание на отсутствие замечаний)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									Приложение <span class="value">&#160;<xsl:value-of select="aag:AdditionalName"/>&#160;</span> на <span class="value">&#160;<xsl:value-of select="aag:AdditionalSheetNumber"/>&#160;</span> листах.
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									Лицо, у которого обнаружены товары, на которые налагается арест<br/>(его представитель):
									<xsl:apply-templates mode="signature" select="aag:PersonOwnGoods/adt_cat:ResponsiblePerson"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									Понятые:
									<xsl:apply-templates mode="signature" select="aag:Witnesses"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									Иные присутствующие лица:
									<xsl:apply-templates mode="signature" select="aag:OtherPersons"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									Специалист:
									<xsl:apply-templates mode="signature" select="aag:Specialist"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									Акт составил:
									<xsl:apply-templates mode="signature" select="aag:CustomActArresting/adt_cat:ApproverPerson"/>
								</td>
							</tr>
							<xsl:if test="aag:RefusalMark">
								<tr>
									<td>
										<br/>
										Отметки должностных лиц таможенного органа:
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:value-of select="aag:RefusalMark/adt_cat:RefusalMarkText"/>
											</xsl:with-param>
											<xsl:with-param name="description" select="' '"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:apply-templates mode="signatureMark" select="aag:RefusalMark"/>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<span class="value">&#160;<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="aag:RefusalMark/cat_ru:IssueDate"/>
										</xsl:call-template>&#160;</span>&#160;
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<br/>
									<br/>
									Копию настоящего акта получил:
									<xsl:apply-templates mode="signature2ndCopy" select="aag:SecondExempReceived"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<span class="value">&#160;<xsl:call-template name="russian_date_month">
										<xsl:with-param name="dateIn" select="aag:SecondExempReceived/adt_cat:Date"/>
									</xsl:call-template>&#160;</span>&#160;
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
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
		<xsl:param name="comma" select="0"/>
		
		<xsl:variable name="width_td1"> 
			<xsl:choose>
				<xsl:when test="$comma=0"><xsl:value-of select="'100%'"/></xsl:when>
				<xsl:otherwise><xsl:value-of select="'99%'"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0">
						<td class="descr" width="1%"><br/></td>
					</xsl:if>
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
	</xsl:template>
	<xsl:template  mode="signatureMark" match="*">
		<table width="100%">
			<tbody>
				<tr>
					<td colspan="5"><br/></td>
				</tr>
				<tr align="center" valign="bottom">
					<td width="40%" class="value">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td width="3%"></td>
					<td width="20%" class="value"></td>
					<td width="3%"></td>
					<td width="34%" class="value">
						<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName|cat_ru:OrganizationName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="descr" valign="top">(должность)</td>
					<td></td>
					<td class="descr" valign="top">(подпись)</td>
					<td></td>
					<td class="descr" valign="top">(фамилия, инициалы имени и отчества (инициал отчества<br/>указывается при наличии отчества)</td>
				</tr>
			</tbody>
		</table>
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
