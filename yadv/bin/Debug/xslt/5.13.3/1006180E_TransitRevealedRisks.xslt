<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:trr="urn:customs.ru:Information:CustomsDocuments:TransitRevealedRisks:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="trr:TransitRevealedRisks">
      <html>
         <head>
            <title>Результат выявления рисков по информации о транзитных товарах</title>
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
					padding-left: 20mm;
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
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
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
							font-size: 12pt;
							}
				jh {
				font: 18;
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
				</style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <b>Результат выявления рисков по информации о транзитных товарах</b>
                     </td>
                  </tr>
                  <tr>
                     <td style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td style="border:solid 0pt">
                        <u>Идентификатор сообщения с информацией о транзитных товарах, по которым выявлялись риски:</u>
                        <xsl:value-of select="trr:TransportID"/>
                     </td>
                  </tr>
                  <tr>
                     <td style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="trr:Profiles">
                     <xsl:for-each select="trr:Profiles">
                        <xsl:variable name="ProfilesID" select="@ID"/>
                        <tr>
                           <td style="border:solid 0pt">
                              <u>Выявленные ПР/ЦПР</u>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt">
								Сведения о ПР № 
								<xsl:value-of select="trr:DocumentSignCode"/>/<xsl:value-of select="trr:DivisionCode"/>/<xsl:call-template name="russian_date_gtd">
                                 <xsl:with-param name="dateIn" select="trr:RegistryDate"/>
                              </xsl:call-template>/<xsl:value-of select="trr:SequenceNumber"/>/<xsl:value-of select="trr:VersionNumber"/>
                           </td>
                        </tr>
                        <!--<xsl:value-of select="trr:DivisionCode"/></td></tr>
				<tr>
				<td style="border:solid 0pt">
				Код признака документа:
				<xsl:choose>
					<xsl:when test="trr:DocumentSignCode='11'">общероссийский профиль риска</xsl:when>
					<xsl:when test="trr:DocumentSignCode='12'">региональный профиль риска</xsl:when>
					<xsl:when test="trr:DocumentSignCode='13'">зональный профиль риска</xsl:when>
					<xsl:when test="trr:DocumentSignCode='55'">профиль риска, обязательный к применению</xsl:when>
					<xsl:when test="trr:DocumentSignCode='20'">срочный профиль риска</xsl:when>
				</xsl:choose></td></tr>
				<tr>
				<td style="border:solid 0pt">
				Дата регистрации ПР/СПР:
				<xsl:call-template name="date">
								<xsl:with-param name="dateIn" select="trr:RegistryDate"/>
						</xsl:call-template></td></tr>
				<tr>
				<td style="border:solid 0pt">
				Порядковый номер ПР/СПР:
				<xsl:value-of select="trr:SequenceNumber"/></td></tr>-->
                        <tr>
                           <td style="border:solid 0pt">
								Порядковый номер версии ПР/ЦПР:
								<xsl:value-of select="trr:VersionNumber"/>
                           </td>
                        </tr>
                        <tr>
							<td style="border:solid 0pt">
								Код направления деятельности подразделения,<br/>по направлению которого выявлен риск
								<xsl:value-of select="trr:ActivityCode"/>
							</td>
						</tr>
                        <tr>
                           <td style="border:solid 0pt">
								Дата начала действия версии ПР/ЦПР:
								<xsl:call-template name="date">
                                 <xsl:with-param name="dateIn" select="trr:BeginDate"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt">
                              <xsl:if test="trr:DocumentDescription">
				Описание риска (заполняется только для автоматических ориентировок):
				<xsl:value-of select="trr:DocumentDescription"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt">
                              <xsl:if test="trr:PRNote">
				Примечание к ПР/ЦПР:
				<xsl:value-of select="trr:PRNote"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt">
				Информация о типовом критерии:
				<xsl:value-of select="trr:CriterionCodeInfo/trr:CriterionCode"/>,
				<xsl:value-of select="trr:CriterionCodeInfo/trr:CriterionDescription"/>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt">
                              <u>
				Меры по минимизации риска:</u>
                           </td>
                        </tr>
                        <tr>
                           <td style="border:solid 0pt">
                              <xsl:if test="trr:MinimizeMeasures/trr:MinimizeMeasuresNote">Примечание к мерам:
				<xsl:value-of select="trr:MinimizeMeasures/trr:MinimizeMeasuresNote"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <xsl:for-each select="trr:MinimizeMeasures/trr:MinimizeMeasuresInfo">
                           <tr>
                              <td style="border:solid 0pt">Набор информации о каждой мере по минимизации рисков:
								<xsl:value-of select="trr:MinimizeMeasureCode"/>,
								<xsl:choose>
									<xsl:when test="trr:MinimizeMeasureNecessary='0'">необязательное применение меры</xsl:when>
									<xsl:when test="trr:MinimizeMeasureNecessary='1'">обязательное применение меры</xsl:when>
									</xsl:choose>,
								<xsl:choose>
									<xsl:when test="trr:TakeMeasuresSign=' '">поле не заполняется</xsl:when>
									<xsl:when test="trr:TakeMeasuresSign='0'">мера не применяется согласно результатам случайной выборки</xsl:when>
									<xsl:when test="trr:TakeMeasuresSign='1'">мера должна быть применена согласно профилю риска</xsl:when>
									<xsl:when test="trr:TakeMeasuresSign='2'">мера не применяется из-за несоответствия этапа применения меры и этапа выявления ПР</xsl:when>
									<xsl:when test="trr:TakeMeasuresSign='3'">резерв</xsl:when>
									<xsl:when test="trr:TakeMeasuresSign='4'">мера не применяется в связи с включением субъекта ВЭД в Перечень лиц, в отношении которых принято решение об идентификации категории уровня риска применения мер по минимизации рисков</xsl:when>
									<xsl:when test="trr:TakeMeasuresSign='5'">мера не применяется в связи с неприменением главной меры (проставляется АИС «АИСТ-М» в автоматическом режиме)</xsl:when>
									<xsl:when test="trr:TakeMeasuresSign='6'">мера не применялась по причине упрощенного контроля таможенной стоимости идентичных товаров</xsl:when>
								</xsl:choose>
							</td>
						</tr>
                           <xsl:if test="trr:MainActionCode">
                              <tr>
                                 <td style="border:solid 0pt">Код главной меры  <xsl:value-of select="trr:MainActionCode"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <tr>
                              <td style="border:solid 0pt">
                                 <xsl:if test="trr:MeasureDescription">Примечание к мере по минимизации рисков:
					<xsl:value-of select="trr:MeasureDescription"/>
                                 </xsl:if>
                              </td>
                           </tr>
                           <tr>
                              <td style="border:solid 0pt"> </td>
                           </tr>
                           <tr>
                              <td style="border:solid 0pt">
                                 <u>Характеристики досмотра/осмотра:</u>
                              </td>
                           </tr>
                           <xsl:if test="trr:MeasureAttribute">
                              <xsl:for-each select="trr:MeasureAttribute">
                                 <tr>
                                    <td valign="top">Код характеристики досмотра/осмотра
					<xsl:value-of select="trr:MeasureAttributeCode"/>, значение характеристики досмотра/осмотра
					<xsl:for-each select="trr:MeasureAttributeValue">
                                          <xsl:value-of select="."/>,</xsl:for-each>
                                       <xsl:if test="trr:MeasureAttributeNecessary">
                                          <xsl:choose>
                                             <xsl:when test="trr:MeasureAttributeNecessary='0'"> возможно выбирать значения характеристик таможенного досмотра</xsl:when>
                                             <xsl:when test="trr:MeasureAttributeNecessary='1'"> возможность выбора отсутствует (досмотр применяется в соответствии со значениями характеристик, установленных профилем       
															риска)</xsl:when>
                                          </xsl:choose>
                                       </xsl:if>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                              <tr>
                                 <td style="border:solid 0pt"> </td>
                              </tr>
                           </xsl:if>
                        </xsl:for-each>
                        <tr>
                           <td style="border:solid 0pt"> </td>
                        </tr>
                        <xsl:if test="//trr:Consignment/trr:ProfileRef[@URI=$ProfilesID]">
                           <tr>
								<td style="border:solid 0pt">Сведения о ТС, для которых сработал ПР:
									<!--xsl:for-each select="//trr:Consignment/trr:ProfileRef[@URI=$ProfilesID]">
										<xsl:value-of select="."/>
											<xsl:if test="following-sibling::trr:ProfileRef">,</xsl:if>
									</xsl:for-each-->
								</td>
                           </tr>
                        </xsl:if>
                        <!--<tr>
								
									<td style="border:solid 0pt"><xsl:if test="//trr:Consignments/trr:ProfileRef[@URI=$ProfilesID]">Сведения о ТС, для которых сработал ПР:</xsl:if>
                                            <xsl:for-each select="//trr:Consignments/trr:ProfileRef">
											<xsl:variable name="ts" select="@URI"/>
											<xsl:if test="$ts=$ProfilesID">
												<xsl:value-of select="."/>, </xsl:if>
												<xsl:if test="position()=last()"><xsl:value-of select="."/></xsl:if>
										</xsl:for-each>
									</td>
								</tr>-->
                        <xsl:if test="//trr:Consignments/trr:Consignment/trr:ProfileRef[@URI=$ProfilesID]">
                           <tr>
                              <td style="border:solid 0pt">Партия товаров, на которой сработал ПР в целом:<xsl:for-each select="//trr:Consignments/trr:Consignment/trr:Sequence[../trr:ProfileRef[@URI=$ProfilesID]]">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position()!=last()">,</xsl:if>
                                 </xsl:for-each>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="//trr:Consignments/trr:Consignment/trr:Goods/trr:ProfileRef[@URI=$ProfilesID]">
                           <tr>
                              <td style="border:solid 0pt">Товары, на которых выявлены риски:
								  <xsl:for-each select="//trr:Consignments/trr:Consignment/trr:Goods/trr:GoodsNumber[../trr:ProfileRef[@URI=$ProfilesID]]">№
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
                                 </xsl:for-each>
                              </td>
                           </tr>
                        </xsl:if>
                        <!--	<xsl:for-each select="//trr:Consignments/trr:Consignment">
									<xsl:if test="//trr:Consignments/trr:Consignment">
									-->
                        <!--<tr>
										<td style="border:solid 0pt">Партия товаров, на которой сработал ПР в целом:</td>
									</tr>-->
                        <!--</xsl:if>
										<tr>
											<td style="border:solid 0pt">
												<xsl:for-each select="trr:ProfileRef">
													<xsl:variable name="ts1" select="@URI"/>
													<xsl:if test="$ts1=$ProfilesID">№
														<xsl:value-of select="//trr:Sequence"/>,</xsl:if>
												</xsl:for-each>
											</td>
										</tr>
										-->
                        <!--<xsl:if test="trr:Goods">-->
                        <!--
											
													<xsl:for-each select="trr:Goods">
													<tr>
												<td style="border:solid 0pt">Товары, на которых выявлены риски:</td>
											</tr>
												<tr>
												<td style="border:solid 0pt">
														<xsl:for-each select="trr:ProfileRef">
															<xsl:variable name="ts2" select="@URI"/>
															<xsl:if test="$ts2=$ProfilesID">№
																<xsl:value-of select="//trr:GoodsNumber"/>, </xsl:if>
														</xsl:for-each></td>
											</tr>
													</xsl:for-each>
												
										-->
                        <!--</xsl:if>-->
                        <!--
									</xsl:for-each>-->
                        <!--<tr>
											<td style="border:solid 0pt">
					                           <xsl:value-of select="trr:Sequence"/>
											</td>
										</tr>
										<tr>
											<td style="border:solid 0pt">
												<xsl:if test="trr:ProfileRef">
													<xsl:for-each select="trr:ProfileRef">
														<xsl:if test="trr:ProfileRef[@URI=$ProfilesID]">
															<xsl:value-of select="."/>,</xsl:if>
													</xsl:for-each>
												</xsl:if>
											</td>
										</tr>
										<tr>
											<td style="border:solid 0pt">- товар, на котором были выявлены риски:
					<xsl:if test="trr:Goods">
													<xsl:for-each select="trr:Goods">
														<xsl:value-of select="trr:GoodsNumber"/>,
					<xsl:for-each select="trr:ProfileRef">
															<xsl:if test="trr:ProfileRef[@URI=$ProfilesID]">
																<xsl:value-of select="."/>,</xsl:if>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:if>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>-->
                        <tr>
                           <!--<xsl:if test="position()='1'"> 
									<td style="border-top:0pt solid;">&#160;
									</td>
									</xsl:if>-->
                           <xsl:if test="position()!=last()">
                              <td style="border-left:1px solid #ffffff; border-top:1pt solid #ffffff; border-right:1px solid #ffffff; border-bottom:1pt solid #000000;"> </td>
                           </xsl:if>
                        </tr>
                     </xsl:for-each>
                  </xsl:if>
               </table>
            </div>
         </body>
      </html>
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
