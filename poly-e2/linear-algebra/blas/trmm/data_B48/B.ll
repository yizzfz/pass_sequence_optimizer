; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* nocapture %alpha, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  br label %for.body

for.body:                                         ; preds = %for.end26, %entry
  %indvars.iv814 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.end26 ]
  %exitcond10 = icmp eq i64 %indvars.iv814, 0
  br i1 %exitcond10, label %for.end, label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.body
  %xtraiter = and i64 %indvars.iv814, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.prol.loopexit, label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.lr.ph
  %0 = trunc i64 %indvars.iv814 to i32
  %rem.prol = srem i32 %0, 1000
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, 1.000000e+03
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv814, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.lr.ph, %for.body3.prol
  %indvars.iv11.unr.ph = phi i64 [ 1, %for.body3.prol ], [ 0, %for.body3.lr.ph ]
  %1 = icmp eq i64 %indvars.iv814, 1
  br i1 %1, label %for.end, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv11 = phi i64 [ %indvars.iv.next.1, %for.body3 ], [ %indvars.iv11.unr.ph, %for.body3.preheader ]
  %2 = add nuw nsw i64 %indvars.iv11, %indvars.iv814
  %3 = trunc i64 %2 to i32
  %rem = srem i32 %3, 1000
  %conv = sitofp i32 %rem to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv814, i64 %indvars.iv11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv11, 1
  %4 = add nuw nsw i64 %indvars.iv.next, %indvars.iv814
  %5 = trunc i64 %4 to i32
  %rem.1 = srem i32 %5, 1000
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %6 = bitcast double* %arrayidx6 to <2 x double>*
  store <2 x double> %div, <2 x double>* %6, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv11, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv814
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit, %for.body
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv814, i64 %indvars.iv814
  store double 1.000000e+00, double* %arrayidx10, align 8
  %7 = add nuw nsw i64 %indvars.iv814, 1200
  br label %for.body14

for.body14:                                       ; preds = %for.body14, %for.end
  %indvars.iv412 = phi i64 [ 0, %for.end ], [ %indvars.iv.next5.1, %for.body14 ]
  %8 = sub nuw nsw i64 %7, %indvars.iv412
  %9 = trunc i64 %8 to i32
  %rem16 = srem i32 %9, 1200
  %conv17 = sitofp i32 %rem16 to double
  %arrayidx23 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv814, i64 %indvars.iv412
  %indvars.iv.next5 = or i64 %indvars.iv412, 1
  %10 = sub nuw nsw i64 %7, %indvars.iv.next5
  %11 = trunc i64 %10 to i32
  %rem16.1 = srem i32 %11, 1200
  %conv17.1 = sitofp i32 %rem16.1 to double
  %div19.v.i0.1 = insertelement <2 x double> undef, double %conv17, i32 0
  %div19.v.i0.2 = insertelement <2 x double> %div19.v.i0.1, double %conv17.1, i32 1
  %div19 = fdiv <2 x double> %div19.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %12 = bitcast double* %arrayidx23 to <2 x double>*
  store <2 x double> %div19, <2 x double>* %12, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv412, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next5.1, 1200
  br i1 %exitcond17.1, label %for.end26, label %for.body14

for.end26:                                        ; preds = %for.body14
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv814, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond18, label %for.end29, label %for.body

for.end29:                                        ; preds = %for.end26
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  %0 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body

for.body:                                         ; preds = %for.end29, %entry
  %indvars.iv = phi i64 [ 1, %entry ], [ %indvars.iv.next18, %for.end29 ]
  %indvars.iv515 = phi i64 [ 0, %entry ], [ %2, %for.end29 ]
  %2 = add nuw nsw i64 %indvars.iv515, 1
  %exitcond9 = icmp eq i64 %indvars.iv, 1000
  br i1 %exitcond9, label %for.body3.preheader, label %for.body3.us.preheader

for.body3.preheader:                              ; preds = %for.body
  br label %for.body3

