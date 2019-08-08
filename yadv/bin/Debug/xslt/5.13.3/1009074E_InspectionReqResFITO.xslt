<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:isptrrf="urn:customs.ru:Information:SQDocuments:InspectionReqResFITO:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
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
   <xsl:template match="isptrrf:InspectionReqResFITO">
      <html>
         <head>
            <title>
				Сведения о фитосанитарном контроле
            </title>
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
               <h2>
				Сведения о фитосанитарном контроле
               </h2>
               <p>
				   <span class="header">Тип операции:</span>
				   <br/>
				   <xsl:if test="isptrrf:TransferKind='1'">Ввоз (импорт в ТС)</xsl:if>
				   <xsl:if test="isptrrf:TransferKind='2'">Вывоз (экспорт из ТС)</xsl:if>
				   <xsl:if test="isptrrf:TransferKind='3'">Транзит через территорию ТС</xsl:if>
               </p>
               <p>
                  <span class="header">Решение, принятое таможенным инспектором по результатам документарного контроля:</span>
                  <br/>
                  <xsl:apply-templates select="isptrrf:InspectionDecision"/>
               </p>
               <xsl:if test="isptrrf:Violation">
                  <p>
                     <span class="header">Нарушение, выявленное при досмотре</span>
                     <br/>
                     <xsl:apply-templates select="isptrrf:Violation"/>
                  </p>
               </xsl:if>
				<xsl:if test="isptrrf:ViolationAct">
					<p>
                     <span class="header">Данные об акте:</span>
                     <br/>
					<xsl:if test="isptrrf:ViolationAct/isptrrf:DocumentNumber">
						№ <xsl:value-of select="isptrrf:ViolationAct/isptrrf:DocumentNumber"/>
					</xsl:if>
					<xsl:if test="isptrrf:ViolationAct/isptrrf:DocumentData">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="isptrrf:ViolationAct/isptrrf:DocumentData"/>
						</xsl:call-template>
						<xsl:if test="isptrrf:ViolationAct/isptrrf:BlankNumber">
							<xsl:text> номер бланка </xsl:text>
							<xsl:value-of select="isptrrf:ViolationAct/isptrrf:BlankNumber"/>
						</xsl:if>
					</xsl:if>
                  </p>
				</xsl:if>
				<p>
                     <span class="header">Пункт пропуска:</span>
                     <br/>
                     <xsl:value-of select="isptrrf:PostIndentif/cat_ru:Code"/>
                     <xsl:if test="isptrrf:PostIndentif/cat_ru:OfficeName">
						 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="isptrrf:PostIndentif/cat_ru:OfficeName"/>
                     </xsl:if>
                </p>
                <p>
                     <span class="header">Инспектор:</span>
                     <br/>
                     <xsl:value-of select="isptrrf:CustomsPerson/isptrrf:PersonSurname"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="isptrrf:CustomsPerson/isptrrf:PersonName"/>
                     <xsl:if test="isptrrf:CustomsPerson/isptrrf:PersonMiddleName">
						 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="isptrrf:CustomsPerson/isptrrf:PersonMiddleName"/>
                     </xsl:if>
                </p>
                <xsl:if test="isptrrf:Comment">
					<p>
						<span class="header">Комментарии</span>
						<br/>
						<xsl:for-each select="isptrrf:Comment">
							<xsl:value-of select="."/>
						</xsl:for-each>
					</p>
                </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="isptrrf:InspectionDecision">
	Тип решения: 
	<xsl:choose>
         <xsl:when test="isptrrf:Type=0">Решение не определено;</xsl:when>
         <xsl:when test="isptrrf:Type=1">Ввоз разрешен (разрешение);</xsl:when>
         <xsl:when test="isptrrf:Type=2">Вывоз разрешен (разрешение);</xsl:when>
         <xsl:when test="isptrrf:Type=3">Транзит разрешен (разрешение);</xsl:when>
         <xsl:when test="isptrrf:Type=4">Ввоз запрещен (запрет);</xsl:when>
         <xsl:when test="isptrrf:Type=5">Вывоз запрещен (запрет);</xsl:when>
         <xsl:when test="isptrrf:Type=6">Транзит запрещен (запрет);</xsl:when>
         <xsl:when test="isptrrf:Type=7">Отправить на ветеринарный досмотр (запрет);</xsl:when>
         <xsl:when test="isptrrf:Type=8">Досмотр невозможен по техническим причинам (разрешение);</xsl:when>
         <xsl:when test="isptrrf:Type=9">Груз задержан (запрет);</xsl:when>
      </xsl:choose>
      <br/>
      <xsl:value-of select="isptrrf:Description"/>
      <br/>
   </xsl:template>
   <xsl:template match="isptrrf:Violation">
	Тип:  
	<xsl:choose>
         <xsl:when test="isptrrf:Type=1">Неизвестный тип;</xsl:when>
         <xsl:when test="isptrrf:Type=2">Предприятие не аттестовано для поставок в ТС;</xsl:when>
         <xsl:when test="isptrrf:Type=3">Отсутствие гарантий ветслужб стран экспортеров о полном соответствии продукции ветсантребованиям ТС;</xsl:when>
         <xsl:when test="isptrrf:Type=4">Отсутствие предварительной электронной информации о подтверждении факта отгрузки в адрес российского получателя;</xsl:when>
         <xsl:when test="isptrrf:Type=5">Отсутствие ветсопроводительных документов;</xsl:when>
         <xsl:when test="isptrrf:Type=6">Отсутствие разрешения Россельхознадзора на ввоз;</xsl:when>
         <xsl:when test="isptrrf:Type=7">Ветсертификаты оформлены с нарушениями действующих правил и ошибками, а так же с опечатками и техническими ошибками;</xsl:when>
         <xsl:when test="isptrrf:Type=8">Поступление продукции с предприятий, в отношении которых введены временные ограничения;</xsl:when>
         <xsl:when test="isptrrf:Type=9">Истечение срока реализации продукции;</xsl:when>
         <xsl:when test="isptrrf:Type=10">Несоответствие информации о продукции, указанной в ветсертификатах и фактически выявленой на маркировочных этикетках;</xsl:when>
         <xsl:when test="isptrrf:Type=11">Отсутствие ветеринарных транзитных уведомлений;</xsl:when>
         <xsl:when test="isptrrf:Type=12">Отказ от права собственности фирмой-импортером на продукцию в пользу другой организации;</xsl:when>
         <xsl:when test="isptrrf:Type=13">Запрет на ввоз, транзит в РФ с территорий, неблагополучных по заразным болезням животных;</xsl:when>
         <xsl:when test="isptrrf:Type=14">Иные нарушения, не требующие принципиального решения Службы, не выходящие за пределы компетенции территориальных управлений Россельхознадзора</xsl:when>
      </xsl:choose>
      <br/>
      <xsl:value-of select="isptrrf:Description"/>
      <br/>
   </xsl:template>
   <xsl:template match="isptrrf:RestrictionList">
    Тип: <xsl:value-of select="isptrrf:Type"/>
    <br/>
    <xsl:value-of select="isptrrf:Description"/>
    <br/>
   </xsl:template>
   <xsl:template match="isptrrf:Requirement">
	Тип: 
	<xsl:choose>
         <xsl:when test="isptrrf:Type=1">Необходимость разрешения;</xsl:when>
         <xsl:when test="isptrrf:Type=2">Необходимость аттестации предприятия-изготовителя;</xsl:when>
         <xsl:when test="isptrrf:Type=3">Дополнительное условие разрешения;</xsl:when>
         <xsl:when test="isptrrf:Type=4">Наличие регистрации лекарственных средств и кормовых добавок;</xsl:when>
         <xsl:when test="isptrrf:Type=5">Наличие документа подтверждающего качество и безопасность лекарственных средств и кормовых добавок химического и микробиологического синтеза, ввозимых без ветеринарного сертификата;</xsl:when>
         <xsl:when test="isptrrf:Type=6">Наличие документа, подтверждающего приобретение в розничной сети чучел всех видов животных и рыб или их фрагментов, прошедших полную таксидермическую обработку;</xsl:when>
      </xsl:choose>
      <br/>
      <xsl:if test="isptrrf:Description">Условие: <xsl:value-of select="isptrrf:Description"/>
         <br/>
      </xsl:if>
      <xsl:apply-templates select="isptrrf:Document"/>
   </xsl:template>
   <xsl:template match="isptrrf:Document">
	Документ: 
	<span>
         <xsl:if test="cat_ru:PrDocumentName">
            <xsl:value-of select="cat_ru:PrDocumentName"/>
         </xsl:if>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <xsl:if test="cat_ru:PrDocumentDate">
			от
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <br/>
   </xsl:template>
</xsl:stylesheet>
