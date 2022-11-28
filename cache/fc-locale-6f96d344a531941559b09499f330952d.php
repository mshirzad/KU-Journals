<?php return array (
  'emails.passwordResetConfirm.subject' => 'تائیدیه دوباره تنظیم کردن رمزعبور',
  'emails.passwordResetConfirm.body' => 'درخواستی مبنی بر تنظیم دوباره رمزعبور شما مربوط به وب سایت &amp;lt;$siteTitle&amp;gt; به ما رسیده است.<br />
<br />
لطفا چنانچه شما این درخواست را نفرستاده اید، به این ایمیل توجهی نکنید، در این صورت رمز عبور شما تغییری نخواهد کرد. اگر مایل به تنظیم دوباره رمزعبور خود هستید، برروی پیوند زیر کلیک نمائید.<br />
<br />
تنظیم مجدد رمز عبور: {$url}<br />
<br />
{$principalContactSignature}',
  'emails.passwordResetConfirm.description' => 'This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.',
  'emails.passwordReset.subject' => 'رمز عبور دوباره تنظیم شد',
  'emails.passwordReset.body' => 'رمزعبور شما برای استفاده از وب سایت {$siteTitle}، دوباره تنظیم شد. لطفا این کلمه کاربری و رمز عبور را محفوظ نگاه دارید، زیرا برای کارکردن با وب سایت مجله لازم است.<br />
<br />
نام کاربری شما: {$username}<br />
رمز ورود شما: {$password}<br />
<br />
{$principalContactSignature}',
  'emails.passwordReset.description' => 'ایمیلی برای کاربرانی که رمز خود را رست نموده اند',
  'emails.userRegister.subject' => 'ثبت نام کاربر جدید',
  'emails.userRegister.body' => 'برای ثبت نام در {$contextName} از شما سپاسگزارم. لطفا نام کاربری و رمز عبور خود را که برای ورود به وب سایت این مجله مورد نیاز می باشد به خاطر بسپارید.<br />
<br />
نام کاربری: {$username}<br />
رمز عبور: {$password}<br />
<br />
<br />
باتشکر<br />
{$principalContactSignature}',
  'emails.userRegister.description' => 'This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.',
  'emails.userValidate.subject' => 'حساب کاربری خود را تایید کنید',
  'emails.userValidate.body' => '{$userFullName}<br />
<br />
حساب کاربری شما برای مجله {$contextName}, ایجاد شد. قبل از استفاده می بایست آن را تایید کنید. برای انجام این کار فقط کافی است که بر روی لینک زیر کلیک کنید:<br />
<br />
<a href="{$activateUrl}">{$activateUrl}</a><br />
<br />
با تشکر<br />
{$principalContactSignature}',
  'emails.userValidate.description' => 'This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.',
  'emails.reviewerRegister.subject' => 'ثبت نام به عنوان کارشناس {$contextName}',
  'emails.reviewerRegister.body' => 'با توجه با تجارب جنابعالی, {$contextName} فرصت را مغتنم شمرده و نام شما را در زمره کارشناسان مجله ثبت کرده است. لازم به تذکر است که صرف این عمل هیچگونه مسئولیت و تعهدی را متوجه جنابعالی نمی سازد و فقط ما را قادر می سازد تا جهت ارسال مقاله برای کارشناسی احتمالی توسط جنابعالی براحتی با شما تماس بگیریم. هنگامی که از شما برای انجام کارشناسی یک مقاله دعوت به عمل می آید شما مختار خواهید بود که پس از دیدن عنوان و چکیده مقاله دعوت را بپذیرید یا از انجام کارشناسی خودداری کنید. بعلاوه در هر زمان که اراده کنید میتوانید از ما بخواهید تا نام شما را از لیست کارشناسان مجله حذف کنیم.<br />
<br />
نام کاربری و رمز عبور شما برای سایت مجله که جهت انجام تمام امورات آنلاین با این مجله لازم است در زیر آمده است.<br />
<br />
نام کاربری: {$username}<br />
رمز عبور: {$password}<br />
<br />
با تشکر,<br />
{$principalContactSignature}',
  'emails.reviewerRegister.description' => 'This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.',
  'emails.publishNotify.subject' => 'شماره جدید چاپ شد',
  'emails.publishNotify.body' => 'خوانندگان گرامی:<br />
<br />
{$contextName}، آخرین شماره خود را به نشانی &amp;lt;<a href="{$contextUrl}">{$contextUrl}</a>&amp;gt; چاپ کرده است. از شما دعوت میشود که پس از ملاحظه فهرست عناوین از وب سایت مجله حاوی مقاله ها و موضوع های مورد علاقه بازدید کنید.<br />
<br />
از توجه همیشگی مستمر شما نسبت به این مجله متشکریم.<br />
{$editorialContactSignature}',
  'emails.publishNotify.description' => 'This email is sent to registered readers via the "Notify Users" link in the Editor\'s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.',
  'emails.lockssNewArchive.subject' => 'درخواست بایگانی کردن {$contextName}:',
  'emails.lockssNewArchive.body' => 'مسئول محترم کتابخانه دانشگاه:<br />
{$contextName} &amp;lt;<a href="{$contextUrl}">{$contextUrl}</a>&amp;gt; ، عضو دانشکده شما می باشد &amp;lt;[name of member]&amp;gt;. این مجله خواستار ایجاد سیستم بایگانی LOCKSS با آن کتابخانه و کتابخانه های دیگر دانشگاهها می باشد.<br />
<br /><br />
<br />
برنامه LOCKSS تحت آدرس http://lockss.org که یک ابتکار بین المللی مربوط به ناشر/کتابخانه می باشد. این نرم افزار رایگان، حتی توسط یک رایانه شخصی نیز اجرا می گردد. کل سامانه آن لاین شده است و به نگهداری مختصری نیازمند است.<br />
جهت کمک در بایگانی مجله ما، از شما دعوت می کنیم که عضو انجمن LOCKSS شوید تا به شما در جمع آوری و نگهداری عناوین تهیه شده توسط سازمان خود و دیگر پژوهشگران جهان، کمک کند. برای این کار، لطفا از وب سایت LOCKSS بازدید کنید تا اطلاعاتی درباره نحوه عملکرد این سامانه دراختیار شما قرار گیرد. منتظر اعلام خبر از شما راجع به امکان تهیه چنین سامانه ای برای این مجله هستم.<br />
<br />
<br />
باتشکر<br />
{$principalContactSignature}',
  'emails.lockssNewArchive.description' => 'This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.',
  'emails.submissionAck.subject' => 'قدردانی برای ارسال مقاله',
  'emails.submissionAck.body' => '{$authorName}:<br />
<br />
از ارسال مقاله &quot;{$submissionTitle}&quot; به {$contextName} متشکرم. با استفاده از سامانه الکترونیکی مدیریت مجله، که هم اکنون استفاده می شود، قادر خواهید بود ازطریق وارد شدن به وب سایت مجله، روند پیشرفت بررسی مقاله خود را پیگیری نمائید.<br />
<br />
آدرس مقاله : {$submissionUrl}<br />
نام کاربری: {$authorUsername}<br />
<br />
لطفا چنانچه سوالی دارید، با من تماس بگیرید.<br />
<br />
{$editorialContactSignature}',
  'emails.submissionAck.description' => 'در صورت فعال سازی. این ایمیل به صورت خودکار به نوسنده مقاله پس از تکمیل عملیات ارسال مقاله، فرستاده خواهد شد.',
  'emails.submissionUnsuitable.subject' => 'نا مناسب بودن مقاله برای مجله',
  'emails.submissionUnsuitable.body' => '{$authorName}:<br />
<br />
بررسی اولیه انجام شده برروی مقاله &quot;{$submissionTitle}&quot; مشخص نموده است که این مقاله با چهارچوب و حیطه فعالیت {$contextName} مطابقت ندارد. توصیه می کنم که در راهنمای نویسندگان این مجله و همچنین در مقالات شماره اخیر جستجو کنید تا اطلاع بیشتری در مورد مقالات چاپ شده در این مجله کسب کنید.<br />
<br />
{$editorialContactSignature}',
  'emails.submissionUnsuitable.description' => '',
  'emails.submissionComment.subject' => 'اعلام نظر در مورد یک مقاله',
  'emails.submissionComment.body' => '{$name}:<br />
<br />
&amp;lt;{$commentName}&amp;gt;، در مورد مقاله &quot;{$submissionTitle}&quot; در مجله {$contextName} اعلام نظر کرده است.<br />
<br />
{$comments}',
  'emails.submissionComment.description' => 'This email notifies the various people involved in a submission\'s editing process that a new comment has been posted.',
  'emails.submissionDecisionReviewers.subject' => 'تصمیم گیری درمورد مقاله "{$submissionTitle}"',
  'emails.submissionDecisionReviewers.body' => 'به عنوان یکی از کارشناسان مقاله ارسالی &quot;{$submissionTitle}&quot;مربوط به {$contextName}، اینجانب نظرات داوری ارسال شده به نویسنده این متن را برای شما ارسال می کنم.<br />
باردیگر از شما به خاطر مشارکت فعالتان در این فرایند سپاسگزاری می کنم.<br />
<br />
{$editorialContactSignature}<br />
<br />
{$comments}',
  'emails.submissionDecisionReviewers.description' => 'This email notifies the reviewers of a submission that the review process has been completed. It includes information about the article and the decision reached, and thanks the reviewers for their contributions.',
  'emails.editorAssign.subject' => 'تعیین کارشناس مسئول',
  'emails.editorAssign.body' => '{$editorialContactName}:<br />
<br />
شما به عنوان کارشناس مسئول مقاله ضضض مربوط به {$contextName} انتخاب شده اید تا بر مراحل ویرایش آن نظارت داشته باشید.<br />
<br />
آدرس مقاله: {$submissionUrl}<br />
نام کاربری: {$editorUsername}<br />
<br />
متشکرم',
  'emails.editorAssign.description' => 'This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.',
  'emails.reviewRequest.subject' => 'درخواست کارشناسی مقاله',
  'emails.reviewRequest.body' => '{$reviewerName}:<br />
<br />
شما به عنوان یک کارشناس ممتاز برای بررسی مقاله &quot;{$submissionTitle}&quot;که برای {$contextName} ارسال شده است انتخاب شده اید. در ذیل، چکیده مقاله ارسالی برای شما گنجانده شده است و امیدوارم که در این زمینه مایل به همکاری با این مجله باشید<br />
<br />
لطفا قبل از تاریخ &quot;{$responseDueDate}&quot; وارد وب سایت مجله شده و مشخص کنید که آیا مایل به قبول کارشناسی مقاله هستید یا خیر. همچنین به طور همزمان می توانید به مقاله ارسالی دسترسی پیدا کرده و متن کارشناسی و توصیه های خودرا ذخیره کنید. آدرس وب سایت مجله <a href="{$contextUrl}">{$contextUrl}</a> است.<br />
<br />
ضمنا آخرین مهلت بررسی این مقاله تا تاریخ &quot;{$reviewDueDate}&quot; می باشد<br />
<br />
چنانچه نام کاربری و رمز عبور خود مربوط به وب سایت این مجله را در دسترس ندارید می توانید از پیوند زیر جهت تنظیم دوباره رمزعبور خود استفاده کنید (که به همراه نام کاربری برایتان ارسال می گردد).<br />
<br />
<a href="{$passwordResetUrl}">{$passwordResetUrl}</a><br />
آدرس مقاله : <a href="{$submissionReviewUrl}">{$submissionReviewUrl}</a><br />
<br />
از توجه شما به این درخواست سپاسگزاری می کنم.<br />
<br />
{$editorialContactSignature}',
  'emails.reviewRequest.description' => 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Journal Setup, Step 2. (Otherwise see REVIEW_REQUEST_ATTACHED.)',
  'emails.reviewRequestOneclick.subject' => 'درخواست داوری مقاله',
  'emails.reviewRequestOneclick.body' => '{$reviewerName}:<br />
<br />
شما به عنوان یک کارشناس ممتاز برای بررسی مقاله &quot;{$submissionTitle}&quot; که برای {$contextName} ارسال شده است انتخاب شده اید. در ذیل، چکیده مقاله ارسالی برای شما گنجانده شده است و امیدوارم که در این زمینه مایل به همکاری با این مجله باشید.<br />
<br />
لطفا قبل از تاریخ {$reviewDueDate} وارد وب سایت مجله شده و مشخص سازید که آیا مایل به قبول کارشناسی هستید یا خیر؟ همچنین به طور همزمان می توانید به مقاله ارسالی دسترسی پیدا کرده و متن کارشناسی و توصیه های خودرا ذخیره کنید.<br />
<br />
ضمنا آخرین مهلت بررسی این مقاله تا تاریخ {$reviewDueDate} می باشد.<br />
<br />
آدرس مقاله: <a href="{$submissionReviewUrl}">{$submissionReviewUrl}</a><br />
<br />
از توجه شما به این درخواست متشکرم.<br />
<br />
{$editorialContactSignature}<br />
<br />
<br />
--------------------------------<br />
&quot;{$submissionTitle}&quot;<br />
<br />
چکیده:<br />
{$submissionAbstract}',
  'emails.reviewRequestOneclick.description' => 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Journal Setup, Step 2, and one-click reviewer access is enabled.',
  'emails.reviewRequestAttached.subject' => 'درخواست داوری مقاله',
  'emails.reviewRequestAttached.body' => '{$reviewerName}:<br />
<br />
شما به عنوان یک داور برای بررسی مقاله &quot;{$submissionTitle}&quot; انتخاب شده اید. در ذیل، چکیده مقاله ارسالی برای شما گنجانده شده است و امیدوارم که در این زمینه مایل به همکاری با این مجله باشید.<br />
در ذیل متن راهنمای کارشناسی برای این مجله آمده است و مقاله ارسالی به این ایمیل پیوست شده است. توجه داشته باشید که باید متن کارشناسی و توصیه خود را تا تاریخ {$reviewDueDate} از طریق ایمیل ارسال کنید.<br />
<br />
لطفا با پاسخ دادن به این ایمیل قبل از تاریخ &amp;lt;{$reviewDueDate}&amp;gt; مشخص سازید که آیا قادر به انجام کارشناسی هستید یا خیر؟<br />
از توجه شما به این درخواست سپاسگزارم.<br />
<br />
{$editorialContactSignature}<br />
<br />
راهنمای داوری<br />
<br />
{$reviewGuidelines}',
  'emails.reviewRequestAttached.description' => 'ایمیلی از طرف دبیر یا دبیر بخش به داور برای درخواست انجام داوری',
  'emails.reviewCancel.subject' => 'درخواست لغو کارشناسی',
  'emails.reviewCancel.body' => '{$reviewerName}:<br />
<br />
در این مرحله تصمیم بر آن شده که درخواست کارشناسی مقاله ضضض مربوط به {$contextName} که به شما محول شده بود، لغو گردد. پیشاپیش از بابت ایجاد هرگونه مشکلی از شما عذرخواهی کرده و امیدواریم که در آینده بتوانیم طی مرحله کارشناسی با شما همکاری داشته باشیم.<br />
<br />
لطفا چنانچه در این رابطه سوالی دارید، با من تماس بگیرید.',
  'emails.reviewCancel.description' => 'This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.',
  'emails.reviewConfirm.subject' => 'داوری را قبول می کنم',
  'emails.reviewConfirm.body' => 'دبیر محترم:<br />
<br />
اینجانب داوری مقاله ارسالی &quot;{$submissionTitle}&quot;مربوط به {$contextName} را قبول می نمایم. از توجه شما متشکرم و بررسی آنرا در موعد مقرر ( {$reviewDueDate}) انجام خواهد داد.<br />
<br />
{$reviewerName}',
  'emails.reviewConfirm.description' => 'ایمیلی از طرف داور به سردبیر یا دبیر بخشبرای اطلاع از پذیرش انجام داوری',
  'emails.reviewDecline.subject' => 'قادر به داوری نمی باشم',
  'emails.reviewDecline.body' => 'دبیر محترم:<br />
<br />
متاسفانه در حال حاضر قادر به داوری مقاله ارسالی &quot;{$submissionTitle}&quot;مربوط به {$contextName} نیستم.<br />
از توجه شما متشکرم . در دفعات بعدی آماده همکاری با این مجله هستم.<br />
<br />
{$reviewerName}',
  'emails.reviewDecline.description' => 'ایمیلی از طرف داور به سردبیر یا دبیر بخش برای اطلاع از عدم پذیرش انجام داوری',
  'emails.reviewAck.subject' => 'قدردانی بخاطر بررسی مقاله',
  'emails.reviewAck.body' => '{$reviewerName}:<br />
<br />
برای بررسی مقاله ارسالی &quot;{$submissionTitle}&quot;مربوط به {$contextName}، از شما سپاسگزاریم. مساعدت شما را که باعث ارتقاء سطح کیفی مقاله ای که چاپ شد، ارج می نهیم.',
  'emails.reviewAck.description' => 'This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.',
  'emails.reviewRemindOneclick.subject' => 'یادآوری برای کارشناسی مقاله',
  'emails.reviewRemindOneclick.body' => '{$reviewerName}:<br />
<br />
با عرض پوزش بدین وسیله یادآوری مینمایم که متعاقب ارسال درخواست اولیه مبنی بر انجام کارشناسی مقاله &quot;{$submissionTitle},&quot; برای {$contextName}<br />
منتظر دریافت نظرات کارشناسی جنابعالی میباشیم. امیدواریم که نتیجه کارشناسی جنابعالی تا تاریخ {$reviewDueDate} به دست ما برسد.<br />
<br />
آدزس مقاله: <a href="{$submissionReviewUrl}">{$submissionReviewUrl}</a><br />
<br />
در صورت امکان با ایمیل اطلاع دهید که آیا مایلید این کارسناسی را انجام دهید.<br />
<br />
{$editorialContactSignature}',
  'emails.reviewRemindOneclick.description' => 'This email is sent by a Section Editor to remind a reviewer that their review is due.',
  'emails.reviewRemindAuto.subject' => 'یادآوری اتوماتیک برای کارشناسی مقاله ارسالی',
  'emails.reviewRemindAuto.body' => '{$reviewerName}:<br />
<br />
این فقط یک یادآوری درخواست ما از شما جهت بررسی مقاله ارسالی &quot;{$submissionTitle}&quot;مربوط به {$contextName} است. امیدوار بودیم که متن کارشناسی شما تا تاریخ &amp;lt;{$reviewDueDate}&amp;gt; دریافت نماییم و به دلیل اتمام فرصت مقرر، این ایمیل به صورت اتوماتیک برای شما فرستاده می شود. بسیار خوشحال خواهیم شد اگر هرچه زودتر بتوانید نتیجه کارشناسی خود را برایمان ارسال کنید.<br />
<br />
چنانچه نام کاربری و رمز عبور خود مربوط به وب سایت این مجله را در دسترس ندارید می توانید از پیوند زیر جهت تنظیم دوباره رمزعبور خود استفاده کنید (که به همراه نام کاربری برایتان ارسال می گردد).<br />
<br />
<a href="{$passwordResetUrl}">{$passwordResetUrl}</a><br />
آدرس مقاله: <a href="{$submissionReviewUrl}">{$submissionReviewUrl}</a><br />
<br />
لطفا آمادگی خودرا نسبت به انجام این کمک مهم به مجله اعلام نمائید. منتظر پاسخ شما هستم.<br />
<br />
{$editorialContactSignature}',
  'emails.reviewRemindAuto.description' => 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Journal Setup, Step 2) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).',
  'emails.reviewRemindAutoOneclick.subject' => 'یادآوری برای کارشناسی مقاله (اتوماتیک)',
  'emails.reviewRemindAutoOneclick.body' => '{$reviewerName}:<br />
