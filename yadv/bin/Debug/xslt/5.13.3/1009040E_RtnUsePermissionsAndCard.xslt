<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:useper="urn:customs.ru:Information:SQDocuments:RtnUsePermissionsAndCard:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template name="date_time">
      <xsl:param name="dateTimeIn"/>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring($dateTimeIn,12,5)"/>
   </xsl:template>
   <xsl:template match="useper:RtnUsePermissionsAndCard">
      <html>
         <head>
            <title>Сведения об использовании разрешений, спецразрешений, карточек допуска и лицензионных карточек</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
				body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					height: 297mm;
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
					font-family: Arial, serif;
				}
				
				.auxiliary tbody tr td {
					border: 0;
				}
			</style>
         </head>
         <body>
            <div class="page">
               <h2>Сведения об использовании разрешений, спецразрешений, карточек допуска и лицензионных карточек</h2>
               <div align="right" style="margin-bottom:20px">
                  <table border="0" style="width:60mm;">
                     <tbody>
                        <tr>
                           <td align="center" style="border-right:0; border-left:0; border-top:0">
                              <xsl:call-template name="date_time">
                                 <xsl:with-param name="dateTimeIn" select="useper:InspectionDateTime"/>
                              </xsl:call-template>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="low" style="border-right:0; border-left:0; border-bottom:0">Дата/время начала контроля</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <table>
                  <tbody>
                     <tr>
                        <td width="50%">
                           <span class="header">Место отправления: </span>
                           <br/>
                           <xsl:value-of select="useper:DispatchLocation"/>
                        </td>
                        <td>
                           <span class="header">Место назначения: </span>
                           <br/>
                           <xsl:value-of select="useper:DestinationLocation"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="header">Принятое решение: </span>
                           <br/>
                           <xsl:choose>
                              <xsl:when test="useper:Decision = 'PASS' ">Пропустить ТС к дальнейшему движению</xsl:when>
                              <xsl:when test="useper:Decision = 'WAIT' ">Не пропускать до устранения нарушений</xsl:when>
                           </xsl:choose>
                        </td>
                        <td>
                           <span class="header">Дата/время принятия решения: </span>
                           <xsl:call-template name="date_time">
                              <xsl:with-param name="dateTimeIn" select="useper:EndDateTime"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="header">Сумма штрафа: </span>
                           <xsl:value-of select="useper:PenaltySum"/>
                        </td>
                        <td>
                           <span class="header">Отметка об оплате штрафа: </span>
                           <xsl:choose>
                              <xsl:when test="useper:IsPaid = 'true' or useper:IsPaid='t' or useper:IsPaid='1' ">Оплачен</xsl:when>
                              <xsl:otherwise>Не оплачен</xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                     <tr>
                        <td>
								Дата/время, когда нарушения должны быть устранены по предписанию:<br/>
                           <xsl:call-template name="date_time">
                              <xsl:with-param name="dateTimeIn" select="useper:RemovalDateTime"/>
                           </xsl:call-template>
                        </td>
                        <td>
								Дата/время установки отметки о выполнении предписания: <br/>
                           <xsl:call-template name="date_time">
                              <xsl:with-param name="dateTimeIn" select="useper:ExecutionDateTime"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <span class="header">Водитель: </span>
                           <xsl:apply-templates select="useper:Driver"/>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <span class="header">Транспортное средство:  </span>
                           <xsl:apply-templates select="useper:TSInfo"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="header">Решение о приостановке движения: </span>
                           <br/>
                           <xsl:choose>
                              <xsl:when test="useper:ReturnActNumber = true()">
                                 <xsl:apply-templates select="useper:ReturnActNumber"/>
                              </xsl:when>
                              <xsl:otherwise>Отсутствует</xsl:otherwise>
                           </xsl:choose>
                        </td>
                        <td>
                           <span class="header">Протокол: </span>
                           <br/>
                           <xsl:apply-templates select="useper:ProtocolNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="header">Предписание: </span>
                           <br/>
                           <xsl:apply-templates select="useper:DirectionNumber"/>
                        </td>
                        <td>
                           <span class="header">Постановление: </span>
                           <br/>
                           <xsl:apply-templates select="useper:ResolutionNumber"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="useper:Driver">
      <xsl:value-of select="cat_ru:PersonSurname"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PersonName"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PersonMiddleName"/>
      <xsl:if test="cat_ru:PersonPost">, должность - <xsl:value-of select="cat_ru:PersonPost"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="useper:TSInfo">
      <table border="0" class="auxiliary">
         <tbody>
            <tr>
               <td>
                  <xsl:if test="cat_ru:VIN">Номер шасси <xsl:value-of select="cat_ru:VIN"/>
                  </xsl:if>
                  <br/>
                  <xsl:if test="cat_ru:TransportKindCode">Код типа ТС <xsl:value-of select="cat_ru:TransportKindCode"/>
                  </xsl:if>
                  <br/>
                  <xsl:if test="cat_ru:TransportMarkCode">Код марки ТС <xsl:value-of select="cat_ru:TransportMarkCode"/>
                  </xsl:if>
                  <br/>
               </td>
               <td>
                  <xsl:if test="cat_ru:TransportIdentifier">Идентификатор ТС <xsl:value-of select="cat_ru:TransportIdentifier"/>
                  </xsl:if>
                  <br/>
                  <xsl:if test="cat_ru:TransportMeansNationalityCode">
						Код страны принадлежности ТС 
						<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
                  </xsl:if>
                  <br/>
                  <xsl:if test="cat_ru:ActiveTransportIdentifier">
						Идентификатор активного ТС  
						<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
                  </xsl:if>
                  <br/>
                  <xsl:if test="cat_ru:TransportRegNumber">
						Номер свидетельства о регистрации ТС 
						<xsl:value-of select="cat_ru:TransportRegNumber"/>
                  </xsl:if>
                  <br/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="useper:ReturnActNumber | useper:ProtocolNumber | useper:DirectionNumber | useper:ResolutionNumber">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <br/>
         <xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <br/>
      <!--<xsl:if test="sq_cat:DateTo">
		<span>Действителен до </span>
		<xsl:call-template name="date_time">
			<xsl:with-param name="dateTimeIn" select="sq_cat:DateTo"/>
		</xsl:call-template>
		<br/>
	</xsl:if>
	<xsl:if test="sq_cat:ConclusionType">
		<span>
			Тип заключения: 
			<xsl:value-of select="sq_cat:ConclusionType"/>
		</span>
	</xsl:if>-->
   </xsl:template>
</xsl:stylesheet>
