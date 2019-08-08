<?xml version="1.0" encoding="UTF-8"?>
<!-- Приказ ФТС от 24.11.2017 № 1861 Приложение № 3 к Порядку использования в качестве пассажирской таможенной декларации документов, содержащих сведения, необходимые для выпуска товаров для личного пользования, доставляемых перевозчиками (транспортными экспедиторскими компаниями и службами курьерской доставки) в адрес физических лиц - получателей товаров, с применением Единой автоматизированной информационной системы таможенных органов-->
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rapc="urn:customs.ru:Information:CustomsDocuments:RepresApplicChange:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="rapc:RepresApplicChange">
    <html>
      <head>
        <title>Заявление о внесении изменений в реестр товаров для личного пользования</title>
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
          border: solid 0pt #000000;
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
          font-size: 8pt;
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
          .р{

          <!--text-orientation: sideways-right;-->
          -webkit-transform: rotate(180deg);
          -moz-transform: rotate(180deg);
          -o-transform: rotate(180deg);
          transform: rotate(180deg);
          filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=2);
          }
          .graph1 {
          font-family: Arial;
          font-size: 7pt;
          }
          .parent {
          margin: 0%;
          }
        </style>
      </head>
      <body>
        <div class="album_page">
          <table style="width:297mm">
            <tr>
              <td align="center" class="graph" style="border-left:1px solid #ffffff; border-top:1px solid #ffffff; border-right:1px solid #ffffff; border-bottom:1px solid #ffffff;">
                <font face="Times new roman" size="3">
                  <b>
                    ЗАЯВЛЕНИЕ О ВНЕСЕНИИ ИЗМЕНЕНИЙ В РЕЕСТР ТОВАРОВ ДЛЯ ЛИЧНОГО ПОЛЬЗОВАНИЯ,<BR/>
                    ДОСТАВЛЯЕМЫХ ПЕРЕВОЗЧИКОМ (ТРАНСПОРТНОЙ-ЭКСПЕДИТОРСКОЙ КОМПАНИЕЙ<BR/>
                    ИЛИ СЛУЖБОЙ КУРЬЕРСКОЙ ДОСТАВКИ) В АДРЕС ФИЗИЧЕСКИХ ЛИЦ<BR/>
                  </b>
                </font>
              </td>
            </tr>
          </table>
          <table align="center" style="width:297mm">
            <tr>
              <td align="center" class="graph" style="border-left:1px solid #ffffff; border-top:1px solid #ffffff; border-right:1px solid #ffffff;">
                <span class="graph">
                  <xsl:if test="rapc:Representative/cat_ru:OrganizationName">
                    <xsl:value-of select="rapc:Representative/cat_ru:OrganizationName"/><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </xsl:if>
                  <xsl:apply-templates select="rapc:Representative/cat_ru:Address"/>
                  <xsl:if test="rapc:Representative/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                    ИНН <xsl:value-of select="rapc:Representative/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                  </xsl:if>
                  <xsl:if test="rapc:Representative/rapc:OKPOID">
                    ОКПО: <xsl:value-of select="rapc:Representative/rapc:OKPOID"/>
                  </xsl:if>
                   Лицензия <xsl:value-of select="rapc:Representative/rapc:LicenseNumber"/>
                </span>
              </td>
            </tr>
          </table>
          <div align="center">
            <span class="graph">
              (наименование и место нахождения таможенного представителя, ИНН, ОКПО, номер свидетельства о включении в реестр таможенного представителя)<br/>
            </span>
          </div>
          <p align="justify">
            <span class="graph">Основание для корректировки сведений, содержащихся в реестре товаров для личного пользования, доставляемых экспресс-перевозчиком в адрес физических лиц №________ (нужное отметить):</span>
          </p>
          <p align="justify">
            <span class="graph">
              <xsl:call-template name="markContent">
                <xsl:with-param name="condition" select="rapc:ChangeType='0'"/>
                <xsl:with-param name="content" select="' - техническая ошибка;'"/>
              </xsl:call-template>
            </span>
          </p>
          <p align="justify">
            <span class="graph">
              <xsl:call-template name="markContent">
                <xsl:with-param name="condition" select="rapc:ChangeType='1'"/>
                <xsl:with-param name="content" select="'- описка;'"/>
              </xsl:call-template>
            </span>
          </p>
          <p align="justify">
            <span class="graph">
              <xsl:call-template name="markContent">
                <xsl:with-param name="condition" select="rapc:ChangeType='2'"/>
                <xsl:with-param name="content" select="'- дополнение недостающих сведений.'"/>
              </xsl:call-template>
            </span>
          </p>
          <table align="center" style="width:297mm">
            <tr>
              <td align="center">
                <span class="graph">
                  N п/п
                </span>
              </td>
              <td align="center">
                <span class="graph">
                  Регистрационный номер реестра
                </span>
              </td>
              <td align="center">
                <span class="graph">
                  Порядковый номер отправления (индивидуальной накладной)
                </span>
              </td>
              <td align="center">
                <span class="graph">
                  Наименование товара
                </span>
              </td>
              <td align="center">
                <span class="graph">
                  Номер корректируемой графы реестра
                </span>
              </td>
              <td align="center">
                <span class="graph">
                  Название корректируемой графы реестра
                </span>
              </td>
              <td align="center">
                <span class="graph">
                  Старое значение графы реестра
                </span>
              </td>
              <td align="center">
                <span class="graph">
                  Скорректированное значение графы реестра
                </span>
              </td>
            </tr>
            <tr>
              <td align="center"><span class="graph">1</span></td>
              <td align="center"><span class="graph">2</span></td>
              <td align="center"><span class="graph">3</span></td>
              <td align="center"><span class="graph">4</span></td>
              <td align="center"><span class="graph">5</span></td>
              <td align="center"><span class="graph">6</span></td>
              <td align="center"><span class="graph">7</span></td>
              <td align="center"><span class="graph">8</span></td>
            </tr>
            <xsl:for-each select="rapc:Consignment">
              <tr>
                <td align="center">
                  <span class="graph">
                    <xsl:value-of select="position()"/>.
                  </span>
                </td>
                <td align="center">
                  <span class="graph">
                    <xsl:if test="../rapc:ApplicationRegNumber">
                      <xsl:value-of select="../rapc:ApplicationRegNumber/cat_ru:CustomsCode"/>
                      <xsl:text> / </xsl:text>
                      <xsl:call-template name="russian_date_gtd">
                        <xsl:with-param name="dateIn" select="../rapc:ApplicationRegNumber/cat_ru:RegistrationDate"/>
                      </xsl:call-template>
                      <xsl:text> / </xsl:text>
                      <xsl:value-of select="../rapc:ApplicationRegNumber/cat_ru:GTDNumber"/>
                    </xsl:if>
                  </span>
                </td>
                <td align="center">
                  <span class="graph">
                    <xsl:if test="rapc:ListNumeric">
                      <xsl:value-of select="rapc:ListNumeric"/>
                    </xsl:if>
                  </span>
                </td>
                <td align="center">
                  <span class="graph">
                    <xsl:for-each select="rapc:GoodsDescription">
                      <xsl:value-of select="."/> 
                    </xsl:for-each>
                  </span>
                </td>
                <td align="center">
                  <span class="graph">
                    <xsl:if test="rapc:GrNumber">
                      <xsl:value-of select="rapc:GrNumber"/>
                    </xsl:if>
                  </span>
                </td>
                <td align="center">
                  <span class="graph">
                    <xsl:if test="rapc:GrDescription">
                      <xsl:value-of select="rapc:GrDescription"/>
                    </xsl:if>
                  </span>
                </td>
                <td align="center">
                  <span class="graph">
                    <xsl:if test="rapc:PreviousData">
                      <xsl:value-of select="rapc:PreviousData"/>
                    </xsl:if>
                  </span>
                </td>
                <td align="center">
                  <span class="graph">
                    <xsl:if test="rapc:CorrectData">
                      <xsl:value-of select="rapc:CorrectData"/>
                    </xsl:if>
                  </span>
                </td>
              </tr>
            </xsl:for-each>  </table>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="cat_ru:Address">
	  <xsl:for-each select="*">
		  <xsl:value-of select="."/>
		  <xsl:if test="position()!=last()">, </xsl:if>
	  </xsl:for-each>
  </xsl:template>
  <xsl:template name="markContent">
    <xsl:param name="condition"/>
    <xsl:param name="content"/>
    <xsl:choose>
      <xsl:when test="$condition">
        <u>
          <xsl:value-of select="$content"/>
        </u>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$content"/>
      </xsl:otherwise>
    </xsl:choose>
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