<br />
با عرض پوزش بدین وسیله یادآوری مینمایم که متعاقب ارسال درخواست اولیه مبنی بر انجام کارشناسی مقاله &quot;{$submissionTitle},&quot; برای {$contextName}<br />
منتظر دریافت نظرات کارشناسی جنابعالی میباشیم. امیدواریم که نتیجه کارشناسی جنابعالی تا تاریخ {$reviewDueDate} به دست ما برسد.<br />
<br />
آدزس مقاله: <a href="{$submissionReviewUrl}">{$submissionReviewUrl}</a><br />
<br />
در صورت امکان با ایمیل اطلاع دهید که آیا مایلید این کارسناسی را انجام دهید.<br />
<br />
{$editorialContactSignature}',
  'emails.reviewRemindAutoOneclick.description' => 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Journal Setup, Step 2) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).',
  'emails.copyeditRequest.subject' => 'درخواست انجام امور ویراستاری',
  'emails.copyeditRequest.body' => '{$participantName}:<br />
<br />
از شما درخواست می شود که امور ویراستاری مقاله &quot;{$submissionTitle}&quot; مربوط به {$contextName} را برعهده بگیرید. شما می توانید فایل مربوطه به همراه مجموعه ای از دستورالعمل های نحوه ویراستاری مقاله را در وب سایت مجله دریافت کنید.<br />
<br />
چنانچه در حال حاضر قادر به انجام امور مذکور نیستید و یا سوالی در این زمینه دارید، لطفا با من تماس بگیرید. پیشاپیش از قبول انجام امور ویراستاری برای این مجله سپاسگزارم.',
  'emails.copyeditRequest.description' => 'This email is sent by a Section Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.',
  'emails.copyeditComplete.subject' => 'اتمام ویراستاری مقاله',
  'emails.copyeditComplete.body' => '{$editorialContactName}:<br />
