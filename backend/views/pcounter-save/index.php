<?php
/**
*  team : LLLG NKU
*  Coding by : 李威远2112338
*  后台数据
 */
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\PcounterSaveSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Web Traffic Information';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="pcounter-save-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Pcounter Save', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'save_name',
            'save_value',

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
