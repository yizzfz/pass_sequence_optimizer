; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #5
  %call1 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #5
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #5
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #5
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to [1200 x double]*
  %2 = bitcast i8* %call1 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %2, [1200 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #5
  tail call void @free(i8* %call1) #5
  tail call void @free(i8* %call2) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv714 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.end ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body
  %indvars.iv312 = phi i64 [ 0, %for.body ], [ %indvars.iv.next4, %for.body3 ]
  %0 = mul nuw nsw i64 %indvars.iv312, %indvars.iv714
  %1 = trunc i64 %0 to i32
  %rem = srem i32 %1, 1000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.000000e+03
  %mul5 = fmul double %div, 1.000000e+02
  %add = fadd double %mul5, 1.000000e+01
  %arrayidx7 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv714, i64 %indvars.iv312
  store double %add, double* %arrayidx7, align 8
  %arrayidx11 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv714, i64 %indvars.iv312
  store double 0.000000e+00, double* %arrayidx11, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv312, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv714, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond19, label %for.end32, label %for.body

for.end32:                                        ; preds = %for.end
  %R17 = bitcast [1200 x double]* %R to i8*
  call void @llvm.memset.p0i8.i64(i8* %R17, i8 0, i64 11520000, i32 8, i1 false)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* %A, [1200 x double]* nocapture %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.end85, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next49, %for.end85 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %0 = phi double [ 0.000000e+00, %for.body3.lr.ph ], [ %add.4, %for.body3 ]
  %indvars.iv24 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next.4, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv
  %1 = load double, double* %arrayidx5, align 8
  %mul = fmul double %1, %1
  %add = fadd double %0, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv24, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv
  %2 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %2, %2
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv24, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv
  %3 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %3, %3
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv24, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv
  %4 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %4, %4
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv24, 4
  %arrayidx5.4 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.3, i64 %indvars.iv
  %5 = load double, double* %arrayidx5.4, align 8
  %mul.4 = fmul double %5, %5
  %add.4 = fadd double %add.3, %mul.4
  %indvars.iv.next.4 = add nsw i64 %indvars.iv24, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1000
  br i1 %exitcond.4, label %for.body16.lr.ph, label %for.body3

for.body16.lr.ph:                                 ; preds = %for.body3
  %call = tail call double @sqrt(double %add.4) #5
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 %indvars.iv
  store double %call, double* %arrayidx13, align 8
  %arrayidx24 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 %indvars.iv
  br label %for.body16

for.body16:                                       ; preds = %for.body16, %for.body16.lr.ph
  %indvars.iv827 = phi i64 [ 0, %for.body16.lr.ph ], [ %indvars.iv.next9.1, %for.body16 ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv827, i64 %indvars.iv
  %6 = load double, double* %arrayidx20, align 8
  %7 = load double, double* %arrayidx24, align 8
  %div = fdiv double %6, %7
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv827, i64 %indvars.iv
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next9 = or i64 %indvars.iv827, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next9, i64 %indvars.iv
  %8 = load double, double* %arrayidx20.1, align 8
  %9 = load double, double* %arrayidx24, align 8
  %div.1 = fdiv double %8, %9
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next9, i64 %indvars.iv
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv827, 2
  %exitcond44.1 = icmp eq i64 %indvars.iv.next9.1, 1000
  br i1 %exitcond44.1, label %for.end31, label %for.body16

for.end31:                                        ; preds = %for.body16
  %10 = add nuw nsw i64 %indvars.iv, 1
  %cmp3435 = icmp slt i64 %10, 1200
  br i1 %cmp3435, label %for.body35.preheader, label %for.end85

for.body35.preheader:                             ; preds = %for.end31
  br label %for.body35

for.body35:                                       ; preds = %for.body35.preheader, %for.end82
  %indvars.iv1436 = phi i64 [ %indvars.iv.next15, %for.end82 ], [ %10, %for.body35.preheader ]
  %arrayidx39 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 %indvars.iv1436
  store double 0.000000e+00, double* %arrayidx39, align 8
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 %indvars.iv1436
  br label %for.body42

for.body42:                                       ; preds = %for.body42, %for.body35
  %indvars.iv1031 = phi i64 [ 0, %for.body35 ], [ %indvars.iv.next11.1, %for.body42 ]
  %arrayidx46 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv1031, i64 %indvars.iv
  %11 = load double, double* %arrayidx46, align 8
  %arrayidx50 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv1031, i64 %indvars.iv1436
  %12 = load double, double* %arrayidx50, align 8
  %mul51 = fmul double %11, %12
  %13 = load double, double* %arrayidx55, align 8
  %add56 = fadd double %13, %mul51
  store double %add56, double* %arrayidx55, align 8
  %indvars.iv.next11 = or i64 %indvars.iv1031, 1
  %arrayidx46.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next11, i64 %indvars.iv
  %14 = load double, double* %arrayidx46.1, align 8
  %arrayidx50.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next11, i64 %indvars.iv1436
  %15 = load double, double* %arrayidx50.1, align 8
  %mul51.1 = fmul double %14, %15
  %16 = load double, double* %arrayidx55, align 8
  %add56.1 = fadd double %16, %mul51.1
  store double %add56.1, double* %arrayidx55, align 8
  %indvars.iv.next11.1 = add nsw i64 %indvars.iv1031, 2
  %exitcond45.1 = icmp eq i64 %indvars.iv.next11.1, 1000
  br i1 %exitcond45.1, label %for.end59, label %for.body42

for.end59:                                        ; preds = %for.body42
  %arrayidx74 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 %indvars.iv1436
  br label %for.body62

for.body62:                                       ; preds = %for.body62, %for.end59
  %indvars.iv1233 = phi i64 [ 0, %for.end59 ], [ %indvars.iv.next13.1, %for.body62 ]
  %arrayidx66 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv1233, i64 %indvars.iv1436
  %17 = load double, double* %arrayidx66, align 8
  %arrayidx70 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv1233, i64 %indvars.iv
  %18 = load double, double* %arrayidx70, align 8
  %19 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %18, %19
  %sub = fsub double %17, %mul75
  store double %sub, double* %arrayidx66, align 8
  %indvars.iv.next13 = or i64 %indvars.iv1233, 1
  %arrayidx66.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next13, i64 %indvars.iv1436
  %20 = load double, double* %arrayidx66.1, align 8
  %arrayidx70.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next13, i64 %indvars.iv
  %21 = load double, double* %arrayidx70.1, align 8
  %22 = load double, double* %arrayidx74, align 8
  %mul75.1 = fmul double %21, %22
  %sub.1 = fsub double %20, %mul75.1
  store double %sub.1, double* %arrayidx66.1, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv1233, 2
  %exitcond46.1 = icmp eq i64 %indvars.iv.next13.1, 1000
  br i1 %exitcond46.1, label %for.end82, label %for.body62

for.end82:                                        ; preds = %for.body62
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1436, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond47, label %for.end85.loopexit, label %for.body35

for.end85.loopexit:                               ; preds = %for.end82
  br label %for.end85

for.end85:                                        ; preds = %for.end85.loopexit, %for.end31
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next49, 1200
  br i1 %exitcond50, label %for.end88, label %for.body3.lr.ph

for.end88:                                        ; preds = %for.end85
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %R, [1200 x double]* nocapture readonly %Q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv816 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.end ]
  %3 = mul nuw nsw i64 %indvars.iv816, 1200
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.body
  %indvars.iv514 = phi i64 [ 0, %for.body ], [ %indvars.iv.next6, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv514, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc20 = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv816, i64 %indvars.iv514
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv514, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond, label %for.end, label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv816, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next9, 1200
  br i1 %exitcond23, label %for.end12, label %for.body

for.end12:                                        ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %for.body17

for.body17:                                       ; preds = %for.end35, %for.end12
  %indvars.iv212 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next3, %for.end35 ]
  %11 = mul nuw nsw i64 %indvars.iv212, 1200
  br label %for.body20

for.body20:                                       ; preds = %if.end27, %for.body17
  %indvars.iv11 = phi i64 [ 0, %for.body17 ], [ %indvars.iv.next, %if.end27 ]
  %12 = add nuw nsw i64 %indvars.iv11, %11
  %13 = trunc i64 %12 to i32
  %rem23 = srem i32 %13, 20
  %cmp24 = icmp eq i32 %rem23, 0
  br i1 %cmp24, label %if.then25, label %if.end27

if.then25:                                        ; preds = %for.body20
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %if.end27

if.end27:                                         ; preds = %for.body20, %if.then25
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv212, i64 %indvars.iv11
  %16 = load double, double* %arrayidx31, align 8
  %call32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv11, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond21, label %for.end35, label %for.body20

for.end35:                                        ; preds = %if.end27
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv212, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond22, label %for.end38, label %for.body17

for.end38:                                        ; preds = %for.end35
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