<br />
هم اکنون ویراستاری مقاله جنابعالی با عنوان &quot;{$submissionTitle}&quot; برای مجله {$contextName} به پایان رسید. برای بررسی نتیجه ویراستاری و پاسخ دادن به سؤالات احتمالی لطفا مراحل زیر را دنبال کنید:<br />
<br />
۱. با استفاده از نام کاربری و رمز عبور خود و بکمک لینک زیر وارد سایت مجله شوید (در صورت فراموش کردن نام کاربری یا رمز عبور از گزینه مربوط به فراموشی رمز  عبور استفاده کنید)<br />
۲. بر روی فایل موجود در مرحله اول ویراستاری کلیک کنید و آنرا دانلود کنید. پس از دانلود آنرا باز کنید.<br />
۳. مقاله را بدقت مطالعه کرده و قسمتهای ویراستاری شده را بررسی کنید. لازم به ذکر است که در فایل ورد ارسالی تغییرات اعمال شده با رنگ و علائم مخصوص براحتی قابل تشخیص است. ویراستار ممکن است در متن مقاله سؤالاتی کرده باشد که لازم است بدقت به آنها جواب دهید.<br />
۴. پس از وارد کردن پاسخ سؤالات<br />
5. فایل را دخیره کرده و آپلود نمایید<br />
<br />
آدرس مقاله: <a href="{$submissionEditingUrl}">{$submissionEditingUrl}</a><br />
<br />
{$participantName}',
  'emails.copyeditComplete.description' => '',
  'emails.copyeditFinalRequest.subject' => 'بررسی نهایی ویراستاری',
  'emails.copyeditFinalRequest.body' => '{$participantName}:<br />
<br />
مراحل ویراستاری مقاله &quot;{$submissionTitle}&quot;مربوط به {$contextName} توسط نویسنده و سردبیر مربوطه کامل شده است. هم اکنون نسخه بدون اشکال نهایی آماده انجام امور صفحه آرایی می باشد.<br />
<br />
آدرس مقاله: <a href="{$submissionUrl}">{$submissionUrl}</a><br />
نام کاربری: {$participantUsername}<br />
<br />
<br />
{$editorialContactSignature}',
  'emails.copyeditFinalRequest.description' => 'This email from the Section Editor to the Copyeditor requests that they perform a final round of copyediting on a submission before it enters the layout process.',
  'emails.copyeditFinalComplete.subject' => 'بررسی نهایی ویراستاری کامل شد',
  'emails.copyeditFinalComplete.body' => '{$editorialContactName}:<br />
