/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : myday

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 04/07/2020 08:58:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mayday_article
-- ----------------------------
DROP TABLE IF EXISTS `mayday_article`;
CREATE TABLE `mayday_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '发表用户',
  `article_content` longtext COMMENT '文章内容html格式',
  `article_content_md` longtext COMMENT '文章内容Markdown格式',
  `article_newstime` datetime DEFAULT NULL COMMENT '发布时间',
  `article_status` int(11) DEFAULT NULL COMMENT '文章状态 0已发布1草稿2回收站',
  `article_summary` varchar(255) DEFAULT NULL COMMENT '文章摘要',
  `article_thumbnail` varchar(255) DEFAULT NULL COMMENT '略缩图',
  `article_title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `article_type` int(255) DEFAULT NULL COMMENT '文章类型0原创1转载',
  `article_post` varchar(255) DEFAULT NULL COMMENT 'post文章 page页面',
  `article_comment` int(11) DEFAULT NULL COMMENT '是否开启评论 0开启1不开启',
  `article_updatetime` datetime DEFAULT NULL COMMENT '文章最后修改时间',
  `article_url` varchar(255) DEFAULT NULL COMMENT '文章路径',
  `article_views` bigint(20) DEFAULT '0' COMMENT '访问量统计',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MAYDAY_ARTICLE_URL` (`article_url`) USING BTREE,
  KEY `MAYDAY_ARTICLE_USERID` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mayday_article
-- ----------------------------
BEGIN;
INSERT INTO `mayday_article` VALUES (146, NULL, '<h1>Hello Mayday!</h1>\n<p>欢迎使用Mayday进行创作，删除这篇文章后赶紧开始吧。</p>', '# Hello Mayday!\n欢迎使用Mayday进行创作，删除这篇文章后赶紧开始吧。', '2020-07-04 08:27:21', 0, '欢迎使用Mayday进行创作，删除这篇文章后赶紧开始吧。', '/static/img/rand/14.jpg', 'Hello Mayday!', 0, 'post', 0, '2020-07-04 08:27:21', 'hello-mayday', NULL);
INSERT INTO `mayday_article` VALUES (147, 9, '<h1 id=\"easy-excel\">Easy-Excel</h1>\r\n<h2 id=\"-\">它是什么?</h2>\r\n<p>easy-excel 是基于 Apache POI 框架的一款扩展封装库，让我们在开发中更快速的完成导入导出的需求。 尽管很多人会提出 poi 能干这事儿为什么还要封装一层呢？</p>\r\n<p>easy-excel 很大程度上简化了代码、让使用者更轻松的 读、写 Excel 文档，也不用去关心格式兼容等问题，很多时候我们在代码中会写很多的 for 循环，各种 getXXXIndex 来获取行或列让代码变的更臃肿。多个项目之间打一枪换一个地方，代码 Copy 来 Copy 去十分凌乱， 如果你也在开发中遇到类似的问题，那么 easy-excel 是你值得一试的工具。 </p>\r\n<h2 id=\"-\">特性</h2>\r\n<p><strong>支持:</strong></p>\r\n<ul>\r\n<li>基于 Java 8 开发</li>\r\n<li>简洁的 API 操作</li>\r\n<li>注解驱动</li>\r\n<li>可配置列顺序</li>\r\n<li>自定义导入/导出转换器</li>\r\n<li>导出支持自定义样式处理器</li>\r\n<li>导入/导出 错误信息校验</li>\r\n<li>模板导出</li>\r\n<li>支持 Excel 2003、2007格式</li>\r\n<li>多 sheet 导入/导出</li>\r\n</ul>\r\n<h2 id=\"-\">快速开始</h2>\r\n<h3 id=\"-\">引入依赖</h3>\r\n<ul>\r\n<li>Apache Maven<br>```xml<dependency><br><groupId>io.github.itguang</groupId><br><artifactId>easy-excel</artifactId><br><version>1.0.2-RELEASE</version><br></dependency>\r\n\r\n</li>\r\n</ul>\r\n<pre><code>* Gradle Groovy DSL\r\n```groovy\r\ncompile <span class=\"hljs-keyword\">group</span>: <span class=\"hljs-string\">\'io.github.itguang\'</span>, name: <span class=\"hljs-string\">\'easy-excel\'</span>, version: <span class=\"hljs-string\">\'1.0.2-RELEASE\'</span>\r\n</code></pre><h3 id=\"-\">导出</h3>\r\n<p>下面是我们的 Java 模型类，用于存储 Excel 的行数据。</p>\r\n<p><strong>第一步:</strong> 为我们的 pojo 添加 <code>@ExcelColumn</code> 注解，后面会给出各个参数的意思。</p>\r\n<pre><code class=\"lang-java\">@<span class=\"hljs-keyword\">Data</span>\r\n@AllArgsConstructor\r\npublic class Product {\r\n\r\n    @<span class=\"hljs-keyword\">ExcelColumn</span>(<span class=\"hljs-keyword\">columnName</span> = <span class=\"hljs-string\">\"id\"</span>, index = <span class=\"hljs-number\">10</span>)\r\n    private Integer id;\r\n\r\n    @<span class=\"hljs-keyword\">ExcelColumn</span>(<span class=\"hljs-keyword\">columnName</span> = <span class=\"hljs-string\">\"价格\"</span>, index = <span class=\"hljs-number\">20</span>, centToYuan = true, suffix = <span class=\"hljs-string\">\" 元\"</span>, columnNameCellStyleHandler =\r\n            YellowBgCellStyleHandler.class)\r\n    private Long price;\r\n\r\n    @<span class=\"hljs-keyword\">ExcelColumn</span>(<span class=\"hljs-keyword\">columnName</span> = <span class=\"hljs-string\">\"创建日期\"</span>, index = <span class=\"hljs-number\">60</span>, columnNameCellStyleHandler = GreyBgCellStyleHandler.class)\r\n    private OffsetDateTime created;\r\n\r\n    @<span class=\"hljs-keyword\">ExcelColumn</span>(<span class=\"hljs-keyword\">columnName</span> = <span class=\"hljs-string\">\"名称\"</span>, index = <span class=\"hljs-number\">40</span>)\r\n    private String name;\r\n\r\n    @<span class=\"hljs-keyword\">ExcelColumn</span>(<span class=\"hljs-keyword\">columnName</span> = <span class=\"hljs-string\">\"是否是新品\"</span>, index = <span class=\"hljs-number\">41</span>, trueToStr = <span class=\"hljs-string\">\"新品\"</span>, falseToStr = <span class=\"hljs-string\">\"非新品\"</span>)\r\n    private Boolean isNew;\r\n\r\n    @<span class=\"hljs-keyword\">ExcelColumn</span>(<span class=\"hljs-keyword\">columnName</span> = <span class=\"hljs-string\">\"订单状态\"</span>, index = <span class=\"hljs-number\">50</span>, enumKey = <span class=\"hljs-string\">\"name\"</span>, prefix = <span class=\"hljs-string\">\"状态: \"</span>, cellStyleHandler =\r\n            RedFontCellStyleHandler.class)\r\n    private StateEnum stateEnum;\r\n\r\n    @<span class=\"hljs-keyword\">ExcelColumn</span>(<span class=\"hljs-keyword\">columnName</span> = <span class=\"hljs-string\">\"状态变更日期\"</span>, index = <span class=\"hljs-number\">55</span>)\r\n    private LocalDateTime updateTime;\r\n\r\n    @<span class=\"hljs-keyword\">ExcelColumn</span>(<span class=\"hljs-keyword\">columnName</span> = <span class=\"hljs-string\">\"备注\"</span>, index = <span class=\"hljs-number\">70</span>)\r\n    private String other;\r\n\r\n}\r\n</code></pre>\r\n<p><strong>第二步:</strong> 调用 <code>ExcelWriter</code> 类进行导出操作, write() 方法 会返回一个 <code>Workbook</code>对象</p>\r\n<pre><code class=\"lang-java\"><span class=\"hljs-meta\">@Test</span>\r\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">testExport</span><span class=\"hljs-params\">()</span> <span class=\"hljs-keyword\">throws</span> IOException </span>{\r\n    Workbook workbook = ExcelWriter.create(ExcelType.XLS)\r\n            .sheetName(<span class=\"hljs-string\">\"商品数据\"</span>)\r\n            .sheetHeader(<span class=\"hljs-string\">\"--2月份商品数据--\"</span>)\r\n            .write(products, Product.class);\r\n\r\n    File file = <span class=\"hljs-keyword\">new</span> File(productFile);\r\n    OutputStream outputStream = <span class=\"hljs-keyword\">new</span> FileOutputStream(file);\r\n    workbook.write(outputStream);\r\n    outputStream.close();\r\n}\r\n</code></pre>\r\n<p>导出表格:</p>\r\n<p>[外链图片转存失败,源站可能有防盗链机制,建议将图片保存下来直接上传(img-yX6GH0eK-1587636665081)(<a href=\"https://s2.ax1x.com/2020/02/28/3DWpTO.png\">https://s2.ax1x.com/2020/02/28/3DWpTO.png</a>)]</p>\r\n<h2 id=\"-\">导入</h2>\r\n<p>假设我们现在有这样一张 excel 表格：</p>\r\n<p><img src=\"https://imgconvert.csdnimg.cn/aHR0cHM6Ly9zMi5heDF4LmNvbS8yMDIwLzAyLzI4LzNENFluSS5wbmc?x-oss-process=image/format,png\" alt=\"3D4YnI.png\"></p>\r\n<p><strong>第一步:</strong> 给需要接收excel数据的 pojo 实体类添加注解: <code>@ExcelColumn</code></p>\r\n<pre><code class=\"lang-java\">@<span class=\"hljs-keyword\">Data</span>\r\n@AllArgsConstructor\r\n@NoArgsConstructor\r\npublic class Employee {\r\n\r\n    @<span class=\"hljs-keyword\">ExcelColumn</span>(<span class=\"hljs-keyword\">index</span> = <span class=\"hljs-number\">10</span>, columnName = <span class=\"hljs-string\">\"ID\"</span>)\r\n    private Integer id;\r\n    @<span class=\"hljs-keyword\">ExcelColumn</span>(<span class=\"hljs-keyword\">index</span> = <span class=\"hljs-number\">20</span>, columnName = <span class=\"hljs-string\">\"名称\"</span>)\r\n    private String name;\r\n    @<span class=\"hljs-keyword\">ExcelColumn</span>(<span class=\"hljs-keyword\">index</span> = <span class=\"hljs-number\">30</span>, columnName = <span class=\"hljs-string\">\"工资\"</span>, yuanToCent = true, suffix = <span class=\"hljs-string\">\" 元\"</span>)\r\n    private Long salary;\r\n    @<span class=\"hljs-keyword\">ExcelColumn</span>(<span class=\"hljs-keyword\">index</span> = <span class=\"hljs-number\">40</span>, columnName = <span class=\"hljs-string\">\"性别\"</span>,enumKey = <span class=\"hljs-string\">\"name\"</span>)\r\n    private Gender gender;\r\n    @<span class=\"hljs-keyword\">ExcelColumn</span>(<span class=\"hljs-keyword\">index</span> = <span class=\"hljs-number\">50</span>, columnName = <span class=\"hljs-string\">\"生日\"</span>)\r\n    private OffsetDateTime birthday;\r\n}\r\n</code></pre>\r\n<p><strong>需要注意的是,导入操作,接受的实体类必须有无参构造器,否则不能出入成功</strong></p>\r\n<p><strong>第二步:</strong> 调用 <code>ExcelReader</code> 类的方法</p>\r\n<pre><code class=\"lang-java\"><span class=\"hljs-meta\">@Test</span>\r\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">test_import_xlsx</span><span class=\"hljs-params\">()</span> <span class=\"hljs-keyword\">throws</span> FileNotFoundException </span>{\r\n    InputStream fileInputStream = <span class=\"hljs-keyword\">new</span> FileInputStream(employeeFile_Xlsx);\r\n    List&lt;Employee&gt; employees = ExcelReader\r\n            .read(fileInputStream, ExcelType.XLSX)\r\n            .columnNameRowNum(<span class=\"hljs-number\">1</span>)\r\n            .toPojo(Employee.class);\r\n    Assert.assertNotNull(employees);\r\n}\r\n</code></pre>\r\n<h1 id=\"-excelcolumn-\">@ExcelColumn 注解参数</h1>\r\n<p><code>@ExcelColumn</code>注解提供了常用的 转换操作,包括<strong>列名定义,列排序,Boolean值转换,前缀后缀,日期格式化,分转元,元转分</strong> 等等.</p>\r\n<p>对于更加复杂的转换,提供了转换器接口:</p>\r\n<ul>\r\n<li><strong>IWriteConverter</strong>: 导出转换器</li>\r\n<li><strong>IReadConverter</strong>: 导入转换器</li>\r\n</ul>\r\n<p>对于需要自定义样式的需求,分别提供了 对于 <code>columnName</code> 和 <code>rowData</code> 的样式处理器:</p>\r\n<ul>\r\n<li><strong>ICellStyleHandler</strong>: 样式处理器</li>\r\n</ul>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>参数</th>\r\n<th>解释</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>columnName</td>\r\n<td>xcel 每一列的名称</td>\r\n</tr>\r\n<tr>\r\n<td>index</td>\r\n<td>排序(仅对导出有效),支持不连续的整数</td>\r\n</tr>\r\n<tr>\r\n<td>datePattern</td>\r\n<td>日期格式,默认: yyyy/MM/dd,只支持 OffsetDateTime和 LocalDateTime</td>\r\n</tr>\r\n<tr>\r\n<td>required</td>\r\n<td>是否必须</td>\r\n</tr>\r\n<tr>\r\n<td>enumKey</td>\r\n<td>枚举导入使用的key,序列化枚举使用</td>\r\n</tr>\r\n<tr>\r\n<td>trueToStr</td>\r\n<td>true 转换字符串(仅对导出有效)</td>\r\n</tr>\r\n<tr>\r\n<td>strToTrue</td>\r\n<td>字符串转 true(仅对导入有效)</td>\r\n</tr>\r\n<tr>\r\n<td>falseToStr</td>\r\n<td>false 转换(仅对导出有效)</td>\r\n</tr>\r\n<tr>\r\n<td>strToFalse</td>\r\n<td>字符串 转 false(仅对导入有效)</td>\r\n</tr>\r\n<tr>\r\n<td>prefix</td>\r\n<td>前缀</td>\r\n</tr>\r\n<tr>\r\n<td>suffix</td>\r\n<td>后缀</td>\r\n</tr>\r\n<tr>\r\n<td>centToYuan</td>\r\n<td>是否启用 分转元(仅对导出有效) ,支持 Integer 和 Long 类型</td>\r\n</tr>\r\n<tr>\r\n<td>yuanToCent</td>\r\n<td>是否启用 元转分(仅对导入有效),支持 Integer 和 Long 类型</td>\r\n</tr>\r\n<tr>\r\n<td>writeConverter</td>\r\n<td>导出转换器</td>\r\n</tr>\r\n<tr>\r\n<td>readConverter</td>\r\n<td>导入转换器</td>\r\n</tr>\r\n<tr>\r\n<td>cellStyleHandler</td>\r\n<td>rowData 样式处理器</td>\r\n</tr>\r\n<tr>\r\n<td>columnNameCellStyleHandler</td>\r\n<td>columnName 样式处理器</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h1 id=\"api\">API</h1>\r\n<p>查看 <a href=\"https://github.com/itguang/easy-excel/wiki\">wiki</a></p>\r\n<h1 id=\"-\">测试</h1>\r\n<p>本项目采用 github action CI 自动构建,每当 master 分支有变动时就会触发构建,运行所有单元测试。</p>\r\n<p>目前的 jacoco 测试报告：</p>\r\n<p><img src=\"https://imgconvert.csdnimg.cn/aHR0cHM6Ly9zMi5heDF4LmNvbS8yMDIwLzAzLzAxLzNjUXkxSC5wbmc?x-oss-process=image/format,png\" alt=\"3cQy1H.png\"></p>\r\n<blockquote>\r\n<p>导入导出的核心代码基本覆盖到</p>\r\n</blockquote>\r\n<h1 id=\"thanks\">Thanks</h1>\r\n<ul>\r\n<li><a href=\"https://poi.apache.org/\">Apache POI</a></li>\r\n</ul>\r\n<h1 id=\"license\">License</h1>\r\n<p><a href=\"https://github.com/itguang/easy-excel/blob/master/LICENSE\">Apache2.0</a></p>', '# Easy-Excel\r\n\r\n## 它是什么?\r\n\r\neasy-excel 是基于 Apache POI 框架的一款扩展封装库，让我们在开发中更快速的完成导入导出的需求。 尽管很多人会提出 poi 能干这事儿为什么还要封装一层呢？\r\n\r\neasy-excel 很大程度上简化了代码、让使用者更轻松的 读、写 Excel 文档，也不用去关心格式兼容等问题，很多时候我们在代码中会写很多的 for 循环，各种 getXXXIndex 来获取行或列让代码变的更臃肿。多个项目之间打一枪换一个地方，代码 Copy 来 Copy 去十分凌乱， 如果你也在开发中遇到类似的问题，那么 easy-excel 是你值得一试的工具。 \r\n\r\n## 特性\r\n\r\n**支持:**\r\n\r\n- 基于 Java 8 开发\r\n- 简洁的 API 操作\r\n- 注解驱动\r\n- 可配置列顺序\r\n- 自定义导入/导出转换器\r\n- 导出支持自定义样式处理器\r\n- 导入/导出 错误信息校验\r\n- 模板导出\r\n- 支持 Excel 2003、2007格式\r\n- 多 sheet 导入/导出\r\n\r\n\r\n\r\n## 快速开始\r\n\r\n### 引入依赖\r\n\r\n* Apache Maven\r\n```xml\r\n<dependency>\r\n  <groupId>io.github.itguang</groupId>\r\n  <artifactId>easy-excel</artifactId>\r\n  <version>1.0.2-RELEASE</version>\r\n</dependency>\r\n\r\n```\r\n* Gradle Groovy DSL\r\n```groovy\r\ncompile group: \'io.github.itguang\', name: \'easy-excel\', version: \'1.0.2-RELEASE\'\r\n\r\n```\r\n\r\n### 导出\r\n\r\n下面是我们的 Java 模型类，用于存储 Excel 的行数据。\r\n\r\n**第一步:** 为我们的 pojo 添加 `@ExcelColumn` 注解，后面会给出各个参数的意思。\r\n\r\n```java\r\n@Data\r\n@AllArgsConstructor\r\npublic class Product {\r\n\r\n    @ExcelColumn(columnName = \"id\", index = 10)\r\n    private Integer id;\r\n\r\n    @ExcelColumn(columnName = \"价格\", index = 20, centToYuan = true, suffix = \" 元\", columnNameCellStyleHandler =\r\n            YellowBgCellStyleHandler.class)\r\n    private Long price;\r\n\r\n    @ExcelColumn(columnName = \"创建日期\", index = 60, columnNameCellStyleHandler = GreyBgCellStyleHandler.class)\r\n    private OffsetDateTime created;\r\n\r\n    @ExcelColumn(columnName = \"名称\", index = 40)\r\n    private String name;\r\n\r\n    @ExcelColumn(columnName = \"是否是新品\", index = 41, trueToStr = \"新品\", falseToStr = \"非新品\")\r\n    private Boolean isNew;\r\n\r\n    @ExcelColumn(columnName = \"订单状态\", index = 50, enumKey = \"name\", prefix = \"状态: \", cellStyleHandler =\r\n            RedFontCellStyleHandler.class)\r\n    private StateEnum stateEnum;\r\n\r\n    @ExcelColumn(columnName = \"状态变更日期\", index = 55)\r\n    private LocalDateTime updateTime;\r\n\r\n    @ExcelColumn(columnName = \"备注\", index = 70)\r\n    private String other;\r\n\r\n}\r\n\r\n```\r\n\r\n**第二步:** 调用 `ExcelWriter` 类进行导出操作, write() 方法 会返回一个 `Workbook `对象\r\n\r\n```java\r\n@Test\r\npublic void testExport() throws IOException {\r\n    Workbook workbook = ExcelWriter.create(ExcelType.XLS)\r\n            .sheetName(\"商品数据\")\r\n            .sheetHeader(\"--2月份商品数据--\")\r\n            .write(products, Product.class);\r\n\r\n    File file = new File(productFile);\r\n    OutputStream outputStream = new FileOutputStream(file);\r\n    workbook.write(outputStream);\r\n    outputStream.close();\r\n}\r\n```\r\n\r\n导出表格:\r\n\r\n[外链图片转存失败,源站可能有防盗链机制,建议将图片保存下来直接上传(img-yX6GH0eK-1587636665081)(https://s2.ax1x.com/2020/02/28/3DWpTO.png)]\r\n\r\n## 导入\r\n\r\n假设我们现在有这样一张 excel 表格：\r\n\r\n![3D4YnI.png](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9zMi5heDF4LmNvbS8yMDIwLzAyLzI4LzNENFluSS5wbmc?x-oss-process=image/format,png)\r\n\r\n**第一步:** 给需要接收excel数据的 pojo 实体类添加注解: `@ExcelColumn`\r\n\r\n```java\r\n@Data\r\n@AllArgsConstructor\r\n@NoArgsConstructor\r\npublic class Employee {\r\n\r\n    @ExcelColumn(index = 10, columnName = \"ID\")\r\n    private Integer id;\r\n    @ExcelColumn(index = 20, columnName = \"名称\")\r\n    private String name;\r\n    @ExcelColumn(index = 30, columnName = \"工资\", yuanToCent = true, suffix = \" 元\")\r\n    private Long salary;\r\n    @ExcelColumn(index = 40, columnName = \"性别\",enumKey = \"name\")\r\n    private Gender gender;\r\n    @ExcelColumn(index = 50, columnName = \"生日\")\r\n    private OffsetDateTime birthday;\r\n}\r\n```\r\n\r\n**需要注意的是,导入操作,接受的实体类必须有无参构造器,否则不能出入成功**\r\n\r\n**第二步:** 调用 `ExcelReader` 类的方法\r\n\r\n```java\r\n@Test\r\npublic void test_import_xlsx() throws FileNotFoundException {\r\n    InputStream fileInputStream = new FileInputStream(employeeFile_Xlsx);\r\n    List<Employee> employees = ExcelReader\r\n            .read(fileInputStream, ExcelType.XLSX)\r\n            .columnNameRowNum(1)\r\n            .toPojo(Employee.class);\r\n    Assert.assertNotNull(employees);\r\n}\r\n```\r\n\r\n# @ExcelColumn 注解参数\r\n\r\n`@ExcelColumn`注解提供了常用的 转换操作,包括**列名定义,列排序,Boolean值转换,前缀后缀,日期格式化,分转元,元转分** 等等.\r\n\r\n对于更加复杂的转换,提供了转换器接口:\r\n\r\n* **IWriteConverter**: 导出转换器\r\n* **IReadConverter**: 导入转换器\r\n\r\n对于需要自定义样式的需求,分别提供了 对于 `columnName` 和 `rowData` 的样式处理器:\r\n\r\n* **ICellStyleHandler**: 样式处理器\r\n\r\n| 参数                       | 解释                                                         |\r\n| -------------------------- | ------------------------------------------------------------ |\r\n| columnName                 | xcel 每一列的名称                                            |\r\n| index                      | 排序(仅对导出有效),支持不连续的整数                          |\r\n| datePattern                | 日期格式,默认: yyyy/MM/dd,只支持 OffsetDateTime和 LocalDateTime |\r\n| required                    | 是否必须                            |\r\n| enumKey                    | 枚举导入使用的key,序列化枚举使用                             |\r\n| trueToStr                  | true 转换字符串(仅对导出有效)                                |\r\n| strToTrue                  | 字符串转 true(仅对导入有效)                                  |\r\n| falseToStr                 | false 转换(仅对导出有效)                                     |\r\n| strToFalse                 | 字符串 转 false(仅对导入有效)                                |\r\n| prefix                     | 前缀                                                         |\r\n| suffix                     | 后缀                                                         |\r\n| centToYuan                 | 是否启用 分转元(仅对导出有效) ,支持 Integer 和 Long 类型   |\r\n| yuanToCent                  | 是否启用 元转分(仅对导入有效),支持 Integer 和 Long 类型    |\r\n| writeConverter             | 导出转换器                                                   |\r\n| readConverter              | 导入转换器                                                   |\r\n| cellStyleHandler           | rowData 样式处理器                                           |\r\n| columnNameCellStyleHandler | columnName 样式处理器                                        |\r\n\r\n# API\r\n\r\n查看 [wiki](https://github.com/itguang/easy-excel/wiki)\r\n\r\n# 测试\r\n本项目采用 github action CI 自动构建,每当 master 分支有变动时就会触发构建,运行所有单元测试。\r\n\r\n目前的 jacoco 测试报告：\r\n\r\n![3cQy1H.png](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9zMi5heDF4LmNvbS8yMDIwLzAzLzAxLzNjUXkxSC5wbmc?x-oss-process=image/format,png)\r\n\r\n> 导入导出的核心代码基本覆盖到\r\n\r\n# Thanks\r\n\r\n* [Apache POI](https://poi.apache.org/)\r\n\r\n# License\r\n\r\n[Apache2.0](https://github.com/itguang/easy-excel/blob/master/LICENSE)', '2020-07-04 08:41:25', 0, 'easy-excel 是基于 Apache POI 框架的一款扩展封装库，让我们在开发中更快速的完成导入导出的需求。 尽管很多人会提出 poi 能干这事儿为什么还要封装一层呢？', '/upload/2020/7/53d07b97b659520200704084045289.jpg', 'Excel 导入导出太麻烦? Easy excel 了解一下 !', 0, 'post', 0, '2020-07-04 08:41:25', '1593823285', NULL);
INSERT INTO `mayday_article` VALUES (148, 9, '<h2 id=\"tdd-\">TDD 是什么</h2>\r\n<p>TDD 是敏捷开发中的一项核心实践和技术，也是一种设计方法论。TDD 的原理是在开发功能代码之前，先编写单元测试用例代码，测试代码确定需要编写什么功能代码。</p>\r\n<p>TDD 的基本思路是通过测试来推动这个开发的过程，但测试开发并不是单纯的测试工作，而是把 需求分析，设计，质量控制量化的过程。</p>\r\n<p>TDD 的目的不仅仅是测试软件，保证代码质量仅仅是其中的一部分，更重要的是，在开发过程中帮助开发者除去模棱两可的需求。</p>\r\n<p>Kent Beck 的著作《测试驱动开发》中说：</p>\r\n<blockquote>\r\n<p>“测试驱动开发不是一种测试技术。它是一种分析技术、设计技术，更是一种组织所有开发活动的技术”。</p>\r\n</blockquote>\r\n<h2 id=\"-tdd\">为什么要用 TDD</h2>\r\n<p>通常情况下，我们都习惯在需求分析完成后，尽快投入到功能代码的编写工作中，之后再调试。而 TDD 则不太一样，它假设我们已经有一个 ”测试用户“ 了，它是功能代码的第一个使用者，尽管功能还不太完善。</p>\r\n<p>当我们站在 ”测试用户“ 的角度去写测试代码的时候，我们需要考虑的是，这个 ”测试用户“ 改如何使用功能代码呢？是通过一个类直接调用呢，还是构建类的实例去掉用方法呢？这个方法又如何传参？方法如何命名，方法有返回值吗？</p>\r\n<p><strong>有了测试代码之后，我们的需求应该也已经明确了，这时候我们针对测试代码编写功能代码，就是为实际需求编写功能代码，并且要以最快的速度让测试由  ”红“ 变为 ”绿“ 。（此时代码可能很不优雅，不过没关系）。</strong> </p>\r\n<p><strong>当测试代码通过之后，我们就可以放心大胆的对功能代码进行 ”重构“ 了 ---- 优化原来比较丑陋，臃肿，设计不佳的代码。（参考《重构》一书）。</strong></p>\r\n<p>TDD 意味着持续测试，持续重构，能够提升团队代码质量， 让我们对自己的代码充满信心（其实就是安全感）。</p>\r\n<p>不想 TDD 的人，要么脑袋足够清醒，对业务需求了然于胸，能够心算测试的各种 Case 和输入输出，要么，就是摸着石头过河 -- 走一步算一步。</p>\r\n<p>TDD 主要是确保两件事：</p>\r\n<ul>\r\n<li><strong>确保所有的需求都能被照顾到</strong>。</li>\r\n<li><strong>在代码不断增加和重构的过程中，可以检查所有的功能是否正确</strong>。</li>\r\n</ul>\r\n<p>TDD 是在间接考验你的设计能力。并且大量减少你的返工时间。</p>\r\n<p>为了遵循 TDD 而写的代码，容易进入一个误区： 代码是为了满足测试而用的，而忽略了实际的需求。</p>\r\n<p><strong>初接触 TDD 的人常犯下面的错误：</strong></p>\r\n<ol>\r\n<li>在声明测试方法后，便开始写实现代码；</li>\r\n<li>写完 “所有” 的测试代码才开始写实现；</li>\r\n<li>一次实现过多的代码（超出当前测试覆盖的业务）；</li>\r\n<li>从不重构；</li>\r\n<li>测试实现细节而不是接口行为；</li>\r\n</ol>\r\n<h2 id=\"tdd-\">TDD 的基本流程</h2>\r\n<p>TDD 的一般步骤是：<strong>红灯 -- 绿灯 -- 重构</strong>。</p>\r\n<p><img src=\"https://img-blog.csdnimg.cn/20200402172630624.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2l0Z3VhbmdpdA==,size_16,color_FFFFFF,t_70\" alt=\"在这里插入图片描述\"></p>\r\n<p><strong>基本过程可以拆分为下面六个步骤：</strong></p>\r\n<ol>\r\n<li>分析需求，把需求拆分为具体任务。</li>\r\n<li>从列表中取出一个任务，对其编写测试用例。</li>\r\n<li>由于还没有编写实际的代码，此时测试代码不可能通过（红）。</li>\r\n<li>编写对应的功能代码，尽快让测试通过（绿）。</li>\r\n<li>对代码进行重构，并保证测试通过。</li>\r\n<li>重复以上步骤。</li>\r\n</ol>\r\n<p><strong>TDD 比较关键的一步在于如何写出有效的测试代码，这里有四个原则可以参考：</strong></p>\r\n<ol>\r\n<li>测试应该模拟正常的使用过程。</li>\r\n<li>应该尽量做到分支覆盖。</li>\r\n<li>测试数据应该尽量包括真实数据，以及边界数据。</li>\r\n<li>测试语句和测试数据应该尽量简单，容易理解。</li>\r\n</ol>\r\n<h2 id=\"is-tdd-dead-\">Is TDD Dead?</h2>\r\n<p>TDD 自从被 Rails 大神、创始人 David Heinemeier Hansson 于 2014 年 提出，激起千层浪。各种人对此褒贬不一，Kent Beck、Martin Fowler、David Hansson 三人就这梗举行的系列对话（辩论），有视频和文字，非常精彩，值得细读。<a href=\"https://link.zhihu.com/?target=http%3A//martinfowler.com/articles/is-tdd-dead/\">Is TDD Dead?</a><br><img src=\"https://img-blog.csdnimg.cn/20200402173936398.png\" alt=\"在这里插入图片描述\"><br><img src=\"https://img-blog.csdnimg.cn/20200402174043438.png\" alt=\"在这里插入图片描述\"></p>\r\n<p>但是不管怎样，我们需要知道，TDD 不是银弹，它是一种开发方式，要区分适用 TDD 的场合，不使用 TDD 我们也能开发出工作良好的软件。</p>\r\n<p><strong>对我们大多数人来说，TDD 解决了：</strong></p>\r\n<p>1）我要开始写代码了，我从哪开始搞？ 搞个 main，还是 test？</p>\r\n<p>2）这个功能有点复杂，接口测试起来太麻烦，先搞个 UT。</p>\r\n<p>3）我不知道那个家伙的代码写的怎么样，以后会不会捅个篓子，要求他 TDD 好了，CodeReview          的时候也轻松点。</p>\r\n<p><strong>还有一种人</strong>：飞机上写几个小时代码，下来编译一遍过还没有 Bug 的人。你跳出来说，他没有 TDD，他 LowB，那你怕不是有毛病。</p>\r\n<p>总之一句话，不要听别人说 TDD 好不好，自己试试再说。之前参加过熊杰（《重构》译者）的一个 TDD训练营，他经常在群里面说一句话，并且我在参加完训练营后也十分认同，就是说，TDD 的感觉是靠练出来的。看再多的书，不如自己亲自多练几遍，就能找到答案。</p>\r\n<h2 id=\"-\">启发</h2>\r\n<p>在我们的 HIS 系统中，由于业务已经十分复杂，代码量也十分庞大，想要使用好 TDD 并不容易，但是在新系统中，我们完全可以考虑实践 TDD ，因为由于微服务拆分带来的好处，每个微服务的复杂度和代码量已经变得很少，独立的业务需求，更便于我们先编写测试，再实现代码。不久我们可能就会发现，生活变得美好起来。</p>', '## TDD 是什么\r\n\r\nTDD 是敏捷开发中的一项核心实践和技术，也是一种设计方法论。TDD 的原理是在开发功能代码之前，先编写单元测试用例代码，测试代码确定需要编写什么功能代码。\r\n\r\nTDD 的基本思路是通过测试来推动这个开发的过程，但测试开发并不是单纯的测试工作，而是把 需求分析，设计，质量控制量化的过程。\r\n\r\nTDD 的目的不仅仅是测试软件，保证代码质量仅仅是其中的一部分，更重要的是，在开发过程中帮助开发者除去模棱两可的需求。\r\n\r\nKent Beck 的著作《测试驱动开发》中说：\r\n\r\n> “测试驱动开发不是一种测试技术。它是一种分析技术、设计技术，更是一种组织所有开发活动的技术”。\r\n\r\n## 为什么要用 TDD\r\n\r\n通常情况下，我们都习惯在需求分析完成后，尽快投入到功能代码的编写工作中，之后再调试。而 TDD 则不太一样，它假设我们已经有一个 ”测试用户“ 了，它是功能代码的第一个使用者，尽管功能还不太完善。\r\n\r\n当我们站在 ”测试用户“ 的角度去写测试代码的时候，我们需要考虑的是，这个 ”测试用户“ 改如何使用功能代码呢？是通过一个类直接调用呢，还是构建类的实例去掉用方法呢？这个方法又如何传参？方法如何命名，方法有返回值吗？\r\n\r\n**有了测试代码之后，我们的需求应该也已经明确了，这时候我们针对测试代码编写功能代码，就是为实际需求编写功能代码，并且要以最快的速度让测试由  ”红“ 变为 ”绿“ 。（此时代码可能很不优雅，不过没关系）。** \r\n\r\n**当测试代码通过之后，我们就可以放心大胆的对功能代码进行 ”重构“ 了 ---- 优化原来比较丑陋，臃肿，设计不佳的代码。（参考《重构》一书）。**\r\n\r\nTDD 意味着持续测试，持续重构，能够提升团队代码质量， 让我们对自己的代码充满信心（其实就是安全感）。\r\n\r\n不想 TDD 的人，要么脑袋足够清醒，对业务需求了然于胸，能够心算测试的各种 Case 和输入输出，要么，就是摸着石头过河 -- 走一步算一步。\r\n\r\nTDD 主要是确保两件事：\r\n\r\n* **确保所有的需求都能被照顾到**。\r\n* **在代码不断增加和重构的过程中，可以检查所有的功能是否正确**。\r\n\r\nTDD 是在间接考验你的设计能力。并且大量减少你的返工时间。\r\n\r\n为了遵循 TDD 而写的代码，容易进入一个误区： 代码是为了满足测试而用的，而忽略了实际的需求。\r\n\r\n**初接触 TDD 的人常犯下面的错误：**\r\n\r\n1. 在声明测试方法后，便开始写实现代码；\r\n2. 写完 “所有” 的测试代码才开始写实现；\r\n3. 一次实现过多的代码（超出当前测试覆盖的业务）；\r\n4. 从不重构；\r\n5. 测试实现细节而不是接口行为；\r\n\r\n## TDD 的基本流程\r\n\r\nTDD 的一般步骤是：**红灯 -- 绿灯 -- 重构**。\r\n\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200402172630624.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2l0Z3VhbmdpdA==,size_16,color_FFFFFF,t_70)\r\n\r\n\r\n\r\n**基本过程可以拆分为下面六个步骤：**\r\n\r\n1. 分析需求，把需求拆分为具体任务。\r\n2. 从列表中取出一个任务，对其编写测试用例。\r\n3. 由于还没有编写实际的代码，此时测试代码不可能通过（红）。\r\n4. 编写对应的功能代码，尽快让测试通过（绿）。\r\n5. 对代码进行重构，并保证测试通过。\r\n6. 重复以上步骤。\r\n\r\n**TDD 比较关键的一步在于如何写出有效的测试代码，这里有四个原则可以参考：**\r\n\r\n1. 测试应该模拟正常的使用过程。\r\n2. 应该尽量做到分支覆盖。\r\n3. 测试数据应该尽量包括真实数据，以及边界数据。\r\n4. 测试语句和测试数据应该尽量简单，容易理解。\r\n\r\n## Is TDD Dead?\r\n\r\nTDD 自从被 Rails 大神、创始人 David Heinemeier Hansson 于 2014 年 提出，激起千层浪。各种人对此褒贬不一，Kent Beck、Martin Fowler、David Hansson 三人就这梗举行的系列对话（辩论），有视频和文字，非常精彩，值得细读。[Is TDD Dead?](https://link.zhihu.com/?target=http%3A//martinfowler.com/articles/is-tdd-dead/)\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200402173936398.png)\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200402174043438.png)\r\n\r\n但是不管怎样，我们需要知道，TDD 不是银弹，它是一种开发方式，要区分适用 TDD 的场合，不使用 TDD 我们也能开发出工作良好的软件。\r\n\r\n**对我们大多数人来说，TDD 解决了：**\r\n\r\n1）我要开始写代码了，我从哪开始搞？ 搞个 main，还是 test？\r\n\r\n2）这个功能有点复杂，接口测试起来太麻烦，先搞个 UT。\r\n\r\n3）我不知道那个家伙的代码写的怎么样，以后会不会捅个篓子，要求他 TDD 好了，CodeReview    	  的时候也轻松点。\r\n\r\n**还有一种人**：飞机上写几个小时代码，下来编译一遍过还没有 Bug 的人。你跳出来说，他没有 TDD，他 LowB，那你怕不是有毛病。\r\n\r\n总之一句话，不要听别人说 TDD 好不好，自己试试再说。之前参加过熊杰（《重构》译者）的一个 TDD训练营，他经常在群里面说一句话，并且我在参加完训练营后也十分认同，就是说，TDD 的感觉是靠练出来的。看再多的书，不如自己亲自多练几遍，就能找到答案。\r\n\r\n## 启发\r\n\r\n在我们的 HIS 系统中，由于业务已经十分复杂，代码量也十分庞大，想要使用好 TDD 并不容易，但是在新系统中，我们完全可以考虑实践 TDD ，因为由于微服务拆分带来的好处，每个微服务的复杂度和代码量已经变得很少，独立的业务需求，更便于我们先编写测试，再实现代码。不久我们可能就会发现，生活变得美好起来。', '2020-07-04 08:43:57', 0, 'TDD 是敏捷开发中的一项核心实践和技术，也是一种设计方法论。TDD 的原理是在开发功能代码之前，先编写单元测试用例代码，测试代码确定需要编写什么功能代码。', '/upload/2020/7/166809-1-768x512202007040843309.jpg', '浅谈测试驱动开发（TDD）', 0, 'post', 0, '2020-07-04 08:43:57', '1593823437', NULL);
INSERT INTO `mayday_article` VALUES (149, 9, '<p>哈哈哈</p>', '哈哈哈', '2020-07-04 08:49:25', 0, '哈哈哈', '/upload/2020/7/4ll3vy20200704084915597.jpg', '测试一下', 0, 'post', 0, '2020-07-04 08:49:25', '1593823765', NULL);
COMMIT;

