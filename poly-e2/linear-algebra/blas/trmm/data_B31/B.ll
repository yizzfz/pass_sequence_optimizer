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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %0 = bitcast i8* %call to [1000 x double]*
  %arraydecay22 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %alpha, [1000 x double]* %0, [1200 x double]* %arraydecay22)
  call void (...) @polybench_timer_start() #4
  %1 = load double, double* %alpha, align 8
  call fastcc void @kernel_trmm(double %1, [1000 x double]* %0, [1200 x double]* %arraydecay22)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc27.us, %entry
  %indvars.iv21 = phi i64 [ 0, %entry ], [ %indvars.iv.next22, %for.inc27.us ]
  %cmp23.us = icmp sgt i64 %indvars.iv21, 0
  br i1 %cmp23.us, label %for.inc.us.preheader, label %for.end.us

for.inc.us.preheader:                             ; preds = %for.cond1.preheader.us
  %xtraiter = and i64 %indvars.iv21, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.preheader
  %0 = trunc i64 %indvars.iv21 to i32
  %rem.us.prol = srem i32 %0, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.inc.us.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.inc.us.preheader ]
  %1 = icmp eq i64 %indvars.iv21, 1
  br i1 %1, label %for.end.us, label %for.inc.us.preheader.new

for.inc.us.preheader.new:                         ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.us.preheader.new ], [ %indvars.iv.next.1, %for.inc.us ]
  %2 = add nuw nsw i64 %indvars.iv21, %indvars.iv
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %4 = add nuw nsw i64 %indvars.iv21, %indvars.iv.next
  %5 = trunc i64 %4 to i32
  %rem.us.1 = srem i32 %5, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.1 = fdiv double %conv.us.1, 1.000000e+03
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv21
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.inc.us

for.end.us.loopexit:                              ; preds = %for.inc.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.inc.us.prol.loopexit, %for.cond1.preheader.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv21
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %6 = trunc i64 %indvars.iv21 to i32
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us, %for.end.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.inc24.us ], [ 0, %for.end.us ]
  %7 = trunc i64 %indvars.iv17 to i32
  %sub.us = sub i32 1200, %7
  %add15.us = add i32 %sub.us, %6
  %rem16.us = srem i32 %add15.us, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, 1.200000e+03
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv21, i64 %indvars.iv17
  store double %div19.us, double* %arrayidx23.us, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next18, 1200
  br i1 %exitcond35, label %for.inc27.us, label %for.inc24.us

for.inc27.us:                                     ; preds = %for.inc24.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next22, 1000
  br i1 %exitcond36, label %for.end29, label %for.cond1.preheader.us

for.end29:                                        ; preds = %for.inc27.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(double %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #2 {
entry:
  %0 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.us47.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.us47.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc30.us, %entry
  %indvars.iv68 = phi i64 [ 0, %entry ], [ %indvars.iv.next69, %for.inc30.us ]
  %indvars.iv57 = phi i64 [ 1, %entry ], [ %indvars.iv.next58, %for.inc30.us ]
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %cmp55.us = icmp slt i64 %indvars.iv.next69, 1000
  br i1 %cmp55.us, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us19.preheader

for.cond4.preheader.us19.preheader:               ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us19

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %2 = sub nsw i64 0, %indvars.iv68
  %3 = trunc i64 %2 to i32
  %4 = and i32 %3, 1
  %arrayidx8.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv68
  %indvars.iv.next60.prol = add nuw nsw i64 %indvars.iv57, 1
  %5 = icmp eq i32 %4, 0
  %6 = icmp eq i32 %3, -998
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us19:                         ; preds = %for.cond4.preheader.us19.preheader, %for.cond4.preheader.us19
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.cond4.preheader.us19 ], [ 0, %for.cond4.preheader.us19.preheader ]
  %arrayidx21.phi.trans.insert.us24 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv68, i64 %indvars.iv
  %.pre17.us25.v.i0 = bitcast double* %arrayidx21.phi.trans.insert.us24 to <2 x double>*
  %.pre17.us25 = load <2 x double>, <2 x double>* %.pre17.us25.v.i0, align 8
  %mul22.us47 = fmul <2 x double> %.pre17.us25, %mul22.us47.v.i1.2
  %7 = bitcast double* %arrayidx21.phi.trans.insert.us24 to <2 x double>*
  store <2 x double> %mul22.us47, <2 x double>* %7, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx21.phi.trans.insert.us24.2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv68, i64 %indvars.iv.next.1
  %.pre17.us25.2.v.i0 = bitcast double* %arrayidx21.phi.trans.insert.us24.2 to <2 x double>*
  %.pre17.us25.2 = load <2 x double>, <2 x double>* %.pre17.us25.2.v.i0, align 8
  %mul22.us47.2 = fmul <2 x double> %.pre17.us25.2, %mul22.us47.2.v.i1.2
  %8 = bitcast double* %arrayidx21.phi.trans.insert.us24.2 to <2 x double>*
  store <2 x double> %mul22.us47.2, <2 x double>* %8, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1200
  br i1 %exitcond.3, label %for.inc30.us.loopexit11, label %for.cond4.preheader.us19

