<?xml version="1.0" encoding="utf-8"?>
  <!--Приказ ФТС России  от 14.02.2019 г. № 258 "Об утверждении форм документов, составляемых таможенными органами при проведении таможенных проверок, 
порядков их заполнения и порядка внесения изменений в решение о проведении выездной таможенной проверки" 
Приложение № 12 - Постановление о снятии ареста, наложенного на товары (DocType=0)
Приложение № 13 - Постановление о возврате изъятых товаров (DocType=1)-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.3" xmlns:raog="urn:customs.ru:Information:CustomsAuditDocuments:ResolutionArrestOutGoods:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
	<!-- Шаблон для типа ResolutionArrestOutGoodsType -->
	<xsl:template match="raog:ResolutionArrestOutGoods">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					width: 180mm;
					max-width: 180mm;
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
					font-style: italic;
					vertical-align:bottom;
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
						font-size: 7pt;
						text-align: center;
						vertical-align:top;
					}
					.indent{
						text-indent: 1.5em;
					}

					.delim_3 {
					height: 3pt;
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
									<xsl:value-of select="raog:CustomResolution/cat_ru:OfficeName"/>
									<xsl:if test="raog:CustomResolution/cat_ru:OfficeName and raog:CustomResolution/cat_ru:Code">
										<xsl:text> (</xsl:text>
									</xsl:if>
									<xsl:value-of select="raog:CustomResolution/cat_ru:Code"/>
									<xsl:if test="raog:CustomResolution/cat_ru:OfficeName and raog:CustomResolution/cat_ru:Code">
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
									<b>ПОСТАНОВЛЕНИЕ</b>
									<br/>
									<xsl:if test="raog:DocType=0">о снятии ареста,  наложенного на товары</xsl:if>
									<xsl:if test="raog:DocType=1">о возврате изъятых товаров</xsl:if>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<table>
										<tbody>
											<tr valign="bottom" align="center">
												<td width="35%">
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="raog:ResolutionDate"/>
													</xsl:call-template>
												</td>
												<td width="30"/>
												<td width="35%" class="value">
													<xsl:value-of select="raog:ResolutionPlace"/>
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
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="person" select="raog:CustomResolution/adt_cat:ApproverPerson"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(фамилия, имя, отчество (отчество указывается при наличии), должность должностного лица, вынесшего постановление)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr align="center">
								<td>
									<br/>
									<xsl:text>ПОСТАНОВИЛ:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>							
							<xsl:if test="raog:DocType=0">
								<tr>
									<td>
										<xsl:text>Снять арест, наложенный на основании постановления </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates mode="person" select="raog:ResolutionInfo/adt_cat:CustomsIssued/adt_cat:ApproverPerson"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<!--xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (отчество указывается при наличии) лица, вынесшего постановление)'"/-->
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<br/><br/>
										<xsl:text> от  </xsl:text>
											<xsl:call-template name="russian_date_month">
												<xsl:with-param name="dateIn" select="raog:ResolutionInfo/adt_cat:CustomsIssued/adt_cat:ApproverPerson/cat_ru:IssueDate"/>
											</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="delim_3"><br/></td>
								</tr>
								<tr>
									<td style="text-align: justify">
										<xsl:text>в соответствии с подпунктом 6 пункта 2 статьи 335 Таможенного кодекса Евразийского экономического союза, а также статьей 233 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации» при проведении выездной таможенной проверки на основании решения о проведении выездной таможенной проверки </xsl:text>
										<xsl:if test="raog:ResolutionInfo/adt_cat:Date">
											<xsl:text> от&#160;</xsl:text>
											<u>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="raog:ResolutionInfo/adt_cat:Date"/>
												</xsl:call-template>
											</u>
										</xsl:if>
										<xsl:if test="raog:ResolutionInfo/adt_cat:Number">
											<xsl:text> №&#160;</xsl:text>
											<u>
												<xsl:value-of select="raog:ResolutionInfo/adt_cat:Number"/>
											</u>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="delim_3"><br/></td>
								</tr>	
								<tr>
									<td>
										<xsl:text>в отношении</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates mode="organization" select="raog:AuditOrganization"/>
												<!--<xsl:text> </xsl:text>
												<xsl:value-of select="raog:StatementNumber/adt_cat:Number"/>
												<xsl:text> </xsl:text>
												<xsl:call-template name="russian_date_month"><xsl:with-param name="dateIn" select="raog:StatementNumber/adt_cat:Date"/></xsl:call-template>-->
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="delim_3"><br/></td>
								</tr>								
								<tr>
									<td>
										<xsl:text>с товаров, на которые наложен арест: </xsl:text>
										<xsl:for-each select="raog:Goods">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="position()"/>
													<xsl:text>) </xsl:text>
													<xsl:apply-templates select="raog:GoodsDescription"/>
													<xsl:if test="raog:GoodsQuantity">
														<xsl:text>; кол-во: </xsl:text>
														<xsl:apply-templates mode="quantity" select="raog:GoodsQuantity"/>
													</xsl:if>
													<xsl:if test="raog:GoodsCharacteristics">
														<xsl:text>; индивидуальные признаки: </xsl:text>
														<xsl:apply-templates select="raog:GoodsCharacteristics"/>
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
										<xsl:apply-templates mode="signature0" select="raog:CustomResolution/adt_cat:ApproverPerson"/>
									</td>
								</tr>
							</xsl:if>
							
							<xsl:if test="raog:DocType=1">
								<tr>
									<td>
										<xsl:text>Произвести возврат следующих товаров: </xsl:text>
										<xsl:for-each select="raog:Goods">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="position()"/>
													<xsl:text>) </xsl:text>
													<xsl:apply-templates select="raog:GoodsDescription"/>
													<xsl:if test="raog:GoodsQuantity">
														<xsl:text>; кол-во: </xsl:text>
														<xsl:apply-templates mode="quantity" select="raog:GoodsQuantity"/>
													</xsl:if>
													<xsl:if test="raog:GoodsCharacteristics">
														<xsl:text>; индивидуальные признаки: </xsl:text>
														<xsl:apply-templates select="raog:GoodsCharacteristics"/>
													</xsl:if>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'left'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="delim_3"><br/></td>
									</tr>									
									<tr>
										<td>
										<xsl:text>изъятых на основании постановления </xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates mode="person" select="raog:ResolutionInfo/adt_cat:CustomsIssued/adt_cat:ApproverPerson"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<!--xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (отчество указывается при наличии) лица, вынесшего постановление)'"/-->
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<br/><br/>
										<xsl:text> от  </xsl:text>
										<xsl:call-template name="russian_date_month"><xsl:with-param name="dateIn" select="raog:ResolutionInfo/adt_cat:CustomsIssued/adt_cat:ApproverPerson/cat_ru:IssueDate"/></xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="delim_3"><br/></td>
								</tr>										
								<tr>
									<td style="text-align: justify">
										<xsl:text>в соответствии с подпунктом 6 пункта 2 статьи 335 Таможенного кодекса Евразийского экономического союза, а также статьей 233 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации» при проведении выездной таможенной проверки на основании решения о проведении выездной таможенной проверки </xsl:text>
										<xsl:if test="raog:ResolutionInfo/adt_cat:Date">
											<xsl:text> от&#160;</xsl:text>
											<u><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="raog:ResolutionInfo/adt_cat:Date"/></xsl:call-template></u>
										</xsl:if>
										<xsl:if test="raog:ResolutionInfo/adt_cat:Number">
											<xsl:text> №&#160;</xsl:text>
											<u><xsl:value-of select="raog:ResolutionInfo/adt_cat:Number"/></u>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="delim_3"><br/></td>
								</tr>									
								<tr>
									<td>
										<xsl:text>в отношении</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates mode="organization" select="raog:AuditOrganization"/>
												<!--<xsl:text> </xsl:text>
												<xsl:value-of select="raog:StatementNumber/adt_cat:Number"/>
												<xsl:text> </xsl:text>
												<xsl:call-template name="russian_date_month"><xsl:with-param name="dateIn" select="raog:StatementNumber/adt_cat:Date"/></xsl:call-template>-->
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="width" select="'100%'"/>
											<xsl:with-param name="comma" select="1"/>
										</xsl:call-template>
										<xsl:text>владельцу товаров (лицу, у которого обнаружены товары, либо его представителю).</xsl:text>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<xsl:apply-templates mode="signature1" select="raog:CustomResolution/adt_cat:ApproverPerson"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>								
							<tr>
								<td>Второй экзмпляр постановления получил:<xsl:apply-templates mode="signature2ndCopy" select="raog:SecondExempReceived"/></td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="35%">
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="raog:SecondExempReceived/adt_cat:Date"/>
													</xsl:call-template>
												</td>
												<td width="65%"/>
											</tr>
											<tr>
												<td class="descr">(дата получения второго экземпляра постановления)</td>
												<td/>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="signature2ndCopy" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="70%" class="value">
						<xsl:if test="cat_ru:PersonPost"><xsl:value-of select="cat_ru:PersonPost"/>,&#160;</xsl:if>
						<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
						<xsl:value-of select="cat_ru:PersonName"/>&#160;
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
						<xsl:if test="adt_cat:Passport">,&#160;
								<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardCode"><xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardCode"/>&#160;</xsl:if>
								<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardName"><xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardName"/></xsl:if>
								<xsl:if test="string-length(adt_cat:Passport/RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(adt_cat:Passport/RUScat_ru:IdentityCardNumber) &gt; 0">,&#160;</xsl:if>
								<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardSeries">серия&#160;<xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardSeries"/>
									<xsl:if test="string-length(adt_cat:Passport/RUScat_ru:IdentityCardNumber) &gt; 0">&#160;</xsl:if></xsl:if>
								<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardNumber">№&#160;<xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardNumber"/></xsl:if>
								<xsl:if test="string-length(adt_cat:Passport/RUScat_ru:IdentityCardDate) &gt; 0 or string-length(adt_cat:Passport/RUScat_ru:OrganizationName) &gt; 0">, выдан&#160;</xsl:if>
								<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardDate"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="adt_cat:Passport/RUScat_ru:IdentityCardDate"/></xsl:call-template></xsl:if>
								<xsl:if test="adt_cat:Passport/RUScat_ru:OrganizationName">	&#160;<xsl:value-of select="adt_cat:Passport/RUScat_ru:OrganizationName"/></xsl:if>
						</xsl:if>
					<xsl:if test="adt_cat:AuthoritesDocument">; документ, подтверждающий полномочия:&#160;
						<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:PrDocumentName"><xsl:value-of select="adt_cat:AuthoritesDocument/cat_ru:PrDocumentName"/>&#160;</xsl:if>
							<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:PrDocumentNumber">&#160;№&#160;<xsl:value-of select="adt_cat:AuthoritesDocument/cat_ru:PrDocumentNumber"/></xsl:if>
							<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:PrDocumentDate">&#160;от&#160;<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="adt_cat:AuthoritesDocument/cat_ru:PrDocumentDate"/></xsl:call-template></xsl:if>
							<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:ComplationAuthorityDate">&#160;(дата окончания полномочий&#160;<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="adt_cat:AuthoritesDocument/cat_ru:ComplationAuthorityDate"/></xsl:call-template>)
					</xsl:if>
						</xsl:if>
					</td>
					<td width="10%"/>
					<td width="20%" class="value">
					</td>
				</tr>
				<tr valign="top">
					<td class="descr">(должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность проверяемого лица, у которого обнаружены товары, либо его представителя)</td>
					<td/>
					<td class="descr">(подпись)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="signature0" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="35%" class="value">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td/>
					<td width="20%" class="value">
					</td>
					<td/>
					<td width="35%" class="value">
						<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
					<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
						<xsl:if test="cat_ru:PersonName">.&#160;</xsl:if>
						<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
						<xsl:if test="cat_ru:PersonMiddleName">.</xsl:if>
					</td>
				</tr>
				<tr valign="top">
					<td class="descr">(должность должностного лица таможенного органа, вынесшего постановление о снятии наложенного ареста)</td>
					<td/>
					<td class="descr">(подпись)</td>
					<td/>
					<td class="descr">(фамилия, инициалы имени и<br/>отчества (инициал отчества<br/>указывается при наличии отчества)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="signature1" match="*">
		<table width="100%">
			<tbody>
				<tr align="center" valign="bottom">
					<td width="35%" class="value">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td/>
					<td width="20%" class="value">
					</td>
					<td/>
					<td width="35%" class="value">
						<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
					<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
						<xsl:if test="cat_ru:PersonName">.&#160;</xsl:if>
						<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
						<xsl:if test="cat_ru:PersonMiddleName">.</xsl:if>
					</td>
				</tr>
				<tr valign="top">
					<td class="descr">(должность должностного лица таможенного органа, вынесшего постановление о возврате изъятых товаров)</td>
					<td/>
					<td class="descr">(подпись)</td>
					<td/>
					<td class="descr">(фамилия, инициалы имени и<br/>отчества (инициал отчества<br/>указывается при наличии отчества)</td>
				</tr>
			</tbody>
		</table>
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
		<xsl:apply-templates select="raog:DocsDescription"/>
		<xsl:text> </xsl:text>
		<xsl:if test="raog:DocsQuantity">
			<xsl:text>, кол-во: </xsl:text>
			<xsl:value-of select="raog:DocsQuantity"/>
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
		<xsl:param name="comma" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
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
						<td class="descr" width="1%">
							<br/>
						</td>
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
				<span class="value">&#160;<xsl:value-of select="substring($dateIn,9,2)"/>&#160;</span>
				<xsl:text>" </xsl:text>
				<span class="value">&#160;<xsl:call-template name="month">
						<xsl:with-param name="number" select="substring($dateIn,6,2)"/>
					</xsl:call-template>&#160;</span>
				<xsl:text> 20</xsl:text>
				<span class="value">
					<xsl:value-of select="substring($dateIn,3,2)"/>
				</span>
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