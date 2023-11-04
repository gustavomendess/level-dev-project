class TopicsController < ApplicationController

    before_action :set_topic, only: %i[ show edit update destroy ]

    def index
        @topics = Topic.all
    end

    def show
    end

    def edit
    end

    def update
        if @topic.update(topic_params)
            redirect_to topic_url(@topic), notice: "Topico atualizado com sucesso"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def new
        @topic = Topic.new
    end

    def create
        @topic = Topic.new(topic_params)
        if @topic.save
            redirect_to topic_url(@topic), notice: "Topico criado com sucesso"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @topic.destroy

        redirect_to topics_url, notice: "Topico removido com sucesso"
    end

    private

    def set_topic
        @topic = Topic.find(params[:id])
    end

    def topic_params
        topic_params = params.require(:topic).permit(:titulo)
    end

end