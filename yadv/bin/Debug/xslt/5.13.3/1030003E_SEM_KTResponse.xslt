<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:kt_resp="urn:customs.ru:Information:CustomsDocuments:SEM_KTResponse:5.12.0" xmlns:sem_cat="urn:customs.ru:Information:SEMDocuments:SEMCommonAggregateTypes:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="kt_resp:SEM_KTResponse">
      <html>
         <head>
            <title>Категории товаров включенных во внутрисистемный список товаров, запрещенных или ограниченных к перемещению через таможенную границу РФ</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {
                        background: #cccccc;
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
					
					h3 {
						text-align:left;
						font: 14 ;
						font-family: Arial, serif;
					}
					
					 table {
                        width: 100%;
                        border: 0;
                        empty-cells: show;
                        border-collapse: collapse;
                        margin-top: 1px;
                    }

                    td {
                        font-family: Arial, serif;
                        vertical-align:top;
                    }
                    
                    td.inside {
                        border: 1px solid gray;
                        font-family: Arial, serif;
                        vertical-align:top;
                    }
                </style>
         </head>
         <body>
            <div class="album_page">
               <h2>Товары, в отношении которых установлены запреты и ограничения</h2>
               <!--h2>Категории товаров включенных во внутрисистемный список товаров, запрещенных или ограниченных к перемещению через таможенную границу РФ</h2-->
				<h3>Общий результат проверки: <xsl:value-of select="kt_resp:Status"/></h3>
               <xsl:for-each select="kt_resp:Goods">
					<table width="100%">
						<tbody>
							<tr>
								<td><b>Номер товара: <xsl:value-of select="sem_cat:GoodsNumeric"/></b></td>
							</tr>
							<xsl:if test="sem_cat:GoodsTNVEDCode">
								<tr>
									<td>Код товара: <xsl:value-of select="sem_cat:GoodsTNVEDCode"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="sem_cat:GoodsDescriptionMarkup">
								<tr>
									<td>Описание товара:<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										  <xsl:for-each select="sem_cat:GoodsDescriptionMarkup">
											 <xsl:call-template name="color">
												<xsl:with-param name="word" select="sem_cat:Word"/>
												<xsl:with-param name="weight" select="sem_cat:Weight"/>
												<xsl:with-param name="delimiter" select="sem_cat:Delimiter"/>
											 </xsl:call-template>
										  </xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="kt_resp:MessageDoc">
								<tr>
									<td>Информация о разрешительных документах: <xsl:value-of select="kt_resp:MessageDoc"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="kt_resp:KTs">
								<tr>
									<td>
										<table border="1" style="table-layout:fixed;word-wrap:break-word; width:100%; ">
											<tbody>
												<tr>
													<td style="width:10%" align="center" class="inside">Код  товара</td>
													<td style="width:60%" align="center" class="inside">Описание КТ</td>
													<td style="width:20%" align="center" class="inside">Реквизиты нормативного документа и реквизиты пункта КТ</td>
													<td align="center" class="inside">Релевант-ность (%)</td>
												</tr>
												<xsl:for-each select="kt_resp:KTs">
													<tr>
														<td class="inside"><xsl:value-of select="sem_cat:KTID"/></td>
														<td class="inside">
															<xsl:for-each select="sem_cat:DescriptionMarkup">
																<xsl:call-template name="color">
																	<xsl:with-param name="word" select="sem_cat:Word"/>
																	<xsl:with-param name="weight" select="sem_cat:Weight"/>
																	<xsl:with-param name="delimiter" select="sem_cat:Delimiter"/>
																</xsl:call-template>
															</xsl:for-each>
														</td>
														<td class="inside">
															<xsl:apply-templates select="sem_cat:DocumentReference"/>, <xsl:value-of select="sem_cat:Requisites"/>
														</td>														
														<td class="inside" align="center"><xsl:value-of select="sem_cat:Relevance"/></td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<xsl:if test="position()!=last()"><br/></xsl:if>
				</xsl:for-each>
			</div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="sem_cat:DocumentReference">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:text> № </xsl:text>
		<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
		</xsl:call-template>   
   </xsl:template>
   <xsl:template name="russian_date">
	<xsl:param name="dateIn" />
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,6,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,1,4)" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn" />
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