<br />
در حال حاضر، یک نسخه ویراستاری شده ی بدون اشکال از مقاله شما با عنوان {$submissionTitle}مربوط به {$contextName} آماده شده و آماده انجام امور صفحه آرایی و نسخه پیش از چاپ می باشد.<br />
<br />
{$participantName}',
  'emails.copyeditFinalComplete.description' => 'This email from the Copyeditor to the Section Editor notifies them that the final round of copyediting has been completed and that the layout process may now begin.',
  'emails.layoutRequest.subject' => 'نسخه های پیش از چاپ مورد نیاز است',
  'emails.layoutRequest.body' => '{$participantName}:<br />
<br />
از شما درخواست می شود که نسخه های پیش از چاپ مقاله &quot;{$submissionTitle}&quot; مربوط به {$contextName} را آماده نمایید.<br />
<br />
آدرس مقاله: <a href="{$submissionUrl}">{$submissionUrl}</a><br />
نام کاربری: {$participantUsername}<br />
<br />
چنانچه در حال حاضر قادر به انجام این امور نیستید و یا سوالی در این رابطه دارید با من تماس بگیرید. پیشاپیش از همکاری شما با این مجله سپاسگزارم.',
  'emails.layoutRequest.description' => 'This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.',
  'emails.layoutComplete.subject' => 'نسخه های پیش از چاپ کامل شده است',
  'emails.layoutComplete.body' => '{$editorialContactName}:<br />
<br />
نسخه های پیش از چاپ مقاله ضضض مربوط به {$contextName} حاضر شده و آماده بررسی نهایی می باشد.<br />
لطفا چنانچه سوالی دارید، با من تماس بگیرید.<br />
<br />
<br />
{$participantName}',
  'emails.layoutComplete.description' => 'This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.',
  'emails.layoutAck.subject' => 'قدردانی بخاطر انجام امور صفحه آرایی',
  'emails.layoutAck.body' => '{$participantName}:<br />
<br />
از اینکه نسخه پیش از چاپ مقاله &quot;{$submissionTitle}&quot;مربوط به {$contextName} را آماده نمودید از شما متشکرم. بدیهی است این امر کمک شایانی در روند چاپ خواهد بود.<br />
<br />
<br />
{$editorialContactSignature}',
  'emails.layoutAck.description' => 'This email from the Section Editor to the Layout Editor acknowledges completion of the layout editing process and thanks the layout editor for their contribution.',
  'emails.proofreadAuthorRequest.subject' => 'درخواست بررسی نهایی از نویسنده',
  'emails.proofreadAuthorRequest.body' => '{$authorName}:<br />
<br />
از شما درخواست می شود که نمونه پیش از چاپ مقاله ارسالی خود را تحت عنوان ضضض مربوط به {$contextName}، مورد بررسی نهایی قراردهید. لطفا برای دیدن نمونه های پیش از چاپ، بوسیله پیوند زیر وارد وب سایت مجله شوید. جهت فقط خواندن موارد غلط های املایی و صفحه آرایی در نسخه ای که چاپ خواهد شد، از پیوند VIEW PROOF استفاده کنید. این غلط ها را در کادر اطلاعات نمونه خوانی ذخیره کرده و طبق دستورالعمل های مربوط به بررسی نهایی (نمونه خوانی) که در وب سایت گنجانده شده است، عمل نمایید.<br />
<br />
آدرس مقاله: {$submissionUrl}<br />
<br />
چنانچه در حال حاضر قادر به انجام موارد فوق نیستید و یا در این رابطه سوالی دارید با من تماس بگیرید. پیشاپیش از همکاری شما با این مجله سپاسگزارم.<br />
<br />
<br />
<br />
{$editorialContactSignature}',
  'emails.proofreadAuthorRequest.description' => 'This email from the Section Editor to the Author notifies them that an article\'s galleys are ready for proofreading. It provides information about the article and how to access it.',
  'emails.proofreadAuthorComplete.subject' => 'بررسی نهایی کامل شد (نویسنده)',
  'emails.proofreadAuthorComplete.body' => 'بررسی نهایی کامل شد (نویسنده)',
  'emails.proofreadAuthorComplete.description' => 'This email from the Author to the Proofreader and Editor notifies them that the Author\'s round of proofreading is complete and that details can be found in the article comments.',
  'emails.proofreadAuthorAck.subject' => 'قدردانی از نویسنده بخاطر بررسی نهایی مقاله',
  'emails.proofreadAuthorAck.body' => '{$authorName}:<br />
<br />
بخاطر بررسی نهایی مقاله خود تحت عنوان &quot;{$submissionTitle}&quot; مربوط به {$contextName} از شما متشکریم. منتظر آن هستیم تا مقاله شما بزودی چاپ گردد. چنانچه مشترک خدمات اطلاع رسانی مجله ما باشید، ایمیلی حاوی فهرست مطالب را دریافت خواهید کرد. لطفا چنانچه سوالی دارید، با من تماس بگیرید.<br />
<br />
{$editorialContactSignature}',
  'emails.proofreadAuthorAck.description' => 'This email from the Section Editor to the Author acknowledges completion of the initial proofreading process and thanks them for their contribution.',
  'emails.proofreadRequest.subject' => 'درخواست بررسی نهایی',
  'emails.proofreadRequest.body' => '{$proofreaderName}:<br />
<br />
از شما درخواست می شود که بررسی نهایی مقاله &quot;{$submissionTitle}&quot; مربوط به {$contextName} را انجام دهید.<br />
<br />
آدرس مقاله: {$submissionUrl}<br />
نام کاربری: {$proofreaderUsername}<br />
<br />
چنانچه در حال حاضر قادر به انجام موارد فوق نیستید و یا در این رابطه سوالی دارید، با من تماس بگیرید.<br />
<br />
{$editorialContactSignature}',
  'emails.proofreadRequest.description' => 'This email from the Section Editor to the Proofreader requests that they perform proofreading of an article\'s galleys. It provides information about the article and how to access it.',
  'emails.proofreadComplete.subject' => 'بررسی نهایی کامل شد',
  'emails.proofreadComplete.body' => '{$editorialContactName}:<br />
<br />
درحال حاضر بررسی نهایی مقاله &quot;{$submissionTitle}&quot;مربوط به {$contextName} را به پایان رسانده ام. هم اکنون نمونه های پیش از چاپ، آماده اعمال تصحیح نهایی توسط صفحه آرا می باشد.<br />
<br />
{$proofreaderName}',
  'emails.proofreadComplete.description' => 'This email from the Proofreader to the Section Editor notifies them that the Proofreader has completed the proofreading process.',
  'emails.proofreadAck.subject' => 'قدردانی بخاطر انجام نمونه خوانی (بررسی نهایی)',
  'emails.proofreadAck.body' => '{$proofreaderName}:<br />
<br />
به خاطر بررسی نمونه پیش از چاپ مقاله &quot;{$submissionTitle}&quot;مربوط به {$contextName} از شما متشکرم. بدیهی است این امر کمک شایانی در جهت ارتقاء سطح کیفی این مجله خواهد بود.<br />
<br />
{$editorialContactSignature}',
  'emails.proofreadAck.description' => 'This email from the Section Editor to the Proofreader confirms completion of the proofreader\'s proofreading process and thanks them for their contribution.',
  'emails.proofreadLayoutComplete.subject' => 'اتمام بررسی نهایی (از طرف صفحه آرا)',
  'emails.proofreadLayoutComplete.body' => '{$editorialContactName}:<br />
