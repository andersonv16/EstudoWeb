<?php

namespace MF\Controller;

abstract class Action {

	protected $view;

	public function __construct() {
		$this->view = new \stdClass();
	}

	protected function render($view) {

        require_once "../App/Views/Index/".$view.".phtml";
	}
}

?>