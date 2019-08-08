<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:tdts="urn:customs.ru:Information:CustomsDocuments:TDTSCustomsMark:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tdts:TDTSCustomsMark">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Отметки таможенного органа по ТДТС</title>
            <style type="text/css">
				body {background-color: #cccccc;}

				div.page {
					width: 210mm;
					margin: 6pt auto;
					padding: 10mm;
					background: white;
					border: solid 1px black;
				}

				/*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
				@media print {div.page {border: none; margin: 0; padding: 0;}}

				h1 {
					text-align: center;
					font-size: 16pt;
					margin-bottom: 10pt;
					counter-reset: numbered;
				}

				h2.numbered:after {
					content: " № " counter(numbered);
					counter-increment: numbered;
				}

				h2 {
					font-size: 14pt;
					text-align: center;
					margin-top: 20pt;
				}


				p {padding-left: 10pt;}
				
				.low 
				{
					font-size: 13;
				}
				
				.auxiliary tbody tr td { border: 0; }
			</style>
         </head>
         <body>
            <div class="page">
               <h1>Отметки таможенного органа по ТДТС</h1>
               <div align="right">
                  <table border="1" style="margin-top:10px; border:0" width="30%">
                     <tbody>
                        <tr>
                           <td align="center" style="border-right:0; border-left:0; border-top:0">
                              <xsl:value-of select="tdts:DocumentID"/>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="low" style="border:0">(идентификатор декларации)</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <xsl:if test="tdts:TDTSRegNumber">
					Регистрационный номер ТДТС 
					<span style="text-decoration:underline;">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:apply-templates select="tdts:TDTSRegNumber"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </span>
                  <br/>
               </xsl:if>
               <xsl:if test="tdts:Comments">
					Комментарий: 
					<xsl:for-each select="tdts:Comments">
                     <xsl:value-of select="."/> </xsl:for-each>
                  <br/>
               </xsl:if>
               <xsl:if test="tdts:TransportMeans">
				   <br/>
				   <b>Номера: </b>
				   <br/>
				   <xsl:for-each select="tdts:TransportMeans">
					   <xsl:apply-templates select="."/>
				   </xsl:for-each>
               </xsl:if>
               <xsl:if test="tdts:TDTSCommonMark">
                  <br/>
                  <b>Служебные отметки: </b>
                  <br/>
                  <xsl:for-each select="tdts:TDTSCommonMark">
                     <xsl:apply-templates select="."/>
                     <br/>
                  </xsl:for-each>
               </xsl:if>
               <xsl:apply-templates select="tdts:CancellationInfo"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="tdts:TDTSRegNumber">
      <xsl:value-of select="cat_ru:CustomsCode"/> /
	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/> /
	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="tdts:TransportModeCode"/>
      <xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
   <xsl:template match="tdts:CancellationInfo">
      <br/>
      <b>Сведения об отказе:</b>
      <br/>
      <xsl:if test="tdts:Date or tdts:Time">
		Дата и время 
		<span style="text-decoration:underline;">
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="tdts:Date"/>
            </xsl:call-template>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="substring(tdts:Time, 1, 5)"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="tdts:Foundation">
		Обоснование 
		<span style="text-decoration:underline;">
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="tdts:Foundation"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="tdts:ResolutionDescription">
		Описание принятого решения: 
		<span style="text-decoration:underline;">
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="tdts:ResolutionDescription"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="tdts:CustomsPerson">
		Должностное лицо ТО 
		<xsl:apply-templates select="tdts:CustomsPerson"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="tdts:TransportMeans">
   Номер 
	<span style="text-decoration:underline;">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="catTrans_ru:TMNumber"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </span>
      <br/>
    Номер VIN 
	<span style="text-decoration:underline;">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="catTrans_ru:VINID"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </span>
      <br/>
    Код вида 
	<span style="text-decoration:underline;">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="catTrans_ru:ModeCode"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </span>
      <br/>
    Код страны принадлежности 
	<span style="text-decoration:underline;">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="catTrans_ru:NationalityCode"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </span>
      <br/>
   </xsl:template>
   <xsl:template match="tdts:TDTSCommonMark">
	Графа 
	<span style="text-decoration:underline;">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="tdts:GRNumber"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </span>
      <br/>
	
	Дата регистрации ТДТС/совершения таможенной операции
	<span style="text-decoration:underline;">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="tdts:Date"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </span>
      <br/>
	
	Отметка о форме таможенного контроля 
	<span style="text-decoration:underline;">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="tdts:ControlMark"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </span>
      <br/>
      <xsl:if test="tdts:SpecialMark">
		Особые отметки 
		<span style="text-decoration:underline;">
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="tdts:SpecialMark"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </span>
         <br/>
      </xsl:if>
	
	Срок временного ввоза ТСМП
	<xsl:if test="tdts:Deadline">
         <span style="text-decoration:underline;">
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="tdts:Deadline"/>
            </xsl:call-template>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </span>
         <br/>
      </xsl:if>
	
	Таможенный орган 
	<span style="text-decoration:underline;">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:apply-templates select="tdts:Customs"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </span>
      <br/>
	
	Инспектор таможенного органа
	<xsl:apply-templates select="tdts:CustomsPerson"/>
   </xsl:template>
   <xsl:template match="tdts:Customs">
      <xsl:value-of select="cat_ru:Code"/>
      <xsl:if test="cat_ru:OfficeName">
		(<xsl:value-of select="cat_ru:OfficeName"/>)
	</xsl:if>
   </xsl:template>
   <xsl:template match="tdts:CustomsPerson">
      <span style="text-decoration:underline;">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:PersonName"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:if test="cat_ru:LNP">
			(ЛНП <xsl:value-of select="cat_ru:LNP"/>)
		</xsl:if>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </span>
      <br/>
   </xsl:template>
</xsl:stylesheet>