for.body3.us.preheader:                           ; preds = %for.body
  %3 = sub i64 999, %indvars.iv515
  %xtraiter = and i64 %3, 1
  %arrayidx8.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv515
  %indvars.iv.next2.us.prol = add nuw nsw i64 %indvars.iv, 1
  %4 = icmp eq i64 %xtraiter, 0
  %5 = icmp eq i64 %indvars.iv515, 998
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond4.for.end_crit_edge.us, %for.body3.us.preheader
  %indvars.iv312.us = phi i64 [ 0, %for.body3.us.preheader ], [ %indvars.iv.next4.us, %for.cond4.for.end_crit_edge.us ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv515, i64 %indvars.iv312.us
  br i1 %4, label %for.body6.us.prol.loopexit, label %for.body6.us.prol

for.body6.us.prol:                                ; preds = %for.body3.us
  %6 = load double, double* %arrayidx8.us.prol, align 8
  %arrayidx12.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv, i64 %indvars.iv312.us
  %7 = load double, double* %arrayidx12.us.prol, align 8
  %mul.us.prol = fmul double %6, %7
  %8 = load double, double* %arrayidx16.us, align 8
  %add17.us.prol = fadd double %8, %mul.us.prol
  store double %add17.us.prol, double* %arrayidx16.us, align 8
  br label %for.body6.us.prol.loopexit

for.body6.us.prol.loopexit:                       ; preds = %for.body3.us, %for.body6.us.prol
  %indvars.iv110.us.unr.ph = phi i64 [ %indvars.iv.next2.us.prol, %for.body6.us.prol ], [ %indvars.iv, %for.body3.us ]
  br i1 %5, label %for.cond4.for.end_crit_edge.us, label %for.body6.us.preheader

for.body6.us.preheader:                           ; preds = %for.body6.us.prol.loopexit
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us.preheader, %for.body6.us
  %indvars.iv110.us = phi i64 [ %indvars.iv.next2.us.1, %for.body6.us ], [ %indvars.iv110.us.unr.ph, %for.body6.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv110.us, i64 %indvars.iv515
  %9 = load double, double* %arrayidx8.us, align 8
  %arrayidx12.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv110.us, i64 %indvars.iv312.us
  %10 = load double, double* %arrayidx12.us, align 8
  %mul.us = fmul double %9, %10
  %11 = load double, double* %arrayidx16.us, align 8
  %add17.us = fadd double %11, %mul.us
  store double %add17.us, double* %arrayidx16.us, align 8
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv110.us, 1
  %arrayidx8.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next2.us, i64 %indvars.iv515
  %12 = load double, double* %arrayidx8.us.1, align 8
  %arrayidx12.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next2.us, i64 %indvars.iv312.us
  %13 = load double, double* %arrayidx12.us.1, align 8
  %mul.us.1 = fmul double %12, %13
  %14 = load double, double* %arrayidx16.us, align 8
  %add17.us.1 = fadd double %14, %mul.us.1
  store double %add17.us.1, double* %arrayidx16.us, align 8
  %indvars.iv.next2.us.1 = add nsw i64 %indvars.iv110.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next2.us.1, 1000
  br i1 %exitcond.us.1, label %for.cond4.for.end_crit_edge.us.loopexit, label %for.body6.us

for.cond4.for.end_crit_edge.us.loopexit:          ; preds = %for.body6.us
  br label %for.cond4.for.end_crit_edge.us

for.cond4.for.end_crit_edge.us:                   ; preds = %for.cond4.for.end_crit_edge.us.loopexit, %for.body6.us.prol.loopexit
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv515, i64 %indvars.iv312.us
  %15 = load double, double* %arrayidx21.us, align 8
  %mul22.us = fmul double %15, %alpha
  store double %mul22.us, double* %arrayidx21.us, align 8
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv312.us, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next4.us, 1200
  br i1 %exitcond17, label %for.end29.loopexit22, label %for.body3.us

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv312 = phi i64 [ %indvars.iv.next4.4, %for.body3 ], [ 0, %for.body3.preheader ]
  %arrayidx21 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv515, i64 %indvars.iv312
  %16 = bitcast double* %arrayidx21 to <2 x double>*
  %17 = load <2 x double>, <2 x double>* %16, align 8
  %mul22 = fmul <2 x double> %17, %mul22.v.i1.2
  %18 = bitcast double* %arrayidx21 to <2 x double>*
  store <2 x double> %mul22, <2 x double>* %18, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv312, 2
  %arrayidx21.2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv515, i64 %indvars.iv.next4.1
  %19 = bitcast double* %arrayidx21.2 to <2 x double>*
  %20 = load <2 x double>, <2 x double>* %19, align 8
  %mul22.2 = fmul <2 x double> %20, %mul22.2.v.i1.2
  %21 = bitcast double* %arrayidx21.2 to <2 x double>*
  store <2 x double> %mul22.2, <2 x double>* %21, align 8
  %indvars.iv.next4.3 = add nsw i64 %indvars.iv312, 4
  %arrayidx21.4 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv515, i64 %indvars.iv.next4.3
  %22 = load double, double* %arrayidx21.4, align 8
  %mul22.4 = fmul double %22, %alpha
  store double %mul22.4, double* %arrayidx21.4, align 8
  %indvars.iv.next4.4 = add nsw i64 %indvars.iv312, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next4.4, 1200
  br i1 %exitcond.4, label %for.end29.loopexit, label %for.body3

for.end29.loopexit:                               ; preds = %for.body3
  br label %for.end29

for.end29.loopexit22:                             ; preds = %for.cond4.for.end_crit_edge.us
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit22, %for.end29.loopexit
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %2, 1000
  br i1 %exitcond19, label %for.end32, label %for.body

for.end32:                                        ; preds = %for.end29
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %B) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv26 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end ]
  %3 = mul nuw nsw i64 %indvars.iv26, 1000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.body
  %indvars.iv5 = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv5, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv26, i64 %indvars.iv5
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.end, label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond8, label %for.end12, label %for.body

for.end12:                                        ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
