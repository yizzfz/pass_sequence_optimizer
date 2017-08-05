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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  tail call fastcc void @init_array([1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_gramschmidt([1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
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
  tail call fastcc void @print_array([1200 x double]* %2, [1200 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc12, %entry
  %indvars.iv914 = phi i64 [ 0, %entry ], [ %indvars.iv.next10, %for.inc12 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv613 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next7, %for.body3 ]
  %0 = mul nuw nsw i64 %indvars.iv613, %indvars.iv914
  %1 = trunc i64 %0 to i32
  %rem = srem i32 %1, 1000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.000000e+03
  %mul5 = fmul double %div, 1.000000e+02
  %add = fadd double %mul5, 1.000000e+01
  %arrayidx7 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv914, i64 %indvars.iv613
  store double %add, double* %arrayidx7, align 8
  %arrayidx11 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv914, i64 %indvars.iv613
  store double 0.000000e+00, double* %arrayidx11, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv613, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 1200
  br i1 %exitcond, label %for.inc12, label %for.body3

for.inc12:                                        ; preds = %for.body3
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv914, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond18, label %for.end32, label %for.cond1.preheader

for.end32:                                        ; preds = %for.inc12
  %R16 = bitcast [1200 x double]* %R to i8*
  call void @llvm.memset.p0i8.i64(i8* %R16, i8 0, i64 11520000, i32 8, i1 false)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc86, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next36, %for.inc86 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %0 = phi double [ 0.000000e+00, %for.cond1.preheader ], [ %add.4, %for.body3 ]
  %indvars.iv23 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.4, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv
  %1 = load double, double* %arrayidx5, align 8
  %mul = fmul double %1, %1
  %add = fadd double %0, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv23, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv
  %2 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %2, %2
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv23, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv
  %3 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %3, %3
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv23, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv
  %4 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %4, %4
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv23, 4
  %arrayidx5.4 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.3, i64 %indvars.iv
  %5 = load double, double* %arrayidx5.4, align 8
  %mul.4 = fmul double %5, %5
  %add.4 = fadd double %add.3, %mul.4
  %indvars.iv.next.4 = add nsw i64 %indvars.iv23, 5
  %exitcond31.4 = icmp eq i64 %indvars.iv.next.4, 1000
  br i1 %exitcond31.4, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %call = tail call double @sqrt(double %add.4) #3
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 %indvars.iv
  store double %call, double* %arrayidx13, align 8
  br label %for.body16

for.cond33.preheader:                             ; preds = %for.body16
  %exitcond28 = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond28, label %for.end88, label %for.body35.preheader

for.body35.preheader:                             ; preds = %for.cond33.preheader
  br label %for.body35

for.body16:                                       ; preds = %for.body16, %for.end
  %indvars.iv1324 = phi i64 [ 0, %for.end ], [ %indvars.iv.next14.1, %for.body16 ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv1324, i64 %indvars.iv
  %6 = load double, double* %arrayidx20, align 8
  %7 = load double, double* %arrayidx13, align 8
  %div = fdiv double %6, %7
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv1324, i64 %indvars.iv
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next14 = or i64 %indvars.iv1324, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next14, i64 %indvars.iv
  %8 = load double, double* %arrayidx20.1, align 8
  %9 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %8, %9
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next14, i64 %indvars.iv
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv1324, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next14.1, 1000
  br i1 %exitcond32.1, label %for.cond33.preheader, label %for.body16

for.cond33.loopexit:                              ; preds = %for.body62
  %exitcond = icmp eq i64 %indvars.iv.next2029, 1199
  br i1 %exitcond, label %for.inc86, label %for.body35

for.body35:                                       ; preds = %for.body35.preheader, %for.cond33.loopexit
  %indvars.iv.next2029.in = phi i64 [ %indvars.iv.next2029, %for.cond33.loopexit ], [ %indvars.iv, %for.body35.preheader ]
  %indvars.iv.next2029 = add nuw nsw i64 %indvars.iv.next2029.in, 1
  %arrayidx39 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 %indvars.iv.next2029
  store double 0.000000e+00, double* %arrayidx39, align 8
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 %indvars.iv.next2029
  br label %for.body42

for.cond60.preheader:                             ; preds = %for.body42
  %arrayidx74 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 %indvars.iv.next2029
  br label %for.body62

for.body42:                                       ; preds = %for.body42, %for.body35
  %indvars.iv1525 = phi i64 [ 0, %for.body35 ], [ %indvars.iv.next16.1, %for.body42 ]
  %arrayidx46 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv1525, i64 %indvars.iv
  %10 = load double, double* %arrayidx46, align 8
  %arrayidx50 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv1525, i64 %indvars.iv.next2029
  %11 = load double, double* %arrayidx50, align 8
  %mul51 = fmul double %10, %11
  %12 = load double, double* %arrayidx55, align 8
  %add56 = fadd double %12, %mul51
  store double %add56, double* %arrayidx55, align 8
  %indvars.iv.next16 = or i64 %indvars.iv1525, 1
  %arrayidx46.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next16, i64 %indvars.iv
  %13 = load double, double* %arrayidx46.1, align 8
  %arrayidx50.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next16, i64 %indvars.iv.next2029
  %14 = load double, double* %arrayidx50.1, align 8
  %mul51.1 = fmul double %13, %14
  %15 = load double, double* %arrayidx55, align 8
  %add56.1 = fadd double %15, %mul51.1
  store double %add56.1, double* %arrayidx55, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv1525, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next16.1, 1000
  br i1 %exitcond33.1, label %for.cond60.preheader, label %for.body42

for.body62:                                       ; preds = %for.body62, %for.cond60.preheader
  %indvars.iv1726 = phi i64 [ 0, %for.cond60.preheader ], [ %indvars.iv.next18.1, %for.body62 ]
  %arrayidx66 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv1726, i64 %indvars.iv.next2029
  %16 = load double, double* %arrayidx66, align 8
  %arrayidx70 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv1726, i64 %indvars.iv
  %17 = load double, double* %arrayidx70, align 8
  %18 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %17, %18
  %sub = fsub double %16, %mul75
  store double %sub, double* %arrayidx66, align 8
  %indvars.iv.next18 = or i64 %indvars.iv1726, 1
  %arrayidx66.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next18, i64 %indvars.iv.next2029
  %19 = load double, double* %arrayidx66.1, align 8
  %arrayidx70.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next18, i64 %indvars.iv
  %20 = load double, double* %arrayidx70.1, align 8
  %21 = load double, double* %arrayidx74, align 8
  %mul75.1 = fmul double %20, %21
  %sub.1 = fsub double %19, %mul75.1
  store double %sub.1, double* %arrayidx66.1, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv1726, 2
  %exitcond34.1 = icmp eq i64 %indvars.iv.next18.1, 1000
  br i1 %exitcond34.1, label %for.cond33.loopexit, label %for.body62

for.inc86:                                        ; preds = %for.cond33.loopexit
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next36, 1200
  br i1 %exitcond37, label %for.end88, label %for.cond1.preheader

for.end88:                                        ; preds = %for.cond33.preheader, %for.inc86
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv1420 = phi i64 [ 0, %entry ], [ %indvars.iv.next15, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv1420, 1200
  br label %for.body4

for.body4:                                        ; preds = %for.cond2.preheader, %if.end
  %indvars.iv1119 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next12, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv1119, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv1420, i64 %indvars.iv1119
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1119, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1420, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond23, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.inc36, %for.end12
  %indvars.iv818 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next9, %for.inc36 ]
  %11 = mul nuw nsw i64 %indvars.iv818, 1200
  br label %for.body20

for.body20:                                       ; preds = %if.end27, %for.cond18.preheader
  %indvars.iv17 = phi i64 [ 0, %for.cond18.preheader ], [ %indvars.iv.next, %if.end27 ]
  %12 = add nuw nsw i64 %indvars.iv17, %11
  %13 = trunc i64 %12 to i32
  %rem23 = srem i32 %13, 20
  %cmp24 = icmp eq i32 %rem23, 0
  br i1 %cmp24, label %if.then25, label %if.end27

if.then25:                                        ; preds = %for.body20
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %if.end27

if.end27:                                         ; preds = %if.then25, %for.body20
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv818, i64 %indvars.iv17
  %16 = load double, double* %arrayidx31, align 8
  %call32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv17, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond21, label %for.inc36, label %for.body20

for.inc36:                                        ; preds = %if.end27
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv818, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond22, label %for.end38, label %for.cond18.preheader

for.end38:                                        ; preds = %for.inc36
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