<br />
اصلاح نمونه های پیش از چاپ مقاله &quot;{$submissionTitle}&quot;مربوط به {$contextName} تمام شده است. هم اکنون این قسمت آماده چاپ می باشد.<br />
<br />
<br />
{$participantName}',
  'emails.proofreadLayoutComplete.description' => 'This email from the Layout Editor to the Section Editor notifies them that the final stage of proofreading has been completed and the article is now ready to publish.',
  'emails.proofreadLayoutAck.subject' => 'قدردانی بخاطر بررسی نهایی مقاله (از صفحه آرا)',
  'emails.proofreadLayoutAck.body' => '{$participantName}:<br />
<br />
به خاطر اصلاح نهایی نمونه های پیش از چاپ مقاله &quot;{$submissionTitle}&quot;مربوط به {$contextName} از شما متشکرم. این امر، کمک شایان توجهی درجهت ارتقاء سطح کیفی مجله می باشد.<br />
<br />
{$editorialContactSignature}',
  'emails.proofreadLayoutAck.description' => 'This email from the Section Editor to the Layout Editor acknowledges completion of the final stage of proofreading and thanks them for their contribution.',
  'emails.emailLink.subject' => 'شاید مایل به دیدن این مقاله باشید',
  'emails.emailLink.body' => 'به نظر می رسد که شما مایل به ملاحظه مقاله {$authorName}تحت عنوان &quot;{$submissionTitle}&quot; باشید. این مقاله در شماره &amp;lt;{$volume}&amp;gt; جلد &amp;lt;$number&amp;gt; سال &amp;lt;{$year}&amp;gt; {$contextName} به چاپ رسیده است.<br />
<br />
آدرس مقاله:<br />
<a href="{$articleUrl}">{$articleUrl}</a>',
  'emails.emailLink.description' => 'This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.',
  'emails.subscriptionNotify.subject' => 'اعلام اشتراک مجله',
  'emails.subscriptionNotify.body' => '{$subscriberName}:<br />
<br />
درحال حاضر شما به عنوان مشترک {$contextName}، با ویژگی های اشتراکی زیر در سامانه الکترونیکی مدیریت مجله ی ما ثبت نام شده اید:<br />
<br />
{$subscriptionType}<br />
<br />
به منظور دستیابی به محتویات که فقط برای مشترکان در دسترس می باشد، براحتی با استفاده از نام کاربری تان &amp;lt;{$username}&amp;gt; در این سامانه واردشوید.<br />
<br />
بلافاصله پس از ورود به این سامانه، می توانید جزئیات اشتراک خود و رمز عبورتان را تغییر بدهید.<br />
لطفا توجه کنید درصورتی که دارای اشتراک سازمانی باشید، نیازی به ورود به سیستم ندارید، زیرا این سامانه بصورت اتوماتیک درخواست های اشتراک را تایید می کند.<br />
لطفا در صورت وجود سوال در این زمینه، با من تماس بگیرید.<br />
<br />
{$subscriptionContactSignature}',
  'emails.subscriptionNotify.description' => 'This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal\'s URL along with instructions for access.',
  'emails.openAccessNotify.subject' => 'اکنون مجله قابل دسترس است',
  'emails.openAccessNotify.body' => 'خوانندگان گرامی:<br />
<br />
{$contextName}، شماره جاری خود را بصورت دسترسی آزاد (Open Access) در اختیار خوانندگان قرار داده است. از شما دعوت میگردد که پس از ملاحظه فهرست مقالات در ذیل این نامه، به منظور بررسی مقالات و موضوع های مورد علاقه، از وب سایت مجله دیدن فرمایید.<br />
<br />
از توجه همیشگی شما نسبت به این مجله متشکریم.<br />
<br />
آدرس وب سایت مجله: <a href="{$contextUrl}">{$contextUrl}</a><br />
<br />
{$editorialContactSignature}',
  'emails.openAccessNotify.description' => 'This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.',
  'emails.subscriptionBeforeExpiry.subject' => 'یادآوری پایان یافتن مدت اشتراک',
  'emails.subscriptionBeforeExpiry.body' => '{$subscriberName}:<br />
<br />
اشتراک {$contextName} برای شما درحال اتمام می باشد.<br />
<br />
{$subscriptionType}<br />
jhvdo hkrqh: {$expiryDate}<br />
<br />
به منظور اطمینان از دسترسی تان به این مجله، لطفا به وب سایت مجله مراجعه کرده و اشتراک خود را تمدید کنید. شما می توانید که با نام کاربری خود &amp;lt;نام کاربری&amp;gt; وارد این سامانه شوید.<br />
<br />
لطفا در صورت وجود سوال در این زمینه، با من تماس بگیرید.<br />
<br />
{$subscriptionContactSignature}',
  'emails.subscriptionBeforeExpiry.description' => 'This email notifies a subscriber that their subscription will soon expire. It provides the journal\'s URL along with instructions for access.',
  'emails.subscriptionAfterExpiry.subject' => 'مدت اشتراک شما پایان یافته است',
  'emails.subscriptionAfterExpiry.body' => '{$subscriberName}:<br />
<br />
اشتراک {$contextName} برای شما به پایان رسیده است.<br />
<br />
{$subscriptionType}<br />
تاریخ انقضاء: {$expiryDate}<br />
<br />
به منظور تجدید اشتراک خود، لطفا به وب سایت مجله مراجعه نمائید. شما قادر خواهید بود که با استفاده از نام کاربری خود &amp;lt;نام کاربری&amp;gt; وارد این سامانه شوید.<br />
<br />
لطفا در صورت وجود سوال در این زمینه، با من تماس بگیرید.<br />
<br />
{$subscriptionContactSignature}',
  'emails.subscriptionAfterExpiry.description' => 'This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.',
  'emails.subscriptionAfterExpiryLast.subject' => 'اشتراک شما پایان یافت-آخرین یادآوری',
  'emails.subscriptionAfterExpiryLast.body' => '{$subscriberName}:<br />
<br />
اشتراک {$contextName} برای شما به پایان رسیده است.لطفا توجه کنید که این آخرین یادآوری است که برای شما ارسال خواهد شد.<br />
<br />
{$subscriptionType}<br />
تاریخ انقضاء: {$expiryDate}<br />
<br />
به منظور تجدید اشتراک خود، لطفا به وب سایت مجله مراجعه نمائید. شما قادر خواهید بود که با استفاده از نام کاربری خود &amp;lt;نام کاربری&amp;gt; وارد شوید.<br />
<br />
لطفا در صورت وجود سوال در این زمینه، با من تماس بگیرید.<br />
<br />
{$subscriptionContactSignature}',
  'emails.subscriptionAfterExpiryLast.description' => 'This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.',
  'emails.copyeditAck.subject' => 'تشکر بخاطر ویراستاری ({$submissionId})',
  'emails.copyeditAck.body' => '{$participantName}:<br />
<br />
از اینکه زحمت کشیده و مقاله &quot;{$submissionTitle},&quot; را برای مجله {$contextName} ویرایش کردید متشکرم.<br />
این اقدام شما به منزله کمک بزرگی در راه ارتقا مجله میباشد.<br />
<br />
{$editorialContactSignature}',
  'emails.copyeditAck.description' => 'This email is sent by the Section Editor to a submission\'s Copyeditor to acknowledge that the Copyeditor has successfully completed the copyediting process and thank them for their contribution.',
  'emails.copyeditAuthorRequest.subject' => 'درخواست بررسی مقاله ویرایش شده ({$submissionId})',
  'emails.copyeditAuthorRequest.body' => '{$authorName}:<br />
