<?php
if(fSession::get('maxStep') < 5)
    fURL::redirect('?step=four');

$tpl = $this->loadTemplate('five', 'tpl');

if(fRequest::isPost() && fRequest::get('finish')) {
    try {
        $installDir = new fDirectory(__ROOT__ . 'installation');
        $installFile = new fFile(__ROOT__ . 'install.php');

        $installDir->delete();
        $installFile->delete();

        fURL::redirect('.');
    } catch(fValidationException $e) {
        fURL::redirect('.');
    } catch(fEnvironmentException $e) {
        fMessaging::create('delete', 'install/five', $e->getMessage());
    }
}