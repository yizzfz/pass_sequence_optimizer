; ModuleID = 'A.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %0 = bitcast i8* %call to [1200 x double]*
  %arraydecay22 = bitcast i8* %call1 to [1000 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %0, [1000 x double]* %arraydecay22)
  call void (...) @polybench_timer_start() #4
  %1 = load double, double* %alpha, align 8
  %2 = load double, double* %beta, align 8
  call fastcc void @kernel_syrk(double %1, double %2, [1200 x double]* %0, [1000 x double]* %arraydecay22)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %3, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = bitcast i8* %call to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc7.us, %entry
  %indvars.iv32 = phi i64 [ 0, %entry ], [ %indvars.iv.next33, %for.inc7.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.inc.us ], [ 0, %for.cond1.preheader.us ]
  %0 = mul nuw nsw i64 %indvars.iv32, %indvars.iv26
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv32, i64 %indvars.iv26
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next27, 1000
  br i1 %exitcond38, label %for.inc7.us, label %for.inc.us

for.inc7.us:                                      ; preds = %for.inc.us
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next33, 1200
  br i1 %exitcond39, label %for.cond14.preheader.preheader, label %for.cond1.preheader.us

for.cond14.preheader.preheader:                   ; preds = %for.inc7.us
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.inc28

for.inc28:                                        ; preds = %for.inc28, %for.cond14.preheader
  %indvars.iv = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next, %for.inc28 ]
  %3 = mul nuw nsw i64 %indvars.iv22, %indvars.iv
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20 = srem i32 %5, 1000
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 1.000000e+03
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv22, i64 %indvars.iv
  store double %div23, double* %arrayidx27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond37, label %for.inc31, label %for.inc28

for.inc31:                                        ; preds = %for.inc28
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond, label %for.end33, label %for.cond14.preheader

for.end33:                                        ; preds = %for.inc31
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A) unnamed_addr #2 {
entry:
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc32.us.for.inc.us.preheader_crit_edge, %entry
  %indvars.iv86 = phi i2 [ 1, %entry ], [ %indvars.iv.next87, %for.inc32.us.for.inc.us.preheader_crit_edge ]
  %indvars.iv67 = phi i64 [ 0, %entry ], [ %indvars.iv.next68, %for.inc32.us.for.inc.us.preheader_crit_edge ]
  %indvars.iv65 = phi i64 [ 1, %entry ], [ %indvars.iv.next66, %for.inc32.us.for.inc.us.preheader_crit_edge ]
  %2 = zext i2 %indvars.iv86 to i64
  %3 = add nuw nsw i64 %2, 4294967295
  %4 = and i64 %3, 4294967295
  %5 = add nuw nsw i64 %4, 1
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %6 = trunc i64 %indvars.iv.next68 to i32
  %xtraiter = and i32 %6, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.us.preheader
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv.prol
  %7 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %7, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !1

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.inc.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.inc.us.preheader ], [ %5, %for.inc.us.prol.loopexit.loopexit ]
  %8 = icmp ult i64 %indvars.iv67, 3
  br i1 %8, label %for.cond9.preheader.us23.preheader, label %for.inc.us.preheader1

for.inc.us.preheader1:                            ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader1, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc.us ], [ %indvars.iv.unr, %for.inc.us.preheader1 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv
  %9 = bitcast double* %arrayidx5.us to <2 x double>*
  %10 = load <2 x double>, <2 x double>* %9, align 8
  %mul.us = fmul <2 x double> %10, %mul.us.v.i1.2
  %11 = bitcast double* %arrayidx5.us to <2 x double>*
  store <2 x double> %mul.us, <2 x double>* %11, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv.next.1
  %12 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %13 = load <2 x double>, <2 x double>* %12, align 8
  %mul.us.2 = fmul <2 x double> %13, %mul.us.2.v.i1.2
  %14 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  store <2 x double> %mul.us.2, <2 x double>* %14, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv65
  br i1 %exitcond.3, label %for.cond9.preheader.us23.preheader.loopexit, label %for.inc.us

for.cond9.preheader.us23.preheader.loopexit:      ; preds = %for.inc.us
  br label %for.cond9.preheader.us23.preheader

for.cond9.preheader.us23.preheader:               ; preds = %for.cond9.preheader.us23.preheader.loopexit, %for.inc.us.prol.loopexit
  %xtraiter5891 = and i64 %indvars.iv.next68, 1
  %arrayidx25.us34.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 0
  %15 = icmp eq i64 %xtraiter5891, 0
  %16 = icmp eq i64 %indvars.iv67, 0
  br label %for.cond9.preheader.us23

for.cond9.preheader.us23:                         ; preds = %for.inc29.us41, %for.cond9.preheader.us23.preheader
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.inc29.us41 ], [ 0, %for.cond9.preheader.us23.preheader ]
  br i1 %15, label %for.inc26.us27.prol.loopexit, label %for.inc26.us27.prol