<br />
مقاله شما با عنوان<br />
&quot;{$submissionTitle}&quot;<br />
ارسال شده به مجله<br />
{$contextName}<br />
مرحله اول ویرایش را پشت سر گذاشت و اکنون برای بررسی و اظهار نظر جنابعالی آماده است. برای این منظور مراحل زیر را دنبال کنید:<br />
<br />
بر روی لینک ارسال شده مقاله در قسمت زیر کلیک کنید. صفحه ورودی مجله ظاهر میشود<br />
با استفاده از نام کاربری و رمز ورود خود وارد سایت مجله شوید و سپس بر روی لینک واقع فایل در مرحله یک کلیک کنید تا آنرا دانلود کنید<br />
مقاله دانلود شده را باز کرده ومتن آنرا مخصوصا قسمتهائی که توسط ویراستار حذف, اضافه شده یا تغییر یافته بدقت مطالعه کنید. همچنین به سؤالاتی که از شما شده است پاسخ دهید.<br />
هر گونه تغییر که لازم میدانید در متن بدهید تا آنرا مناسب تر کنید.<br />
پس از تکمیل مقاله را ذخیره و آنرا در مرحله دوم بارگذاری کنید<br />
بر روی فراداده های مقاله کلیک کنید تا آنرا نیز بررسی و تصحیح کنید.<br />
بر روی شکلک زیر عبارت کامل شد کلیک کرده و ایمیل باز شده را ارسال کنید. این ایمیل برای ویراستار و دبیر مقاله خواهد رفت<br />
<br />
آدزس مقاله:<br />
<a href="{$submissionUrl}">{$submissionUrl}</a><br />
<br />
لطفا توجه فرمائید که این آخرین فرصت برای شما جهت اعمال تغییرات قابل توجه در مقاله میباشد. در مرحله بازبینی که متعاقب صفحه آرائی خواهد آمد فقط امکان تغییرات جزئی وجود دارد.<br />
<br />
چنانچه در حال حاضر به علت گرفتاری قادر به انجام این کار نیستید و یا هر سؤال دیگری دارید, لطفا مرا در جریان بگذارید.<br />
از اینکه با ما همکاری میکنید متشکریم<br />
<br />
{$editorialContactSignature}',
  'emails.copyeditAuthorRequest.description' => 'This email is sent by the Section Editor to a submission\'s Author to request that they proofread the work of the copyeditor. It provides access information for the manuscript and warns that this is the last opportunity the author has to make substantial changes.',
  'emails.copyeditAuthorComplete.subject' => 'بررسی مقاله ویرایش شده به اتمام رسید ({$submissionId})',
  'emails.copyeditAuthorComplete.body' => '{$editorialContactName}:<br />
<br />
&quot;{$submissionTitle}&quot;<br />
{$contextName}<br />
<br />
هم اکنون بررسی مقاله ویرایش شده را به اتمام رساندم و اعلام میدارم که این مقاله آماده برای آخرین دور ویراستاری و ارسال برای صفحه آرائی میباشد.<br />
<br />
با تشکر<br />
{$authorName}',
  'emails.copyeditAuthorComplete.description' => 'This email is sent by the Author to the Section Editor to notify them that the Author\'s copyediting process has been completed.',
  'emails.copyeditAuthorAck.subject' => 'تشکر بخاطر بررسی مقاله ویرایش شده ({$submissionId})',
  'emails.copyeditAuthorAck.body' => '{$authorName}:<br />
<br />
&quot;{$submissionTitle}&quot;<br />
{$contextName}<br />
<br />
از اینکه مقاله ویرایش شده را بررسی کردید متشکرم. هماکنون مقاله شما برای صفحه آرائی ارسال میشود.<br />
<br />
{$editorialContactSignature}',
  'emails.copyeditAuthorAck.description' => 'This email is sent by the Section Editor to a submission\'s Author to confirm completion of the Author\'s copyediting process and thank them for their contribution.',
  'emails.copyeditFinalAck.subject' => 'تشکر بخاطر انجام آخرین مرحله ویراستاری ({$submissionId})',
  'emails.copyeditFinalAck.body' => '{$participantName}:<br />
<br />
&quot;{$submissionTitle}&quot;<br />
{$contextName}<br />
<br />
از اینکه آخرین مرحله ویرایش مقاله را انجام دادید متشکرم. این اقدام مرحله ای مهم در روند ادیتوریال میباشد.<br />
<br />
{$editorialContactSignature}',
  'emails.copyeditFinalAck.description' => 'This email from the Section Editor to the Copyeditor acknowledges completion of the final round of copyediting and thanks them for their contribution.',
  'emails.reviewRemind.subject' => 'یادآوری داوری مقاله ارسالی',
  'emails.reviewRemind.body' => '{$reviewerName}:<br />
<br />
این فقط یک یادآوری درخواست {$contextName} از شما جهت بررسی مقاله ارسالی &quot;{$submissionTitle}&quot;است. امیدوار بودیم که متن داوری شما تا تاریخ &amp;lt;{$reviewDueDate}&amp;gt; به مجله ارسال شده باشد و بسیار خوشحال خواهیم شد اگر هرچه زودتر بتوانید آنرا آماده کرده و نسبت به ارسال آن اقدام کنید.<br />
<br />
چنانچه نام کاربری و رمز عبور خود مربوط به وب سایت این مجله را در دسترس ندارید، می توانید از پیوند زیر جهت دوباره تنظیم کردن رمزعبور خود استفاده کنید (که به همراه نام کاربری برایتان ارسال می گردد).<br />
<br />
<a href="{$passwordResetUrl}">{$passwordResetUrl}</a><br />
آدرس مقاله: <a href="{$submissionReviewUrl}">{$submissionReviewUrl}</a><br />
<br />
لطفا آمادگی خودرا نسبت به انجام این کمک مهم به مجله اعلام نمائید. منتظر پاسخ شما هستیم.<br />
<br />
{$editorialContactSignature}',
  'emails.reviewRemind.description' => 'ایمیلی از طرف دبیر یا دبیر بخش به داور برای یادآوری انجام داوری',
  'emails.lockssExistingArchive.subject' => 'تقاضای آزشیو برای {$contextName}',
  'emails.lockssExistingArchive.body' => 'مسئول محترم کتابخانه<br />
<br />
مجله {$contextName} &amp;lt;<a href="{$contextUrl}">{$contextUrl}</a>&amp;gt;, مجله ای است که یکی از اعضای آن مؤسسه  (بنام فلان) در آن عضو میباشد. این مجله متقاضی آرشیو شدن محتوایش در یک سایت LOCKSS میباشد. خواهشمند است مساعدت فرموده و این مجله را در سیستم خود آرشیو کنید.rsity libraries.<br />
<br />
[توضیح مختصری از مجله]<br />
<br />
آدرس وبی برای مانیفست ناشری LOCKSS مجله ما بقرار زیر است:<br />
<a href="{$contextUrl}">{$contextUrl}</a>/gateway/lockss<br />
<br />
از آنجائیکه شما عضو شبکه LOCKSS هستید خواهشمند است مساعدت فرموده و ما را در آرشیو خود ذخیره فرمائید.<br />
با تشکر<br />
{$principalContactSignature}',
  'emails.lockssExistingArchive.description' => 'This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal\'s LOCKSS Publisher Manifest.',
  'emails.notification.subject' => 'فرم اطلاع رسانی جدید {$siteTitle}',
  'emails.notification.body' => 'شما یک فرم اطلاع رسانی جدید از {$siteTitle} دارید<br />
<br />
لینک: {$url}<br />
<br />
{$principalContactSignature}',
  'emails.notification.description' => '',
  'emails.editorDecisionAccept.subject' => 'تصمیم دبیر',
  'emails.editorDecisionAccept.body' => '{$authorName}:<br />
<br />
در مورد مقاله ارسالی شما (&quot;{$submissionTitle}&quot;) در {$contextName} تصمصم نهایی اتخاذ شده است.<br />
<br />
تصمیم نهایی: پذیرش مقاله ارسالی',
  'emails.editorDecisionAccept.description' => 'ایمیلی از طرف سردبیر یا دبیر بخش به نویسنده برای اطلاع از پذیرش مقاله',
  'emails.editorDecisionRevisions.subject' => 'تصمیم دبیر',
  'emails.editorDecisionRevisions.body' => '{$authorName}:<br />
<br />
در مورد مقاله ارسالی شما (&quot;{$submissionTitle}&quot;) در {$contextName} تصمصم نهایی اتخاذ شده است.<br />
<br />
تصمیم : مقاله ارسالی نیاز به انجام اصلاحات دارد',
  'emails.editorDecisionRevisions.description' => 'ایمیلی از طرف سردبیر یا دبیر بخش به نویسنده برای اطلاع ازنیازمندی مقاله به اعمال مجموعه ای از اصلاحات',
  'emails.editorDecisionResubmit.subject' => 'تصمیم دبیر',
  'emails.editorDecisionResubmit.body' => '{$authorName}:<br />