-- ----------------------------
-- Table structure for mayday_article_category
-- ----------------------------
DROP TABLE IF EXISTS `mayday_article_category`;
CREATE TABLE `mayday_article_category` (
  `article_id` int(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  KEY `MAYDAY_ARTILE_ID` (`article_id`) USING BTREE,
  KEY `MAYDAY_ARTILE_CATEGORY_ID` (`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mayday_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `mayday_article_tag`;
CREATE TABLE `mayday_article_tag` (
  `article_id` int(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  KEY `MAYDAY_ARTILE_ID` (`article_id`) USING BTREE,
  KEY `MAYDAY_ARTILE_TAG_ID` (`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mayday_attachment
-- ----------------------------
DROP TABLE IF EXISTS `mayday_attachment`;
CREATE TABLE `mayday_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture_name` varchar(255) DEFAULT NULL COMMENT '图片名称',
  `picture_path` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `picture_small_path` varchar(255) DEFAULT NULL COMMENT '略缩图',
  `picture_type` varchar(255) DEFAULT NULL COMMENT '图片类型',
  `picture_create_date` varchar(255) DEFAULT NULL COMMENT '上传时间',
  `picture_size` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `picture_suffix` varchar(255) DEFAULT NULL COMMENT '后缀',
  `picture_wh` varchar(255) DEFAULT NULL COMMENT '尺寸',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mayday_attachment
-- ----------------------------
BEGIN;
INSERT INTO `mayday_attachment` VALUES (245, '53d07b97b659520200704084045289.jpg', '/upload/2020/7/53d07b97b659520200704084045289.jpg', '/upload/2020/7/53d07b97b659520200704084045289_small.jpg', 'image/jpeg', '2020-07-04 08:40:45.321', '282KB', '.jpg', '1920x1200');
INSERT INTO `mayday_attachment` VALUES (246, '166809-1-768x512202007040843309.jpg', '/upload/2020/7/166809-1-768x512202007040843309.jpg', '/upload/2020/7/166809-1-768x512202007040843309_small.jpg', 'image/jpeg', '2020-07-04 08:43:30.004', '44KB', '.jpg', '768x512');
INSERT INTO `mayday_attachment` VALUES (247, '4ll3vy20200704084915597.jpg', '/upload/2020/7/4ll3vy20200704084915597.jpg', '/upload/2020/7/4ll3vy20200704084915597_small.jpg', 'image/jpeg', '2020-07-04 08:49:15.202', '249KB', '.jpg', '1920x1200');
COMMIT;

-- ----------------------------
-- Table structure for mayday_category
-- ----------------------------
DROP TABLE IF EXISTS `mayday_category`;
CREATE TABLE `mayday_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `category_url` varchar(255) DEFAULT NULL COMMENT '分类路径',
  `category_describe` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mayday_link
-- ----------------------------
DROP TABLE IF EXISTS `mayday_link`;
CREATE TABLE `mayday_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `link_url` varchar(255) DEFAULT NULL COMMENT '路径',
  `link_logo` varchar(255) DEFAULT NULL COMMENT '链接logo',
  `link_describe` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mayday_logs
-- ----------------------------
DROP TABLE IF EXISTS `mayday_logs`;
CREATE TABLE `mayday_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `log_content` varchar(255) DEFAULT NULL COMMENT '内容',
  `log_ip` varchar(255) DEFAULT NULL COMMENT 'ip',
  `log_date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=909 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mayday_logs
-- ----------------------------
BEGIN;
INSERT INTO `mayday_logs` VALUES (892, '安装MAYDAY', '操作成功', '0:0:0:0:0:0:0:1', '2020-07-04 08:27:21');
INSERT INTO `mayday_logs` VALUES (893, '登录后台', '登录失败', '0:0:0:0:0:0:0:1', '2020-07-04 08:27:45');
INSERT INTO `mayday_logs` VALUES (894, '登录后台', '登录失败', '0:0:0:0:0:0:0:1', '2020-07-04 08:27:57');
INSERT INTO `mayday_logs` VALUES (895, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2020-07-04 08:28:53');
INSERT INTO `mayday_logs` VALUES (896, '登录后台', '登录失败', '0:0:0:0:0:0:0:1', '2020-07-04 08:29:03');
INSERT INTO `mayday_logs` VALUES (897, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2020-07-04 08:29:19');
INSERT INTO `mayday_logs` VALUES (898, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2020-07-04 08:30:41');
INSERT INTO `mayday_logs` VALUES (899, '登录后台', '登录成功', '0:0:0:0:0:0:0:1', '2020-07-04 08:34:43');
INSERT INTO `mayday_logs` VALUES (900, '登录后台', '登录成功', '127.0.0.1', '2020-07-04 08:36:29');
INSERT INTO `mayday_logs` VALUES (901, '上传附件', '上传成功', '127.0.0.1', '2020-07-04 08:40:46');
INSERT INTO `mayday_logs` VALUES (902, '发表文章', '操作成功', '127.0.0.1', '2020-07-04 08:41:25');
INSERT INTO `mayday_logs` VALUES (903, '上传附件', '上传成功', '127.0.0.1', '2020-07-04 08:43:30');
INSERT INTO `mayday_logs` VALUES (904, '发表文章', '操作成功', '127.0.0.1', '2020-07-04 08:43:57');
INSERT INTO `mayday_logs` VALUES (905, '登录后台', '登录成功', '127.0.0.1', '2020-07-04 08:47:58');
INSERT INTO `mayday_logs` VALUES (906, '登录后台', '登录成功', '127.0.0.1', '2020-07-04 08:48:28');
INSERT INTO `mayday_logs` VALUES (907, '上传附件', '上传成功', '127.0.0.1', '2020-07-04 08:49:15');
INSERT INTO `mayday_logs` VALUES (908, '发表文章', '操作成功', '127.0.0.1', '2020-07-04 08:49:25');
COMMIT;

-- ----------------------------
-- Table structure for mayday_menu
-- ----------------------------
DROP TABLE IF EXISTS `mayday_menu`;
CREATE TABLE `mayday_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `menu_name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `menu_sort` int(11) DEFAULT NULL COMMENT '排序',
  `menu_target` varchar(255) DEFAULT NULL COMMENT '打开方式',
  `menu_url` varchar(255) DEFAULT NULL COMMENT '菜单路径',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mayday_menu
-- ----------------------------
BEGIN;
INSERT INTO `mayday_menu` VALUES (34, NULL, '首页', 1, '_self', '/');
INSERT INTO `mayday_menu` VALUES (35, NULL, '归档', 2, '_self', '/archives');
INSERT INTO `mayday_menu` VALUES (36, NULL, '友链', 3, '_self', '/links');
COMMIT;

-- ----------------------------
-- Table structure for mayday_options
-- ----------------------------
DROP TABLE IF EXISTS `mayday_options`;
CREATE TABLE `mayday_options` (
  `option_name` varchar(255) NOT NULL COMMENT '设置名',
  `option_value` longtext COMMENT '设置内容',
  PRIMARY KEY (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mayday_options
-- ----------------------------
BEGIN;
INSERT INTO `mayday_options` VALUES ('attachment_location', 'server');
INSERT INTO `mayday_options` VALUES ('blog_name', '旅行日记');
INSERT INTO `mayday_options` VALUES ('blog_start', '2020-07-04');
INSERT INTO `mayday_options` VALUES ('blog_url', 'guang');
INSERT INTO `mayday_options` VALUES ('email_username', 'itguang@qq.com');
INSERT INTO `mayday_options` VALUES ('is_install', 'true');
COMMIT;

-- ----------------------------
-- Table structure for mayday_tag
-- ----------------------------
DROP TABLE IF EXISTS `mayday_tag`;
CREATE TABLE `mayday_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) DEFAULT NULL COMMENT '标签名称',
  `tag_url` varchar(255) DEFAULT NULL COMMENT '标签路径',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mayday_theme
-- ----------------------------
DROP TABLE IF EXISTS `mayday_theme`;
CREATE TABLE `mayday_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(255) DEFAULT NULL COMMENT '主题名(url)',
  `theme_describe` varchar(255) DEFAULT NULL COMMENT '主题描述',
  `theme_img` varchar(255) DEFAULT NULL COMMENT '主题预览图',
  `theme_status` int(11) DEFAULT '0' COMMENT '0未启用1已启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mayday_theme
-- ----------------------------
BEGIN;
INSERT INTO `mayday_theme` VALUES (26, 'pinghsu', 'pinghsu', '/static/img/pinghsu.jpg', 1, '2020-07-04 08:27:21');
COMMIT;

-- ----------------------------
-- Table structure for mayday_user
-- ----------------------------
DROP TABLE IF EXISTS `mayday_user`;
CREATE TABLE `mayday_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_enable` varchar(255) DEFAULT '0' COMMENT '是否禁用登录',
  `login_error` int(11) DEFAULT NULL COMMENT '登录失败次数',
  `login_last_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `user_portrait` varchar(255) DEFAULT NULL COMMENT '头像',
  `user_explain` varchar(255) DEFAULT NULL COMMENT '说明',
  `user_display_name` varchar(255) DEFAULT NULL COMMENT '显示名称',
  `user_email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `user_pwd` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mayday_user
-- ----------------------------
BEGIN;
INSERT INTO `mayday_user` VALUES (9, 'false', 0, '2020-07-04 08:48:28', NULL, NULL, '光光', 'itguang@qq.com', '小光光', 'e10adc3949ba59abbe56e057f20f883e');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
