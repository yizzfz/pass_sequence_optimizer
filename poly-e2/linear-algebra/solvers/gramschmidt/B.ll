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
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  tail call fastcc void @init_array([1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt([1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array([1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc12, %entry
  %indvars.iv28 = phi i64 [ 0, %entry ], [ %indvars.iv.next29, %for.inc12 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %for.body3 ], [ 0, %for.cond1.preheader ]
  %0 = mul nuw nsw i64 %indvars.iv23, %indvars.iv28
  %1 = trunc i64 %0 to i32
  %rem = srem i32 %1, 1000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.000000e+03
  %mul5 = fmul double %div, 1.000000e+02
  %add = fadd double %mul5, 1.000000e+01
  %arrayidx7 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv23
  store double %add, double* %arrayidx7, align 8
  %arrayidx11 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv28, i64 %indvars.iv23
  store double 0.000000e+00, double* %arrayidx11, align 8
  %exitcond = icmp eq i64 %indvars.iv23, 1199
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  br i1 %exitcond, label %for.inc12, label %for.body3

for.inc12:                                        ; preds = %for.body3
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next29, 1000
  br i1 %exitcond2, label %for.inc30.preheader, label %for.cond1.preheader

for.inc30.preheader:                              ; preds = %for.inc12
  br label %for.inc30

for.inc30:                                        ; preds = %for.inc30, %for.inc30.preheader
  %indvars.iv = phi i64 [ 0, %for.inc30.preheader ], [ %indvars.iv.next.7, %for.inc30 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 0
  %scevgep22 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next = or i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next, i64 0
  %scevgep22.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1, i64 0
  %scevgep22.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2, i64 0
  %scevgep22.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %scevgep.4 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.3, i64 0
  %scevgep22.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.4, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %scevgep.5 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.4, i64 0
  %scevgep22.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.5, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %scevgep.6 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.5, i64 0
  %scevgep22.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.6, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %scevgep.7 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.6, i64 0
  %scevgep22.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep22.7, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  %exitcond1.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond1.7, label %for.end32, label %for.inc30

for.end32:                                        ; preds = %for.inc30
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond.loopexit:                                ; preds = %for.inc83
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.loopexit, %entry
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %for.cond.loopexit ], [ 0, %entry ]
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.cond.loopexit ], [ 1, %entry ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.4, %for.body3 ]
  %nrm.056 = phi double [ 0.000000e+00, %for.cond1.preheader ], [ %add.4, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv76
  %0 = load double, double* %arrayidx5, align 8
  %mul = fmul double %0, %0
  %add = fadd double %nrm.056, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv76
  %1 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %1, %1
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv76
  %2 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %2, %2
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv76
  %3 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %3, %3
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx5.4 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.3, i64 %indvars.iv76
  %4 = load double, double* %arrayidx5.4, align 8
  %mul.4 = fmul double %4, %4
  %add.4 = fadd double %add.3, %mul.4
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %call = tail call double @sqrt(double %add.4) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv76, i64 %indvars.iv76
  store double %call, double* %arrayidx13, align 8
  br label %for.body16

for.body16:                                       ; preds = %for.body16.for.body16_crit_edge, %for.end
  %5 = phi double [ %.pre, %for.body16.for.body16_crit_edge ], [ %call, %for.end ]
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.body16.for.body16_crit_edge ], [ 0, %for.end ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv63, i64 %indvars.iv76
  %6 = load double, double* %arrayidx20, align 8
  %div = fdiv double %6, %5
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv63, i64 %indvars.iv76
  store double %div, double* %arrayidx28, align 8
  %exitcond65 = icmp eq i64 %indvars.iv63, 999
  br i1 %exitcond65, label %for.end31, label %for.body16.for.body16_crit_edge

for.body16.for.body16_crit_edge:                  ; preds = %for.body16
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %.pre = load double, double* %arrayidx13, align 8
  br label %for.body16

for.end31:                                        ; preds = %for.body16
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %cmp3460 = icmp slt i64 %indvars.iv.next77, 1200
  br i1 %cmp3460, label %for.body35.preheader, label %for.end88

for.body35.preheader:                             ; preds = %for.end31
  br label %for.body35

for.body35:                                       ; preds = %for.body35.preheader, %for.inc83
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %for.inc83 ], [ %indvars.iv72, %for.body35.preheader ]
  %arrayidx39 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv76, i64 %indvars.iv74
  store double 0.000000e+00, double* %arrayidx39, align 8
  br label %for.body42

for.body42:                                       ; preds = %for.body42, %for.body35
  %7 = phi double [ 0.000000e+00, %for.body35 ], [ %add56.1, %for.body42 ]
  %indvars.iv66 = phi i64 [ 0, %for.body35 ], [ %indvars.iv.next67.1, %for.body42 ]
  %arrayidx46 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv66, i64 %indvars.iv76
  %8 = load double, double* %arrayidx46, align 8
  %arrayidx50 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv74
  %9 = load double, double* %arrayidx50, align 8
  %mul51 = fmul double %8, %9
  %add56 = fadd double %7, %mul51
  store double %add56, double* %arrayidx39, align 8
  %indvars.iv.next67 = or i64 %indvars.iv66, 1
  %arrayidx46.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next67, i64 %indvars.iv76
  %10 = load double, double* %arrayidx46.1, align 8
  %arrayidx50.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next67, i64 %indvars.iv74
  %11 = load double, double* %arrayidx50.1, align 8
  %mul51.1 = fmul double %10, %11
  %add56.1 = fadd double %add56, %mul51.1
  store double %add56.1, double* %arrayidx39, align 8
  %exitcond68.1 = icmp eq i64 %indvars.iv.next67, 999
  %indvars.iv.next67.1 = add nuw nsw i64 %indvars.iv66, 2
  br i1 %exitcond68.1, label %for.body62.preheader, label %for.body42

for.body62.preheader:                             ; preds = %for.body42
  br label %for.body62

for.body62:                                       ; preds = %for.body62.preheader, %for.body62.for.body62_crit_edge
  %12 = phi double [ %.pre1, %for.body62.for.body62_crit_edge ], [ %add56.1, %for.body62.preheader ]
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %for.body62.for.body62_crit_edge ], [ 0, %for.body62.preheader ]
  %arrayidx66 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv74
  %13 = load double, double* %arrayidx66, align 8
  %arrayidx70 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv69, i64 %indvars.iv76
  %14 = load double, double* %arrayidx70, align 8
  %mul75 = fmul double %14, %12
  %sub = fsub double %13, %mul75
  store double %sub, double* %arrayidx66, align 8
  %exitcond71 = icmp eq i64 %indvars.iv69, 999
  br i1 %exitcond71, label %for.inc83, label %for.body62.for.body62_crit_edge

for.body62.for.body62_crit_edge:                  ; preds = %for.body62
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %.pre1 = load double, double* %arrayidx39, align 8
  br label %for.body62

for.inc83:                                        ; preds = %for.body62
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next75, 1200
  br i1 %exitcond2, label %for.cond.loopexit, label %for.body35

for.end88:                                        ; preds = %for.end31
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %R, [1200 x double]* nocapture readonly %Q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv12, 1200
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv9 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next10, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv9, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc19 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv12, i64 %indvars.iv9
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond2, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next13, 1200
  br i1 %exitcond3, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.inc36, %for.end12
  %indvars.iv6 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next7, %for.inc36 ]
  %11 = mul nuw nsw i64 %indvars.iv6, 1200
  br label %for.body20

for.body20:                                       ; preds = %if.end27, %for.cond18.preheader
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader ], [ %indvars.iv.next, %if.end27 ]
  %12 = add nuw nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %rem23 = srem i32 %13, 20
  %cmp24 = icmp eq i32 %rem23, 0
  br i1 %cmp24, label %if.then25, label %if.end27

if.then25:                                        ; preds = %for.body20
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %if.end27

if.end27:                                         ; preds = %for.body20, %if.then25
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv6, i64 %indvars.iv
  %16 = load double, double* %arrayidx31, align 8
  %call32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc36, label %for.body20

for.inc36:                                        ; preds = %if.end27
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond1, label %for.end38, label %for.cond18.preheader

for.end38:                                        ; preds = %for.inc36
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