<br />
در مورد مقاله ارسالی شما (&quot;{$submissionTitle}&quot;) در {$contextName} تصمصم نهایی اتخاذ شده است.<br />
<br />
تصمیم نهایی: ارسال دوباره برای داوری',
  'emails.editorDecisionResubmit.description' => 'ایمیلی از طرف سردبیر یا دبیر بخش به نویسنده برای اطلاع از ارسال دوباره مقاله برای داوری',
  'emails.editorDecisionDecline.subject' => 'تصمیم دبیر',
  'emails.editorDecisionDecline.body' => '{$authorName}:<br />
<br />
در مورد مقاله ارسالی شما (&quot;{$submissionTitle}&quot;) در {$contextName} تصمصم نهایی اتخاذ شده است.<br />
<br />
تصمیم نهایی: عدم پذیرش مقاله ارسالی',
  'emails.editorDecisionDecline.description' => 'ایمیلی از طرف سردبیر یا دبیر بخش به نویسنده برای اطلاع از عدم پدیرش پذیرش مقاله',
  'emails.subscriptionPurchaseIndl.subject' => 'خرید اشتراک شخصی',
  'emails.subscriptionPurchaseIndl.body' => 'An individual subscription has been purchased online for {$contextName} with the following details.<br />
<br />
Subscription Type:<br />
{$subscriptionType}<br />
<br />
کاربر:<br />
{$userDetails}<br />
<br />
اطلاعات عضویت در صورت موجود بودن:<br />
{$membership}<br />
<br />
برای دیدن یا ویرایش این اشتراک لطفا به آدرس زیر بروید.<br />
<br />
Subscription URL: <a href="{$subscriptionUrl}">{$subscriptionUrl}</a>',
  'emails.subscriptionPurchaseIndl.description' => '',
  'emails.subscriptionPurchaseInstl.subject' => 'خرید اشتراک سازمانی',
  'emails.subscriptionPurchaseInstl.body' => 'An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />
<br />
Subscription Type:<br />
{$subscriptionType}<br />
<br />
Institution:<br />
{$institutionName}<br />
{$institutionMailingAddress}<br />
<br />
Domain (if provided):<br />
{$domain}<br />
<br />
IP Ranges (if provided):<br />
{$ipRanges}<br />
<br />
مسئول تماس:<br />
{$userDetails}<br />
<br />
اطلاعات عضویت در صورت وجود:<br />
{$membership}<br />
<br />
برای مشاهده یا ویرایش این اشتراک به آدرس زیر بروید.<br />
<br />
آدرس اشتراک: <a href="{$subscriptionUrl}">{$subscriptionUrl}</a>',
  'emails.subscriptionPurchaseInstl.description' => '',
  'emails.subscriptionRenewIndl.subject' => 'تمدید اشتراک شخصی',
  'emails.subscriptionRenewIndl.body' => 'An individual subscription has been renewed online for {$contextName} with the following details.<br />
<br />
Subscription Type:<br />
{$subscriptionType}<br />
<br />
کاربر:<br />
{$userDetails}<br />
<br />
اطلاعات عضویت در صورت وجود:<br />
{$membership}<br />
<br />
برای مشاهده یا ویرایش این اشتراک به آدرس زیر بروید.<br />
<br />
آدرس اشتراک: <a href="{$subscriptionUrl}">{$subscriptionUrl}</a>',
  'emails.subscriptionRenewIndl.description' => '',
  'emails.subscriptionRenewInstl.subject' => 'تمدید اشتراک سازمانی',
  'emails.subscriptionRenewInstl.body' => 'یک اشتراک سازمانی بصورت آن لاین برای {$contextName} با اطلاعات زیر تمدید شد.<br />
<br />
نوع اشتراک:<br />
{$subscriptionType}<br />
<br />
مؤسسه:<br />
{$institutionName}<br />
{$institutionMailingAddress}<br />
<br />
دامنه در صورت وجود:<br />
{$domain}<br />
<br />
بازه IP در صورت وجود:<br />
{$ipRanges}<br />
<br />
مسؤل تماس:<br />
{$userDetails}<br />
<br />
اطلاعات عضویت در صورت وجود:<br />
{$membership}<br />
<br />
برای مشاهده و ویرایش این اشتراک، لطفا به آدرس زیر بروید.<br />
<br />
آدرس اشتراک: <a href="{$subscriptionUrl}">{$subscriptionUrl}</a>',
  'emails.subscriptionRenewInstl.description' => '',
  'emails.citationEditorAuthorQuery.subject' => 'ویرایش ارجاع',
  'emails.citationEditorAuthorQuery.body' => '{$authorFirstName},<br />
<br />
لطفا ارجاع صحیح برای رفرانس زیر از مقاله شما {$submissionTitle} را مشخص کنید و یا تایید نمائید:<br />
<br />
{$rawCitation}<br />
<br />
بت تشکر!<br />
<br />
{$userFirstName}<br />
ویراستار, {$contextName}',
  'emails.citationEditorAuthorQuery.description' => '',
  'emails.editorDecisionInitialDecline.subject' => 'تصمیم دبیر',
  'emails.editorDecisionInitialDecline.body' => '{$authorName}:<br />
<br />
در مورد مقاله ارسالی شما (&quot;{$submissionTitle}&quot;) در {$contextName} تصمصم نهایی اتخاذ شده است.<br />
<br />
تصمیم نهایی: عدم پذیرش',
  'emails.editorDecisionInitialDecline.description' => 'این پیام زمان یارسال می شود که دبیر مقاله ارسالی را در اغاز رد می کند، بدون انکه وارد مرحله داوری شود',
  'emails.editorDecisionSendToExternal.subject' => 'تصمیم دبیر',
  'emails.editorDecisionSendToExternal.body' => '{$authorName}:<br />
<br />
در مورد مقاله ارسالی شما (&quot;{$submissionTitle}&quot;) در {$contextName} تصمصم نهایی اتخاذ شده است.<br />
<br />
تصمیم : ارسال به داور خارجی<br />
<br />
مشاهده وضعیت مقاله ارسالی: {$submissionUrl}',
  'emails.editorDecisionSendToExternal.description' => 'ایمیلی از طرف سردبیر یا دبیر بخش به نویسنده برای اطلاع از ارسال مقاله برای داوری توسط یک داور خارجی',
  'emails.editorDecisionSendToProduction.subject' => 'تصمیم دبیر',
  'emails.editorDecisionSendToProduction.body' => '{$authorName}:<br />
<br />
 روند داوری مقاله ارسالی شما (&quot;{$submissionTitle}&quot;)  تکمیل شده و به واحد انتشار ارسال شده است.<br />
<br />
مشاهده وضعیت مقاله ارسالی: {$submissionUrl}',
  'emails.editorDecisionSendToProduction.description' => 'ایمیلی از طرف سردبیر یا دبیر بخش به نویسنده برای اطلاع از ارسال مقاله برای چاپ',
  'emails.editorRecommendation.subject' => 'توصیه دبیر',
  'emails.editorRecommendation.body' => '{$editors}:<br />
<br />
توصیه اینجانب در مورد مقاله ارسالی (&quot;{$submissionTitle}&quot;) در {$contextName} ، {$recommendation} می باشد.',
  'emails.editorRecommendation.description' => 'ایمیلی از طرف دبیر یا دبیر بخش به دبیر نهایی تصمیم گیرنده برای اطلاع از توصیه برای مقاله ارسالی',
  'emails.notificationCenterDefault.subject' => 'پیامی برای {$contextName}',
  'emails.notificationCenterDefault.body' => 'لطفاً پیام خود را وارد کنید',
  'emails.notificationCenterDefault.description' => 'پیام خالی که در قسمت اطلاع رسانی استفاده می شود',
  'emails.submissionAckNotUser.subject' => 'قدردانی برای ارسال مقاله',
  'emails.submissionAckNotUser.body' => 'با سلام,<br />
