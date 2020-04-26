<?php

namespace App\Tests\Unit\Controller;

use App\Controller\StatusController;
use PHPUnit\Framework\TestCase;
use Symfony\Component\HttpFoundation\JsonResponse;

class StatusControllerTest extends TestCase
{
    public function testGetStatus()
    {
        $expected = new JsonResponse(['status' => 'ok']);

        $controller = new StatusController();
        $result = $controller->index();

        $this->assertEquals($expected->getStatusCode(), $result->getStatusCode());
        $this->assertEquals($expected->getContent(), $result->getContent());
    }
}