for.inc30.us.loopexit:                            ; preds = %for.inc27.us.us
  br label %for.inc30.us

for.inc30.us.loopexit11:                          ; preds = %for.cond4.preheader.us19
  br label %for.inc30.us

for.inc30.us:                                     ; preds = %for.inc30.us.loopexit11, %for.inc30.us.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next69, 1000
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  br i1 %exitcond, label %for.end32, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.inc27.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc27.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx16.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv68, i64 %indvars.iv65
  %.pre.us.us = load double, double* %arrayidx16.us.us, align 8
  br i1 %5, label %for.inc.us.us.prol, label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol:                               ; preds = %for.cond4.preheader.us.us
  %9 = load double, double* %arrayidx8.us.us.prol, align 8
  %arrayidx12.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv57, i64 %indvars.iv65
  %10 = load double, double* %arrayidx12.us.us.prol, align 8
  %mul.us.us.prol = fmul double %9, %10
  %add17.us.us.prol = fadd double %.pre.us.us, %mul.us.us.prol
  store double %add17.us.us.prol, double* %arrayidx16.us.us, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.cond4.preheader.us.us, %for.inc.us.us.prol
  %indvars.iv59.unr.ph = phi i64 [ %indvars.iv.next60.prol, %for.inc.us.us.prol ], [ %indvars.iv57, %for.cond4.preheader.us.us ]
  %.unr.ph = phi double [ %add17.us.us.prol, %for.inc.us.us.prol ], [ %.pre.us.us, %for.cond4.preheader.us.us ]
  %add17.us.us.lcssa.unr.ph = phi double [ %add17.us.us.prol, %for.inc.us.us.prol ], [ undef, %for.cond4.preheader.us.us ]
  br i1 %6, label %for.inc27.us.us, label %for.inc.us.us.preheader

for.inc.us.us.preheader:                          ; preds = %for.inc.us.us.prol.loopexit
  br label %for.inc.us.us

for.inc27.us.us.loopexit:                         ; preds = %for.inc.us.us
  br label %for.inc27.us.us

for.inc27.us.us:                                  ; preds = %for.inc27.us.us.loopexit, %for.inc.us.us.prol.loopexit
  %add17.us.us.lcssa = phi double [ %add17.us.us.lcssa.unr.ph, %for.inc.us.us.prol.loopexit ], [ %add17.us.us.1, %for.inc27.us.us.loopexit ]
  %mul22.us.us = fmul double %add17.us.us.lcssa, %alpha
  store double %mul22.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next66, 1200
  br i1 %exitcond73, label %for.inc30.us.loopexit, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.preheader, %for.inc.us.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60.1, %for.inc.us.us ], [ %indvars.iv59.unr.ph, %for.inc.us.us.preheader ]
  %11 = phi double [ %add17.us.us.1, %for.inc.us.us ], [ %.unr.ph, %for.inc.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv68
  %12 = load double, double* %arrayidx8.us.us, align 8
  %arrayidx12.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv59, i64 %indvars.iv65
  %13 = load double, double* %arrayidx12.us.us, align 8
  %mul.us.us = fmul double %12, %13
  %add17.us.us = fadd double %11, %mul.us.us
  store double %add17.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next60, i64 %indvars.iv68
  %14 = load double, double* %arrayidx8.us.us.1, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next60, i64 %indvars.iv65
  %15 = load double, double* %arrayidx12.us.us.1, align 8
  %mul.us.us.1 = fmul double %14, %15
  %add17.us.us.1 = fadd double %add17.us.us, %mul.us.us.1
  store double %add17.us.us.1, double* %arrayidx16.us.us, align 8
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next60.1, 1000
  br i1 %exitcond.1, label %for.inc27.us.us.loopexit, label %for.inc.us.us

for.end32:                                        ; preds = %for.inc30.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* %B) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc10.us ]
  %3 = mul nsw i64 %indvars.iv11, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ 0, %for.cond2.preheader.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond17, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.inc10.us
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
