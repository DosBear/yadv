<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:davir="urn:customs.ru:Information:DecisionAboutViolationIntellectRights:5.14.2">
  <!-- Шаблон для типа DecisionAboutViolationIntellectRightsType -->
  <xsl:template match="davir:DecisionAboutViolationIntellectRights">
    <xsl:param name="w" select="190" />
    <html>
      <head>
        <style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
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
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



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
                </style>
      </head>
      <body>
        <div class="page" style="width: {$w}mm;">
          <table>
            <tbody>
              <tr>
                <td align="center" class="title">
                  <font size="4">
                    <b>Информация о товарах с признаками возможного нарушении прав интеллектуальной собственности и принятом решении относительно приостановлении их выпуска </b>
                  </font>
                </td>
              </tr>
            </tbody>
          </table>
          <br />
          <!--table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="cat_ru:DocumentID" />
              </td>
            </tr>
          </table>
          <xsl:if test="cat_ru:RefDocumentID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="cat_ru:RefDocumentID" />
                </td>
              </tr>
            </table>
          </xsl:if-->
          <xsl:if test="davir:Decision">
            <div class="title marg-top">Решение, принятое таможенным органом относительно выпуска товаров, содержащих признаки нарушения прав интеллектуальной собственности</div>
            <div>
              <xsl:apply-templates select="davir:Decision">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="davir:NumberDT">
            <div class="title marg-top">Регистрационный номер ДТ</div>
            <div>
              <xsl:apply-templates select="davir:NumberDT">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="davir:CustomsModeCode">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Код таможенной процедуры в соответствии с классификатором видов таможенных процедур</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="davir:CustomsModeCode" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="davir:Declarant">
            <div class="title marg-top">Декларант товаров</div>
            <div>
              <xsl:apply-templates select="davir:Declarant">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="davir:IPOOwner">
            <div class="title marg-top">Информация о правообладателе</div>
            <div>
              <xsl:apply-templates select="davir:IPOOwner">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <div class="title marg-top">Товары с признаками нарушения прав интеллектуальной собственности, относительно которых выносится решение</div>
          <table class="bordered">
            <tbody>
              <tr class="title">
                <td class="graphMain bordered" width="10%">Решение</td>
                <td class="graphMain bordered" width="5%">Код решения в соответствии с классификатором решений,  принимаемых таможенными органами </td>
                <td class="graphMain bordered" width="5%">Порядковый номер декларируемого  товара Гр.32 ДТ</td>
                <td class="graphMain bordered" width="10%">Код товара по ТН ВЭД ЕАЭС. Гр.33 первый раздел</td>
                <td class="graphMain bordered" width="5%">Признак объекта интеллектуальной собственности («И»). Гр.33 второй раздел  в ДТ</td>
                <td class="graphMain bordered" width="15%">Наименование (торговое, коммерческое или иное традиционное наименование) товаров</td>
                <td class="graphMain bordered" width="36%">Описание признаков нарушения прав интеллектуальной собственности</td>
                <td class="graphMain bordered" width="7%">Дата, до которой продлен  срок приостановления срока выпуска товаров </td>
                <td class="graphMain bordered" width="7%">Дата, до которой срок выпуска товаров приостановлен</td>
              </tr>
              <xsl:for-each select="davir:GoodsWithSignOfViolation">
                <xsl:apply-templates select=".">
                  <xsl:with-param name="wdth" select="$w" />
                </xsl:apply-templates>
              </xsl:for-each>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:AddressType -->
  <xsl:template match="cat_ru:Address">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PostalCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Почтовый индекс</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PostalCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CounryName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:CounryName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Region">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:Region" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:City">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Населенный пункт</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:City" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:StreetHouse" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:TerritoryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:TerritoryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ContactType -->
  <xsl:template match="cat_ru:Contact">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:Phone">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телефона</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:Phone">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Fax">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер факса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:Fax" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Telex">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телекса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:Telex" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:E_mail">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:E_mail">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ITNKZType -->
  <xsl:template match="cat_ru:ITN">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:CategoryCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:KATOCode" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:RNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:RNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITNReserv">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:ITNReserv" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:IdentityCardType -->
  <xsl:template match="cat_ru:IdentityCard">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:IdentityCardCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность. Для РФ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:IdentityCardCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:IdentityCardName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:IdentityCardSeries" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:IdentityCardNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OrganizationName" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
  <xsl:template match="cat_ru:KGOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:KGINN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="cat_ru:KGINN='ИНН'">
                  <xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
                </xsl:when>
                <xsl:when test="cat_ru:KGINN='ПИН'">
                  <xsl:text>персональный идентификационный номер</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="cat_ru:KGINN" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KGOKPO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:KGOKPO" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RAOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:UNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:SocialServiceNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceCertificate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:SocialServiceCertificate" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RBOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:UNP" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:RBIdentificationNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RFOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OGRN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OGRN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:INN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:KPP" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RKOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:BIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:BIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:IIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITN">
        <div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
        <div>
          <xsl:apply-templates select="cat_ru:ITN">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа davir:CountryType -->
  <xsl:template match="davir:CountryInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:value-of select="davir:CountryName" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="davir:CountryCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="davir:Priznac" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:CUCustomsType -->
  <xsl:template match="davir:Customs">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:Code" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:OfficeName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OfficeName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CustomsCountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код государства - члена Евразийского экономического союза. Трехзначный цифровой код</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:CustomsCountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:CustomsPersonType -->
  <xsl:template match="davir:CustomsPerson">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:PersonName" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:LNP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:LNP" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа davir:DecisionType -->
  <xsl:template match="davir:Decision">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">
			<xsl:choose>
				<xsl:when test="davir:DecisionCode='1' or davir:DecisionCode='2' or davir:DecisionCode='3' or davir:DecisionCode='*'">Решение</xsl:when>
				<xsl:otherwise>Код решения</xsl:otherwise>
			</xsl:choose>
          </td>
          <td class="value graphMain" style="width:50%">
			<xsl:choose>
				<xsl:when test="davir:DecisionCode='1'">Решение о приостановлении выпуска товаров, содержащих ОИС</xsl:when>
				<xsl:when test="davir:DecisionCode='2'">Отмена Решения о приостановлении выпуска товаров, содержащих ОИС</xsl:when>
				<xsl:when test="davir:DecisionCode='3'">Решение о продлении срока приостановления выпуска товаров, содержащих ОИС</xsl:when>
				<xsl:when test="davir:DecisionCode='*'">разные по товарам</xsl:when>
				<xsl:otherwise><xsl:value-of select="davir:DecisionCode"/></xsl:otherwise>
			</xsl:choose>
          </td>
        </tr>
      </table>
      <xsl:if test="davir:DecisionDTCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код решения в соответствии с классификатором решений,  принимаемых таможенными органами </td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="davir:DecisionDTCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="davir:DecisionNumber">
        <div class="title marg-top">Номер и дата принятого решения</div>
        <div>
          <xsl:apply-templates select="davir:DecisionNumber">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="davir:Customs">
        <div class="title marg-top">Таможенный орган, принявший решение</div>
        <div>
          <xsl:apply-templates select="davir:Customs">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="davir:CustomsPerson">
        <div class="title marg-top">Должностное лицо, таможенного органа, принявшее решение</div>
        <div>
          <xsl:apply-templates select="davir:CustomsPerson">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="davir:Foundation">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Обоснование принятого решения</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="davir:Foundation">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="davir:OwnerDocument">
        <div class="title marg-top">Сведения о документе правообладателя, если решение принято в ответ на обращение правообладателя</div>
        <div>
          <xsl:apply-templates select="davir:OwnerDocument">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="davir:PreviousDecision">
        <div class="title marg-top">Информация о предшествующем отменяемом/продлеваемом решении</div>
        <div>
          <xsl:apply-templates select="davir:PreviousDecision">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="davir:DecisionNumber">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PrDocumentName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PrDocumentName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PrDocumentNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:CUOrganizationType -->
  <xsl:template match="davir:Declarant">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OrganizationName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ShortName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:ShortName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:OrganizationLanguage">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OrganizationLanguage" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RFOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
        <div>
          <xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RKOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
        <div>
          <xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RBOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
        <div>
          <xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RAOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
        <div>
          <xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:KGOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
        <div>
          <xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:Address">
        <div class="title marg-top">Адрес организации</div>
        <div>
          <xsl:apply-templates select="cat_ru:Address">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
        <div class="title marg-top">Документ, удостоверяющий личность</div>
        <div>
          <xsl:apply-templates select="cat_ru:IdentityCard">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:Contact">
        <div class="title marg-top">Контактная информация</div>
        <div>
          <xsl:apply-templates select="cat_ru:Contact">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа davir:GoodsType -->
  <xsl:template match="davir:GoodsWithSignOfViolation">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:choose>
            <xsl:when test="davir:DecisionCode='1'">
              <xsl:text>Решение о приостановлении выпуска товаров</xsl:text>
            </xsl:when>
            <xsl:when test="davir:DecisionCode='2'">
              <xsl:text>Отмена Решения о приостановлении выпуска товаров</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="davir:DecisionCode" />
            </xsl:otherwise>
          </xsl:choose>
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="davir:DecisionDTCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="davir:GoodsNumeric" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="davir:GoodsTNVEDCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="davir:IntellectPropertySign" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="davir:GoodsDescription">
            <xsl:value-of select="." />
          </xsl:for-each>
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="davir:SignOfViolation">
			  <xsl:apply-templates select=".">
				<xsl:with-param name="wdth" select="$w" />
			  </xsl:apply-templates>
			  <xsl:if test="position()!=last()"><br/><br/></xsl:if>
		  </xsl:for-each>	  
        </td>
        <td class="graphMain bordered">
          <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="davir:ProlongDate" />
          </xsl:call-template>
        </td>
        <td class="graphMain bordered">
          <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="davir:LastDate" />
          </xsl:call-template>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа davir:ApplicantType -->
  <xsl:template match="davir:IPOOwner">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OrganizationName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ShortName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:ShortName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:OrganizationLanguage">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OrganizationLanguage" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RFOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
        <div>
          <xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RKOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
        <div>
          <xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RBOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
        <div>
          <xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RAOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
        <div>
          <xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:KGOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
        <div>
          <xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:Address">
        <div class="title marg-top">Адрес организации</div>
        <div>
          <xsl:apply-templates select="cat_ru:Address">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
        <div class="title marg-top">Документ, удостоверяющий личность</div>
        <div>
          <xsl:apply-templates select="cat_ru:IdentityCard">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:Contact">
        <div class="title marg-top">Контактная информация</div>
        <div>
          <xsl:apply-templates select="cat_ru:Contact">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Идентификатор Заявителя/правообладателя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="davir:PersonID" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа davir:IntelPropertyObjectNumberType -->
  <xsl:template match="davir:IntelPropertyObjectNumber">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Регистрационный номер ОИС</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="davir:IntelPropertyObjectNumber" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:GTDIDType -->
  <xsl:template match="davir:NumberDT">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:CustomsCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:call-template name="russian_date">
              <xsl:with-param name="dateIn" select="cat_ru:RegistrationDate" />
            </xsl:call-template>
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:GTDNumber" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="davir:OwnerDocument">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PrDocumentName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PrDocumentName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PrDocumentNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа davir:PreviousDecisionType -->
  <xsl:template match="davir:PreviousDecision">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PrDocumentName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PrDocumentName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PrDocumentNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="davir:ObjectRegNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Регистрационный номер объекта</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="davir:ObjectRegNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="davir:EmissionStoppingNotificationNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер Уведомления о принятии мер, связанных с приостановкой выпуска объекта</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="davir:EmissionStoppingNotificationNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="davir:EmissionStoppingNotificationDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата Уведомления о принятии мер, связанных с приостановкой выпуска объекта</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="davir:EmissionStoppingNotificationDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа davir:SignOfViolationType -->
  <xsl:template match="davir:SignOfViolation">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
      <b><xsl:text>Рег.№ ОИС по реестру</xsl:text></b>
      <xsl:text>: </xsl:text>
      <xsl:value-of select="davir:IPOinfo/davir:IntelPropertyObjectNumber/davir:IntelPropertyObjectNumber"/>
      <br/>
      <xsl:if test="davir:IPOinfo/davir:OISName">
		  <xsl:value-of select="davir:IPOinfo/davir:OISName"/>
		  <br/>
      </xsl:if>
      <xsl:if test="davir:LegalProductDescription">
		  <br/>
		  <xsl:text>Описание внешнего вида легальной продукции: </xsl:text>
		  <xsl:value-of select="davir:LegalProductDescription"/>
		  <br/>
      </xsl:if>
      <xsl:if test="davir:BogusProductDescription">
		  <br/>
		  <xsl:text>Описание внешнего вида товаров, обладающих  признаками контрафактных: </xsl:text>
		  <xsl:value-of select="davir:BogusProductDescription"/>
		  <br/>
      </xsl:if>
      <xsl:if test="davir:Place">
		  <br/>
		  <xsl:text>Место вывоза легальной продукции: </xsl:text>
		  <xsl:variable name="cnt_Place" select="count(davir:Place)"/>
		  <xsl:for-each select="davir:Place">
			  <xsl:if test="position()>1"><xsl:text>; </xsl:text></xsl:if>
			  <xsl:if test="$cnt_Place &gt; 1"><xsl:value-of select="position()"/><xsl:text>) </xsl:text></xsl:if>
			  <xsl:value-of select="davir:CodePlace"/>
			  <xsl:text>, </xsl:text>
			  <xsl:value-of select="davir:Name"/>
			  <xsl:if test="davir:Description">
				  <xsl:text>, </xsl:text>
				  <xsl:apply-templates select="davir:Description"/>
			  </xsl:if>
		  </xsl:for-each>
		  <br/>
      </xsl:if>
      <xsl:if test="davir:CountryInfo">
		  <br/>
		  <xsl:for-each select="davir:CountryInfo">
			  <xsl:if test="position()>1"><br/></xsl:if>
				<xsl:choose>
					<xsl:when test="davir:Priznac='01'">Страна отправления легальной продукции:</xsl:when>
					<xsl:when test="davir:Priznac='02'">Страна происхождения легальной продукции:</xsl:when>
					<xsl:when test="davir:Priznac='03'">Страна отправления предположительно контрафактной продукции:</xsl:when>
					<xsl:when test="davir:Priznac='04'">Страна происхождения предположительно контрафактной продукции:</xsl:when>
					<xsl:otherwise>Код вида страны: <xsl:value-of select="davir:Priznac"/>,</xsl:otherwise>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:value-of select="davir:CountryCode"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="davir:CountryName"/>
		  </xsl:for-each>
		  <br/>
      </xsl:if>
      <xsl:if test="davir:OtherNote">
		  <br/>
			<xsl:text>Иные замечания: </xsl:text>
			<xsl:apply-templates select="davir:OtherNote"/>
      </xsl:if>
    <!--/div-->
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
</xsl:stylesheet>