for.inc26.us27.prol:                              ; preds = %for.cond9.preheader.us23
  %arrayidx15.us30.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv67, i64 %indvars.iv61
  %17 = load double, double* %arrayidx15.us30.prol, align 8
  %mul16.us31.prol = fmul double %17, %alpha
  %arrayidx20.us32.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv61
  %18 = load double, double* %arrayidx20.us32.prol, align 8
  %mul21.us33.prol = fmul double %mul16.us31.prol, %18
  %19 = load double, double* %arrayidx25.us34.prol, align 8
  %add.us35.prol = fadd double %mul21.us33.prol, %19
  store double %add.us35.prol, double* %arrayidx25.us34.prol, align 8
  br label %for.inc26.us27.prol.loopexit

for.inc26.us27.prol.loopexit:                     ; preds = %for.cond9.preheader.us23, %for.inc26.us27.prol
  %indvars.iv53.unr.ph = phi i64 [ 1, %for.inc26.us27.prol ], [ 0, %for.cond9.preheader.us23 ]
  br i1 %16, label %for.inc29.us41, label %for.inc26.us27.preheader

for.inc26.us27.preheader:                         ; preds = %for.inc26.us27.prol.loopexit
  %arrayidx15.us30 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv67, i64 %indvars.iv61
  br label %for.inc26.us27

for.inc26.us27:                                   ; preds = %for.inc26.us27, %for.inc26.us27.preheader
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.1, %for.inc26.us27 ], [ %indvars.iv53.unr.ph, %for.inc26.us27.preheader ]
  %20 = load double, double* %arrayidx15.us30, align 8
  %mul16.us31 = fmul double %20, %alpha
  %arrayidx20.us32 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv61
  %21 = load double, double* %arrayidx20.us32, align 8
  %mul21.us33 = fmul double %mul16.us31, %21
  %arrayidx25.us34 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv53
  %22 = load double, double* %arrayidx25.us34, align 8
  %add.us35 = fadd double %mul21.us33, %22
  store double %add.us35, double* %arrayidx25.us34, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %23 = load double, double* %arrayidx15.us30, align 8
  %mul16.us31.1 = fmul double %23, %alpha
  %arrayidx20.us32.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next54, i64 %indvars.iv61
  %24 = load double, double* %arrayidx20.us32.1, align 8
  %mul21.us33.1 = fmul double %mul16.us31.1, %24
  %arrayidx25.us34.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv.next54
  %25 = load double, double* %arrayidx25.us34.1, align 8
  %add.us35.1 = fadd double %mul21.us33.1, %25
  store double %add.us35.1, double* %arrayidx25.us34.1, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next54.1, %indvars.iv65
  br i1 %exitcond.1, label %for.inc29.us41.loopexit, label %for.inc26.us27

for.inc29.us41.loopexit:                          ; preds = %for.inc26.us27
  br label %for.inc29.us41

for.inc29.us41:                                   ; preds = %for.inc29.us41.loopexit, %for.inc26.us27.prol.loopexit
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next62, 1000
  br i1 %exitcond85, label %for.inc32.us, label %for.cond9.preheader.us23

for.inc32.us:                                     ; preds = %for.inc29.us41
  %exitcond = icmp eq i64 %indvars.iv.next68, 1200
  br i1 %exitcond, label %for.end34, label %for.inc32.us.for.inc.us.preheader_crit_edge

for.inc32.us.for.inc.us.preheader_crit_edge:      ; preds = %for.inc32.us
  %indvars.iv.next87 = add i2 %indvars.iv86, 1
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  br label %for.inc.us.preheader

for.end34:                                        ; preds = %for.inc32.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc10 ]
  %3 = mul nsw i64 %indvars.iv10, 1200
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond15, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 1200
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
