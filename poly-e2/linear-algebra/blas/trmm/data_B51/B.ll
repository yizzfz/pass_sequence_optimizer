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
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* nocapture %alpha, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
for.body.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.inc27.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %for.inc27.us ], [ 0, %for.body.us.preheader ]
  %0 = add nuw nsw i64 %indvars.iv23, 4294967295
  %cmp21.us = icmp sgt i64 %indvars.iv23, 0
  %1 = trunc i64 %indvars.iv23 to i32
  br i1 %cmp21.us, label %for.body3.lr.ph.us, label %for.body14.us.preheader

for.body3.lr.ph.us:                               ; preds = %for.body.us
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit.unr-lcssa, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  %rem.us.prol = srem i32 %1, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit.unr-lcssa

for.body3.us.prol.loopexit.unr-lcssa:             ; preds = %for.body3.lr.ph.us, %for.body3.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol.preheader ], [ 0, %for.body3.lr.ph.us ]
  %2 = trunc i64 %0 to i32
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %for.body14.us.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit.unr-lcssa
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ]
  %4 = add nuw nsw i64 %indvars.iv, %indvars.iv23
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 1000
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = add nuw nsw i64 %indvars.iv.next, %indvars.iv23
  %7 = trunc i64 %6 to i32
  %rem.us.1 = srem i32 %7, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %8 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %8, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv23
  br i1 %exitcond.1, label %for.body14.us.preheader.loopexit, label %for.body3.us

for.body14.us.preheader.loopexit:                 ; preds = %for.body3.us
  br label %for.body14.us.preheader

for.body14.us.preheader:                          ; preds = %for.body14.us.preheader.loopexit, %for.body.us, %for.body3.us.prol.loopexit.unr-lcssa
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv23
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %sub.us = add i32 %1, 1200
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us.preheader, %for.body14.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15.1, %for.body14.us ], [ 0, %for.body14.us.preheader ]
  %9 = trunc i64 %indvars.iv14 to i32
  %add15.us = sub i32 %sub.us, %9
  %rem16.us = srem i32 %add15.us, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv23, i64 %indvars.iv14
  %10 = or i32 %9, 1
  %add15.us.1 = sub i32 %sub.us, %10
  %rem16.us.1 = srem i32 %add15.us.1, 1200
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %11 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %11, align 8
  %indvars.iv.next15.1 = add nuw nsw i64 %indvars.iv14, 2
  %exitcond.120 = icmp eq i64 %indvars.iv.next15.1, 1200
  br i1 %exitcond.120, label %for.inc27.us, label %for.body14.us

for.inc27.us:                                     ; preds = %for.body14.us
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, 1000
  br i1 %exitcond, label %for.end29, label %for.body.us

for.end29:                                        ; preds = %for.inc27.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
for.body.us.preheader:
  %0 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.us39.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body.us

for.body.us:                                      ; preds = %for.inc30.us, %for.body.us.preheader
  %indvars.iv64 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next65, %for.inc30.us ]
  %indvars.iv53 = phi i64 [ 1, %for.body.us.preheader ], [ %indvars.iv.next54.pre-phi, %for.inc30.us ]
  %1 = sub nsw i64 0, %indvars.iv64
  %2 = trunc i64 %1 to i32
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %cmp51.us = icmp slt i64 %indvars.iv.next65, 1000
  br i1 %cmp51.us, label %for.body3.us.us.preheader, label %for.body3.us13.preheader

for.body3.us13.preheader:                         ; preds = %for.body.us
  br label %for.body3.us13

for.body3.us.us.preheader:                        ; preds = %for.body.us
  %3 = and i32 %2, 1
  %arrayidx8.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv64
  %indvars.iv.next56.prol = add nuw nsw i64 %indvars.iv53, 1
  %4 = icmp eq i32 %3, 0
  %5 = icmp eq i32 %2, -998
  br label %for.body3.us.us

for.body3.us13:                                   ; preds = %for.body3.us13, %for.body3.us13.preheader
  %indvars.iv = phi i64 [ 0, %for.body3.us13.preheader ], [ %indvars.iv.next.3.1, %for.body3.us13 ]
  %arrayidx21.us38 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv
  %6 = bitcast double* %arrayidx21.us38 to <2 x double>*
  %7 = load <2 x double>, <2 x double>* %6, align 8
  %mul22.us39 = fmul <2 x double> %7, %mul22.us39.v.i1.2
  store <2 x double> %mul22.us39, <2 x double>* %6, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx21.us38.2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.next.1
  %8 = bitcast double* %arrayidx21.us38.2 to <2 x double>*
  %9 = load <2 x double>, <2 x double>* %8, align 8
  %mul22.us39.2 = fmul <2 x double> %9, %mul22.us39.v.i1.2
  store <2 x double> %mul22.us39.2, <2 x double>* %8, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %arrayidx21.us38.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.next.3
  %10 = bitcast double* %arrayidx21.us38.1 to <2 x double>*
  %11 = load <2 x double>, <2 x double>* %10, align 8
  %mul22.us39.1 = fmul <2 x double> %11, %mul22.us39.v.i1.2
  store <2 x double> %mul22.us39.1, <2 x double>* %10, align 8
  %indvars.iv.next.1.1 = or i64 %indvars.iv, 6
  %arrayidx21.us38.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.next.1.1
  %12 = bitcast double* %arrayidx21.us38.2.1 to <2 x double>*
  %13 = load <2 x double>, <2 x double>* %12, align 8
  %mul22.us39.2.1 = fmul <2 x double> %13, %mul22.us39.v.i1.2
  store <2 x double> %mul22.us39.2.1, <2 x double>* %12, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %for.body3.us13.for.inc30.us_crit_edge, label %for.body3.us13

