<?php
/**
*  team : LLLG NKU
*  Coding by : 李威远2112338
*  后台数据
 */
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\PcounterUsersSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'User Information';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="pcounter-users-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Pcounter Users', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'user_ip',
            'user_time:datetime',

            ['class' => 'yii\grid\ActionColumn',
          'buttons' => [
                        'delete' => function ($url) {
                            return Html::a('Delete', $url, [
                                'data-method' => 'post',
                                'data-confirm' => 'Are you sure?'
                            ]);
                        }
                    ]],
        ],
    ]); ?>


</div>
