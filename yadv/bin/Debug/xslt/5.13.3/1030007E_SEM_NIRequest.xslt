<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ni_req="urn:customs.ru:Information:SEMDocuments:SEM_NIRequest:5.12.0" xmlns:sem_cat="urn:customs.ru:Information:SEMDocuments:SEMCommonAggregateTypes:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="ni_req:SEM_NIRequest">
      <html>
         <head>
            <title>Сервис NI - входные данные</title>
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
            <div class="page">
               <table>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Запрос по сервису NI</b>
                        </font>
                     </td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <!--tr>
                     <td align="right" style="border:solid 0pt">Строка подключения к БД 
						<u>
                           <xsl:value-of select="ni_req:ConnectionId"/>
                        </u>
                     </td>
                  </tr-->
                  <!--xsl:if test="ni_req:DateStart">
                     <tr>
                        <td style="border:solid 0pt">Дата начала
						<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ni_req:DateStart"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="ni_req:DateStop">
                     <tr>
                        <td style="border:solid 0pt">Дата окончания
						<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ni_req:DateStop"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                  </xsl:if-->
                  <xsl:if test="ni_req:CalculationSettings">
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <xsl:call-template name="CalculationSettings"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
						<td>
							<b>Информация о неформализованных индикаторах и соотвествующих номеров товаров ДТ</b>
							<table>
								<tbody>
									<xsl:for-each select="ni_req:NIRequestInfo">
										<tr>
											<td>
											      <span class="graph">         
											      <b><xsl:value-of select="position()"/><br/>Информация о неформализованных индикаторах в тестируемом ППР/ПР:</b>      
											      </span>      
											      <table>         
													  <tr>            
														<td>Код неформализованного признака</td>
														<td>                  
															<xsl:value-of select="ni_req:RiskProfileDescription/sem_cat:Code"/>               
														</td>             
													  </tr>        
														<tr>               
															<td>Описание признака</td>                
															<td>                  
																<xsl:value-of select="ni_req:RiskProfileDescription/sem_cat:Description"/>               
															</td>            
														</tr>         
													</table>
													<br/>
												  <span class="graph">         
											      <b>Инофрмация по ДТ,<br/>содержимое из которой необходимо спопоставить с  нефомализованными индикаторами</b>      
											      </span>      
											      <table>         
													  <tr>            
														<td align="center" width="30%">Номер ДТ</td>            
														<td align="center">Номер товара в ДТ</td>         
													  </tr>        
													  <xsl:for-each select="ni_req:DTInfo">            
														<tr>               
															  <td align="center">                  
																  <xsl:apply-templates select="sem_cat:DTRegNumber"/>              
															</td>               
															<td>                  
																<xsl:value-of select="sem_cat:GoodsNumeric"/>               
															</td>            
														</tr>         
													  </xsl:for-each>      
													</table>
													<br/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</td>
				  </tr>
                  <!--tr>
                     <td class="graph" style="border:solid 0pt">
                        <xsl:call-template name="SURProfile"/>
                     </td>
                  </tr-->
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
    <xsl:template match="sem_cat:DTRegNumber">      
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
   <xsl:template name="CalculationSettings">
      <xsl:choose>
         <xsl:when test="ni_req:CalculationSettings">
            <span class="graph">
               <b>Ограничительные коэффициенты</b>
            </span>
            <table>
               <tbody>
                  <tr>
                     <td>№</td>
                     <td>Наименование</td>
                     <td>Тип</td>
                     <td>Значение</td>
                  </tr>
                  <xsl:for-each select="ni_req:CalculationSettings">
                     <tr>
                        <td>
                           <xsl:value-of select="position()"/>
                        </td>
                        <td>
                           <xsl:value-of select="sem_cat:Name"/>
                        </td>
                        <td>
                           <xsl:value-of select="sem_cat:Type"/>
                        </td>
                        <td>
                           <xsl:value-of select="sem_cat:Value"/>
                        </td>
                     </tr>
                  </xsl:for-each>
               </tbody>
            </table>
         </xsl:when>
         <xsl:otherwise>
            <span>Ограничительные коэффициенты - НЕТ</span>
         </xsl:otherwise>
      </xsl:choose>
      <br/>
   </xsl:template>
   <!--xsl:template name="SURProfile">
      <span class="graph">
         <b>ИД профиля риска</b>
      </span>
      <table>
         <tr>
            <td align="center">Код ТО, разработавшего ПР/СПР</td>
            <td align="center">Код признака документа</td>
            <td align="center">Дата регистрации ПР/СПР</td>
            <td align="center">Порядковый номер ПР/СПР</td>
            <td align="center">Порядковый номер версии ПР/СПР</td>
         </tr>
         <tr>
            <td align="center">
               <xsl:value-of select="ni_req:SURProfile/sem_cat:RiskProfileRegNumber/sem_cat:DivisionCode"/>
            </td>
            <td>
               <xsl:choose>
                  <xsl:when test="ni_req:SURProfile/sem_cat:RiskProfileRegNumber/sem_cat:DocumentSignCode='11'">Общероссийский профиль риска</xsl:when>
                  <xsl:when test="ni_req:SURProfile/sem_cat:RiskProfileRegNumber/sem_cat:DocumentSignCode='12'">Региональный профиль риска</xsl:when>
                  <xsl:when test="ni_req:SURProfile/sem_cat:RiskProfileRegNumber/sem_cat:DocumentSignCode='13'">Зональный профиль риска</xsl:when>
                  <xsl:when test="ni_req:SURProfile/sem_cat:RiskProfileRegNumber/sem_cat:DocumentSignCode='55'">Профиль риска, обязательный к применению</xsl:when>
                  <xsl:when test="ni_req:SURProfile/sem_cat:RiskProfileRegNumber/sem_cat:DocumentSignCode='20'">Срочный профиль риска</xsl:when>
               </xsl:choose>
            </td>
            <td align="center">
               <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="ni_req:SURProfile/sem_cat:RiskProfileRegNumber/sem_cat:RegistryDate"/>
               </xsl:call-template>
            </td>
            <td align="center">
               <xsl:value-of select="ni_req:SURProfile/sem_cat:RiskProfileRegNumber/sem_cat:SequenceNumber"/>
            </td>
            <td align="center">
               <xsl:value-of select="ni_req:SURProfile/sem_cat:RiskProfileRegNumber/sem_cat:VersionNumber"/>
            </td>
         </tr>
      </table>
      <br/>
      <span class="graph">
         <b>Описание неформализованных индикаторов профиля риска</b>
      </span>
      <table>
         <tr>
            <td align="center" width="30%">Код неформализованного признака</td>
            <td align="center">Описание признака</td>
         </tr>
         <xsl:for-each select="ni_req:SURProfile/sem_cat:RiskProfileDescription">
            <tr>
               <td align="center">
                  <xsl:value-of select="sem_cat:Code"/>
               </td>
               <td>
                  <xsl:value-of select="sem_cat:Description"/>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template-->
</xsl:stylesheet>