for.body3.us13.for.inc30.us_crit_edge:            ; preds = %for.body3.us13
  %.pre74 = add nuw nsw i64 %indvars.iv53, 1
  br label %for.inc30.us

for.inc30.us.loopexit:                            ; preds = %for.end.us.us
  br label %for.inc30.us

for.inc30.us:                                     ; preds = %for.inc30.us.loopexit, %for.body3.us13.for.inc30.us_crit_edge
  %indvars.iv.next54.pre-phi = phi i64 [ %.pre74, %for.body3.us13.for.inc30.us_crit_edge ], [ %indvars.iv.next56.prol, %for.inc30.us.loopexit ]
  %exitcond67 = icmp eq i64 %indvars.iv.next65, 1000
  br i1 %exitcond67, label %for.end32, label %for.body.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.end.us.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.end.us.us ], [ 0, %for.body3.us.us.preheader ]
  %arrayidx16.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv61
  %.pre = load double, double* %arrayidx16.us.us, align 8
  br i1 %4, label %for.body6.us.us.prol.preheader, label %for.body6.us.us.prol.loopexit.unr-lcssa

for.body6.us.us.prol.preheader:                   ; preds = %for.body3.us.us
  %14 = load double, double* %arrayidx8.us.us.prol, align 8
  %arrayidx12.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv61
  %15 = load double, double* %arrayidx12.us.us.prol, align 8
  %mul.us.us.prol = fmul double %14, %15
  %add17.us.us.prol = fadd double %mul.us.us.prol, %.pre
  store double %add17.us.us.prol, double* %arrayidx16.us.us, align 8
  br label %for.body6.us.us.prol.loopexit.unr-lcssa

for.body6.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.body3.us.us, %for.body6.us.us.prol.preheader
  %indvars.iv55.unr.ph = phi i64 [ %indvars.iv.next56.prol, %for.body6.us.us.prol.preheader ], [ %indvars.iv53, %for.body3.us.us ]
  %.unr.ph = phi double [ %add17.us.us.prol, %for.body6.us.us.prol.preheader ], [ %.pre, %for.body3.us.us ]
  %add17.us.us.lcssa.unr.ph = phi double [ %add17.us.us.prol, %for.body6.us.us.prol.preheader ], [ undef, %for.body3.us.us ]
  br i1 %5, label %for.end.us.us, label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit.unr-lcssa
  br label %for.body6.us.us

for.end.us.us.loopexit:                           ; preds = %for.body6.us.us
  br label %for.end.us.us

for.end.us.us:                                    ; preds = %for.end.us.us.loopexit, %for.body6.us.us.prol.loopexit.unr-lcssa
  %add17.us.us.lcssa = phi double [ %add17.us.us.lcssa.unr.ph, %for.body6.us.us.prol.loopexit.unr-lcssa ], [ %add17.us.us.1, %for.end.us.us.loopexit ]
  %mul22.us.us = fmul double %add17.us.us.lcssa, %alpha
  store double %mul22.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond = icmp eq i64 %indvars.iv.next62, 1200
  br i1 %exitcond, label %for.inc30.us.loopexit, label %for.body3.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.body6.us.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %for.body6.us.us ], [ %indvars.iv55.unr.ph, %for.body6.us.us.preheader ]
  %16 = phi double [ %add17.us.us.1, %for.body6.us.us ], [ %.unr.ph, %for.body6.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv64
  %17 = load double, double* %arrayidx8.us.us, align 8
  %arrayidx12.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv55, i64 %indvars.iv61
  %18 = load double, double* %arrayidx12.us.us, align 8
  %mul.us.us = fmul double %17, %18
  %add17.us.us = fadd double %mul.us.us, %16
  store double %add17.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next56, i64 %indvars.iv64
  %19 = load double, double* %arrayidx8.us.us.1, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next56, i64 %indvars.iv61
  %20 = load double, double* %arrayidx12.us.us.1, align 8
  %mul.us.us.1 = fmul double %19, %20
  %add17.us.us.1 = fadd double %mul.us.us.1, %add17.us.us
  store double %add17.us.us.1, double* %arrayidx16.us.us, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next56.1, 1000
  br i1 %exitcond.1, label %for.end.us.us.loopexit, label %for.body6.us.us

for.end32:                                        ; preds = %for.inc30.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %B) unnamed_addr #0 {
for.body.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body.us

for.body.us:                                      ; preds = %for.inc10.us, %for.body.us.preheader
  %indvars.iv9 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next10, %for.inc10.us ]
  %3 = mul nuw nsw i64 %indvars.iv9, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us ], [ 0, %for.body.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv9, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond13, label %for.end12, label %for.body.us

for.end12:                                        ; preds = %for.inc10.us
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