<br />
مقاله {$submitterName} مقاله &quot;{$submissionTitle}&quot; را به مجله {$contextName} ارسال نمودند <br />
<br />
در صورت داشتن هر گونه سوالی با من تماس حاصل فرمایید. از اینکه نتیجه پژوهش خود را برای این مجله ارسال نمودید، سپاسگذاریم<br />
<br />
{$editorialContactSignature}',
  'emails.submissionAckNotUser.description' => 'در صورت فعال سازی. این ایمیل به صورت خودکار به نوسنده مقاله پس از تکمیل عملیات ارسال مقاله، فرستاده خواهد شد.',
  'emails.reviewRequestAttachedSubsequent.subject' => 'درخواست داوری مقاله',
  'emails.reviewRequestAttachedSubsequent.body' => '{$reviewerName}:<br />
<br />
این ایمیل در مورد مقاله &quot;{$submissionTitle},&quot; که به مجله {$contextName} ارسال شده است، می باشد.<br />
<br />
در ادامه داوری های قبلی  این مقاله نمایش داده شده است و اکنون نویسنده نسخه اصلاحی خود را ارسال کرده است. در صورت امکان در ارزیابی این اصلاحات به ما کمک کنید.<br />
<br />
راهنمای داوری و همچنین مقاله به این ایمیل ضمیمه شده است. نتیجه داوری و همچنین توصیه شما در موذد این مقاله باید تا تاریخ {$reviewDueDate} ارسال شود.<br />
<br />
لطفاً تا تاریخ {$responseDueDate} برای ما با ایمیل پاسخ دهید که این داوری را می پذیرید یا نه.<br />
<br />
{$editorialContactSignature}<br />
<br />
<br />
راهنمای داوری<br />
<br />
{$reviewGuidelines}<br />',
  'emails.reviewRequestAttachedSubsequent.description' => 'ایمیلی از طرف دبیر یا دبیر بخش به داور برای درخواست انجام داوری',
  'emails.reviewRequestOneclickSubsequent.subject' => 'درخواست داوری مقاله',
  'emails.reviewRequestOneclickSubsequent.body' => '{$reviewerName}:<br />
<br />
این ایمیل در مورد مقاله &quot;{$submissionTitle},&quot; که به مجله {$contextName} ارسال شده است، می باشد.<br />
<br />
در ادامه داوری های قبلی  این مقاله نمایش داده شده است و اکنون نویسنده نسخه اصلاحی خود را ارسال کرده است. در صورت امکان در ارزیابی این اصلاحات به ما کمک کنید.<br />
<br />
لطفاً تا تاریخ {$responseDueDate} به سامانه وارد شده و پذیرش یا عدم پذیرش انجام این داوری را به اطلاع برسانید<br />
<br />
مهلت انجام داوری: {$reviewDueDate}.<br />
<br />
لینک مقاله: {$submissionReviewUrl}<br />
<br />
<br />
{$editorialContactSignature}<br />
<br />
&quot;{$submissionTitle}&quot;<br />
<br />
{$submissionAbstract}',
  'emails.reviewRequestOneclickSubsequent.description' => 'ایمیلی از طرف دبیر یا دبیر بخش به داور برای درخواست انجام داوری',
  'emails.reviewRequestRemindAuto.subject' => 'یادآوری درخواست داوری مقاله',
  'emails.reviewRequestRemindAuto.body' => '{$reviewerName}:<br />

این ایمیل که به صورت خودکار ارسال شده است، جهت یادآوری درخواست انجام داوری مقاله &quot;{$submissionTitle},&quot; برای مجله {$contextName}. است.
<br />
لطفاً به سامانه {$contextUrl} وارد شده و پذیرش یا عدم پذیرش انجام این داوری را به اطلاع برسانید<br />
<br />
مهلت انجام داوری: {$reviewDueDate}.<br />
<br />
چنانچه رمز ورود خود را فراموش کرده اید م یتوانید از لینک زیر برای بازیابی رمز ورود خود استفاده کنید:
{$passwordResetUrl}<br />
<br />
لینک مقاله: {$submissionReviewUrl}<br />
<br />
<br />
{$editorialContactSignature}<br />
<br />
&quot;{$submissionTitle}&quot;<br />
<br />
{$submissionAbstract}',
  'emails.reviewRequestRemindAuto.description' => 'ایمیلی از طرف دبیر یا دبیر بخش به داور برای درخواست انجام داوری',
  'emails.reviewRequestRemindAutoOneclick.subject' => 'یادآوری درخواست داوری مقاله',
  'emails.reviewRequestRemindAutoOneclick.body' => '{$reviewerName}:<br />

این ایمیل که به صورت خودکار ارسال شده است، جهت یادآوری درخواست انجام داوری مقاله &quot;{$submissionTitle},&quot; برای مجله {$contextName}. است. امیدواریم که تا تاریخ {$responseDueDate} نسبت به پذیرش یا عدم پذیرش این درخواست داوری به ما اطلاع رسانی نمایید
<br />
لطفاً به سامانه وارد شده و پذیرش یا عدم پذیرش انجام این داوری را به اطلاع برسانید<br />
<br />
مهلت انجام داوری: {$reviewDueDate}.<br />

<br />
لینک مقاله: {$submissionReviewUrl}<br />
<br />
<br />
{$editorialContactSignature}<br />
<br />
&quot;{$submissionTitle}&quot;<br />
<br />
{$submissionAbstract}',
  'emails.reviewRequestRemindAutoOneclick.description' => 'ایمیلی از طرف دبیر یا دبیر بخش به داور برای درخواست انجام داوری',
  'emails.revisedVersionNotify.subject' => 'آپلود نسخه اصلاح شده',
  'emails.revisedVersionNotify.body' => 'دبیر محترم:<br />
<br />
نسخه اصلاح شده مقاله &quot;{$submissionTitle}&quot; توسط {$authorName} در سامانه آپلود شد..<br />
<br />
لینک مقاله: {$submissionUrl}<br />
<br />
{$editorialContactSignature}',
  'emails.revisedVersionNotify.description' => 'ایمیلی که خودکار پس از آپلود نسخه اصلاحی توسط نویسنده  برای دبیر ارسال می شود',
  'emails.reviewRequestSubsequent.subject' => 'درخواست داوری مقاله',
  'emails.reviewRequestSubsequent.body' => '{$reviewerName}:<br />
<br />
شما به عنوان یک کارشناس ممتاز برای بررسی مقاله &quot;{$submissionTitle}&quot; که برای {$contextName} ارسال شده است انتخاب شده اید. در ذیل، چکیده مقاله ارسالی برای شما گنجانده شده است و امیدوارم که در این زمینه مایل به همکاری با این مجله باشید.<br />
<br />
لطفا قبل از تاریخ {$responseDueDate} وارد وب سایت مجله شده و مشخص سازید که آیا مایل به قبول کارشناسی هستید یا خیر؟ همچنین به طور همزمان می توانید به مقاله ارسالی دسترسی پیدا کرده و متن کارشناسی و توصیه های خودرا ذخیره کنید.<br />
<br />
چنانچه رمز عبور خود را فراموش کرده اید می توانید از لینک زیر به بازیابی رمز خود بپردازید: {$passwordResetUrl}
<br/>
ضمنا آخرین مهلت بررسی این مقاله تا تاریخ {$reviewDueDate} می باشد.<br />
<br />
آدرس مقاله: <a href="{$submissionReviewUrl}">{$submissionReviewUrl}</a><br />
<br />
از توجه شما به این درخواست متشکرم.<br />
<br />
{$editorialContactSignature}<br />
<br />
<br />
--------------------------------<br />
&quot;{$submissionTitle}&quot;<br />
<br />
چکیده:<br />
{$submissionAbstract}',
  'emails.reviewRequestSubsequent.description' => 'ایمیلی از طرف دبیر یا دبیر بخش به داور برای درخواست انجام داوری',
);