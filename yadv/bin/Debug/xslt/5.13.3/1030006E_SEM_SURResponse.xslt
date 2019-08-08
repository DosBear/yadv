<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:sem_cat="urn:customs.ru:Information:SEMDocuments:SEMCommonAggregateTypes:5.12.0" xmlns:sur_res="urn:customs.ru:Information:SEMDocuments:SEM_SURResponse:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="sur_res:SEM_SURResponse">
      <html>
         <head>
            <title>Сервис СУР - выходные данные</title>
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
							font-size: 10pt;
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
				</style>
         </head>
         <body>
            <div class="albumpage">
               <table>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Ответ сервиса СУР</b>
                        </font>
                     </td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Декларация № <u>
                           <xsl:apply-templates select="sur_res:DTNumber"/>
                        </u>
                     </td>
                  </tr>
                  <!--tr>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <b>ИД профиля риска</b>
                     </td>
                  </tr-->
                  <!--xsl:for-each select="sur_res:RiskProfileRegNumber">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <xsl:value-of select="position()"/-->.
							<tr>
								<td>
                           <br/>
                          
                           <table>
                              <tr>
                                 <td align="center" class="graph" style="border:solid 0pt">
                                    <b>Сведения о товарах и неформализованных индикаторах профиля риска,<br/>для которых выявлены соответствия</b>
                                 </td>
                              </tr>
                              <xsl:for-each select="sur_res:Goods">
                                 <tr>
                                    <td class="graph" style="border:solid 0pt">
										<b> <xsl:value-of select="position()"/><br/>Описания товаров</b><br/>
										<xsl:for-each select="sur_res:GoodsDescriptionMarkup">
										   <table>
											  <tr>
												 <td align="center" class="graph">
													<xsl:apply-templates mode="compareType" select="."/>
												 </td>
											  </tr>
										   </table>
										   <br/>
										</xsl:for-each>
										<b>Описания групп товаров</b><br/>
										<xsl:for-each select="sur_res:GoodsGroupDescription">
											<xsl:choose>
												<xsl:when test="sur_res:GoodsDescriptionMarkup">
													<xsl:for-each select="sur_res:GoodsDescriptionMarkup">
													   <table>
														  <tr>
															 <td align="center" class="graph">
																<xsl:apply-templates mode="compareType" select="."/>
															 </td>
														  </tr>
													   </table>
													   <br/>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>:</xsl:otherwise>
											</xsl:choose>
											<br/>
											<xsl:if test="sur_res:Manufacturer">
												Производитель
												<xsl:for-each select="sur_res:Manufacturer">
													<xsl:apply-templates mode="compareType" select="."/>
												</xsl:for-each>
												<br/>
											</xsl:if>
											<xsl:if test="sur_res:TradeMark">
												Торговая марка
												<xsl:for-each select="sur_res:TradeMark">
													<xsl:apply-templates mode="compareType" select="."/>
												</xsl:for-each>
												<br/>
											</xsl:if>
										</xsl:for-each>
										   <table>
											  <tr>
												 <td class="graph" style="border:solid 0pt">Числовое значение, характеризующее степень соответствия неформализованных 
													индикаторов описанию товара (оценка достоверности):</td>
												 <td align="center" class="graph" style="border:solid 0pt" valign="bottom">
													<xsl:value-of select="sur_res:Relevance"/>
												 </td>
											  </tr>
											  <tr>
												 <td class="graph" style="border:solid 0pt">Признак найденного соответствия описания товара неформализованным индикаторам профиля риска:</td>
												 <td align="center" class="graph" style="border:solid 0pt" valign="bottom">
													<xsl:value-of select="sur_res:RiskDetected"/>
												 </td>
											  </tr>
											  <tr>
												 <td class="graph" style="border:solid 0pt">Пороговое значение степени соответствия  неформализованных индикаторов описанию товара:</td>
												 <td align="center" class="graph" style="border:solid 0pt" valign="bottom">
													<xsl:value-of select="sur_res:Threshold"/>
												 </td>
											  </tr>
											  <tr>
												 <td class="graph" colspan="2" style="border:solid 0pt"> </td>
											  </tr>
										   </table>
										   <!--xsl:if test="sur_res:DTFieldDescriptionMarkUp">
                                          <table>
                                             <tr>
                                                <td align="center" class="graph" colspan="100%" style="border:solid 0pt">Размеченные текстовые описания граф ДТ</td>
                                             </tr>
                                             <tr>
                                                <td class="graph">Номер графы ДТ</td>
                                                <td align="center" class="graph">Размеченное описание</td>
                                             </tr>
                                             <xsl:for-each select="sur_res:DTFieldDescriptionMarkUp">
                                                <tr>
                                                   <td align="center" class="graph">
                                                      <xsl:value-of select="sur_res:DTFieldName"/>
                                                   </td>
                                                   <td align="center" class="graph" colspan="3">
                                                      <xsl:if test="sur_res:Markup">
                                                         <xsl:for-each select="sur_res:Markup">
                                                            <xsl:call-template name="color">
                                                               <xsl:with-param name="word" select="sem_cat:Word"/>
                                                               <xsl:with-param name="weight" select="sem_cat:Weight"/>
                                                               <xsl:with-param name="delimiter" select="sem_cat:Delimiter"/>
                                                            </xsl:call-template>
                                                         </xsl:for-each>
                                                      </xsl:if>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                          </table>
                                          <br/>
                                       </xsl:if>
                                       <xsl:if test="sur_res:RiskProfileDescriptionMarkUp">
                                          <table>
                                             <tr>
                                                <td align="center" class="graph" colspan="100%" style="border:solid 0pt">Размеченные текстовые описания неформализованных индикаторов  профиля риска</td>
                                             </tr>
                                             <tr>
                                                <td class="graph">Код неформализованного индикатора</td>
                                                <td align="center" class="graph">Размеченное описание</td>
                                             </tr>
                                             <xsl:for-each select="sur_res:RiskProfileDescriptionMarkUp">
                                                <tr>
                                                   <td align="center" class="graph">
                                                      <xsl:value-of select="sur_res:Code"/>
                                                   </td>
                                                   <td align="center" class="graph" colspan="3">
                                                      <xsl:if test="sur_res:Markup">
                                                         <xsl:for-each select="sur_res:Markup">
                                                            <xsl:call-template name="color">
                                                               <xsl:with-param name="word" select="sem_cat:Word"/>
                                                               <xsl:with-param name="weight" select="sem_cat:Weight"/>
                                                               <xsl:with-param name="delimiter" select="sem_cat:Delimiter"/>
                                                            </xsl:call-template>
                                                         </xsl:for-each>
                                                      </xsl:if>
                                                   </td>
                                                </tr>
                                             </xsl:for-each>
                                          </table>
                                       </xsl:if-->
                                    </td>
                                 </tr>
                              </xsl:for-each>
                           </table>
                           </td>
                           </tr>
                        <!--/td>
                     </tr>
                     <br/>
                  </xsl:for-each-->
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="*" mode="compareType">
	   <table>
			<tbody>
				<tr>
					<th class="graph" width="50%">Номер профиля риска</th>
					<th class="graph" width="25%">из ДТ</th>
					<th class="graph" width="25%">из профиля</th>
				</tr>
				<tr>
					<td class="graph"><xsl:apply-templates select="sur_res:ProfileNumber"/></td>
				
					<td class="graph"><xsl:apply-templates mode="MarkUpFromDT" select="."/></td>
					<td class="graph"><xsl:apply-templates mode="MarkUpFromProfile" select="."/></td>
				</tr>
			</tbody>
		</table>
   </xsl:template>
   <xsl:template match="*" mode="MarkUpFromProfile">
	   <xsl:for-each select="sur_res:FromProfile">
		  <xsl:call-template name="color">
			 <xsl:with-param name="word" select="sem_cat:Word"/>
			 <xsl:with-param name="weight" select="sem_cat:Weight"/>
			 <xsl:with-param name="delimiter" select="sem_cat:Delimiter"/>
		  </xsl:call-template>
	   </xsl:for-each>
   </xsl:template>
   <xsl:template match="*" mode="MarkUpFromDT">
	   <xsl:for-each select="sur_res:FromDT">
		  <xsl:call-template name="color">
			 <xsl:with-param name="word" select="sem_cat:Word"/>
			 <xsl:with-param name="weight" select="sem_cat:Weight"/>
			 <xsl:with-param name="delimiter" select="sem_cat:Delimiter"/>
		  </xsl:call-template>
	   </xsl:for-each>
   </xsl:template>
   <xsl:template match="sur_res:ProfileNumber">
		<table width="100%">
			  <tr>
				 <td align="center" class="graph">Код ТО, разработавшего ПР/СПР</td>
				 <td align="center" class="graph">Код признака документа</td>
				 <td align="center" class="graph">Дата регистрации ПР/СПР</td>
				 <td align="center" class="graph">Порядковый номер ПР/СПР</td>
				 <td align="center" class="graph">Порядковый номер версии ПР/СПР</td>
			  </tr>
			  <tr>
				 <td align="center" class="graph">
					<xsl:value-of select="sem_cat:DivisionCode"/>
				 </td>
				 <td class="graph">
					<xsl:choose>
					   <xsl:when test="sem_cat:DocumentSignCode='11'">Общероссийский профиль риска</xsl:when>
					   <xsl:when test="sem_cat:DocumentSignCode='12'">Региональный профиль риска</xsl:when>
					   <xsl:when test="sem_cat:DocumentSignCode='13'">Зональный профиль риска</xsl:when>
					   <xsl:when test="sem_cat:DocumentSignCode='55'">Профиль риска, обязательный к применению</xsl:when>
					   <xsl:when test="sem_cat:DocumentSignCode='20'">Срочный профиль риска</xsl:when>
					</xsl:choose>
				 </td>
				 <td align="center" class="graph">
					<xsl:call-template name="russian_date">
					   <xsl:with-param name="dateIn" select="sem_cat:RegistryDate"/>
					</xsl:call-template>
				 </td>
				 <td align="center" class="graph">
					<xsl:value-of select="sem_cat:SequenceNumber"/>
				 </td>
				 <td align="center" class="graph">
					<xsl:value-of select="sem_cat:VersionNumber"/>
				 </td>
			  </tr>
		</table>
   </xsl:template>
   <xsl:template match="sur_res:DTNumber">
      <!--код/дата/номер-->
      <xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
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
   <xsl:template name="color">
      <xsl:param name="word"/>
      <xsl:param name="weight"/>
      <xsl:param name="delimiter"/>
      <xsl:choose>
         <xsl:when test="$weight=0">
            <span>
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=1">
            <!--<span style="BACKGROUND-COLOR:#FDD2D2;">-->
            <!--<span style="BACKGROUND-COLOR:#ffc0cb;"> -->
            <!-- pink-->
            <span style="BACKGROUND-COLOR:#ffcccc;">
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=2">
            <!--<span style="BACKGROUND-COLOR:#FAC8C8;">-->
            <!--<span style="BACKGROUND-COLOR:#9AFF9A;">-->
            <!--PaleGreen -->
            <span style="BACKGROUND-COLOR:#CCFFCC;">
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=3">
            <!--<span style="BACKGROUND-COLOR:#F6B1B1;">-->
            <!--<span style="BACKGROUND-COLOR:#87CEFF;">-->
            <!--SkyBlue -->
            <span style="BACKGROUND-COLOR:#99ccff;">
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=4">
            <!--<span style="BACKGROUND-COLOR:#F19898;">-->
            <span style="BACKGROUND-COLOR:#FFFF00;">
               <!--Yellow1-->
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=5">
            <!--<span style="BACKGROUND-COLOR:#EB8080;">-->
            <!--<span style="BACKGROUND-COLOR:#DB7093;">-->
            <!--PaleVioletRed -->
            <span style="BACKGROUND-COLOR:#cc6699;">
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=6">
            <!--<span style="BACKGROUND-COLOR:#E66E6E;">-->
            <!--<span style="BACKGROUND-COLOR:#7CCD7C;"> -->
            <!--PaleGreen3-->
            <span style="BACKGROUND-COLOR:#33FF99;">
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=7">
            <!--<span style="BACKGROUND-COLOR:#D85050;">-->
            <!--<span style="BACKGROUND-COLOR:#00BFFF;"> -->
            <!--DeepSkyBlue-->
            <span style="BACKGROUND-COLOR:#00ccff;">
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=8">
            <!--<span style="BACKGROUND-COLOR:#D44242;">-->
            <!--<span style="BACKGROUND-COLOR:#FFC125;">-->
            <!--Goldenrod1-->
            <span style="BACKGROUND-COLOR:#ffcc33;">
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=9">
            <!--<span style="BACKGROUND-COLOR:#CC3636;">-->
            <!--<span style="BACKGROUND-COLOR:#FF4500;">-->
            <!--OrangeRed1-->
            <span style="BACKGROUND-COLOR:#ff6666;">
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=10">
            <!--<span style="BACKGROUND-COLOR:#C32B2B;">-->
            <!--<span style="BACKGROUND-COLOR:#00FF7F;">-->
            <!--SpringGreen-->
            <span style="BACKGROUND-COLOR:#66cc66;">
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=11">
            <!--<span style="BACKGROUND-COLOR:#BA2222;">-->
            <span style="BACKGROUND-COLOR:#3366FF;">
               <!--Blue1-->
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=12">
            <!--<span style="BACKGROUND-COLOR:#B21A1A;">-->
            <!--<span style="BACKGROUND-COLOR:#FFA500;">-->
            <!--Orange1-->
            <span style="BACKGROUND-COLOR:#ff9933;">
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=13">
            <!--<span style="BACKGROUND-COLOR:#A41616;">-->
            <span style="BACKGROUND-COLOR:#00FF00;">
               <!--Green-->
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=14">
            <!--<span style="BACKGROUND-COLOR:#9B1111;">-->
            <!--<span style="BACKGROUND-COLOR:#009ACD;">-->
            <!--DeepSkyBlue3-->
            <span style="BACKGROUND-COLOR:#0099cc;">
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=15">
            <!--<span style="BACKGROUND-COLOR:#8D0A0A;">-->
            <!--<span style="BACKGROUND-COLOR:#FF8247;">-->
            <!--Sienna1-->
            <span style="BACKGROUND-COLOR:#FF6600;">
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <xsl:when test="$weight=16">
            <!--<span style="BACKGROUND-COLOR:#7C0606;">-->
            <span style="BACKGROUND-COLOR:#FF0000;">
               <!--Red1-->
               <!-- websafe-->
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:when>
         <!--<xsl:when test="$weight=16">
				<span style="color:#680202;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>-->
         <!--<xsl:when test="$weight=0">
				<span style="color:#FDD2D2;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=1">
				<span style="color:#FAC8C8;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=2">
				<span style="color:#F6B1B1;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=3">
				<span style="color:#F19898;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=4">
				<span style="color:#EB8080;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=5">
				<span style="color:#E66E6E;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=6">
				<span style="color:#D85050;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=7">
				<span style="color:#D44242;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=8">
				<span style="color:#CC3636;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=9">
				<span style="color:#C32B2B;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=10">
				<span style="color:#BA2222;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=11">
				<span style="color:#B21A1A;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=12">
				<span style="color:#A41616;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=13">
				<span style="color:#9B1111;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=14">
				<span style="color:#8D0A0A;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=15">
				<span style="color:#7C0606;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="$weight=16">
				<span style="color:#680202;">
					<xsl:value-of select="$word"/>
					<xsl:value-of select="$delimiter"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</span>
			</xsl:when>-->
         <xsl:otherwise>
            <span>
               <xsl:value-of select="$word"/>
               <xsl:value-of select="$delimiter"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </span>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
