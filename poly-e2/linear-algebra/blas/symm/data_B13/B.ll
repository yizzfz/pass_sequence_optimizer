; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  %3 = bitcast i8* %call to [1200 x double]*
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc16_crit_edge.us
  %indvars.iv57.us = phi i64 [ %indvars.iv.next54.us, %for.cond1.for.inc16_crit_edge.us ], [ 0, %entry ]
  %0 = add nuw nsw i64 %indvars.iv57.us, 1200
  %1 = trunc i64 %0 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv53.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next49.us, %for.body3.us ]
  %2 = add nuw nsw i64 %indvars.iv53.us, %indvars.iv57.us
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv57.us, i64 %indvars.iv53.us
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = sub nsw i64 0, %indvars.iv53.us
  %5 = trunc i64 %4 to i32
  %sub.us = add i32 %1, %5
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv57.us, i64 %indvars.iv53.us
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next49.us = add nuw nsw i64 %indvars.iv53.us, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next49.us, 1200
  br i1 %exitcond59, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next54.us = add nuw nsw i64 %indvars.iv57.us, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next54.us, 1000
  br i1 %exitcond60, label %for.cond23.preheader.preheader, label %for.cond1.preheader.us

for.cond23.preheader.preheader:                   ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.cond23.preheader

for.cond19.loopexit.loopexit:                     ; preds = %for.body43
  br label %for.cond19.loopexit

for.cond19.loopexit:                              ; preds = %for.cond19.loopexit.loopexit, %middle.block, %for.body43.prol.loopexit, %for.end38
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond = icmp eq i64 %10, 1000
  %indvars.iv.next72 = add i3 %indvars.iv71, -1
  br i1 %exitcond, label %for.end53, label %for.cond23.preheader

for.cond23.preheader:                             ; preds = %for.cond23.preheader.preheader, %for.cond19.loopexit
  %indvars.iv71 = phi i3 [ %indvars.iv.next72, %for.cond19.loopexit ], [ -1, %for.cond23.preheader.preheader ]
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %for.cond19.loopexit ], [ 1, %for.cond23.preheader.preheader ]
  %indvars.iv4346 = phi i64 [ %10, %for.cond19.loopexit ], [ 0, %for.cond23.preheader.preheader ]
  %6 = zext i3 %indvars.iv71 to i64
  %7 = add i64 %indvars.iv69, %6
  %8 = sub nuw nsw i64 1007, %indvars.iv4346
  %9 = sub nsw i64 998, %indvars.iv4346
  %10 = add nuw nsw i64 %indvars.iv4346, 1
  %xtraiter = and i64 %10, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body26.prol.loopexit.unr-lcssa, label %for.body26.prol.preheader

for.body26.prol.preheader:                        ; preds = %for.cond23.preheader
  %11 = trunc i64 %indvars.iv4346 to i32
  %rem28.prol = srem i32 %11, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4346, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.loopexit.unr-lcssa:               ; preds = %for.cond23.preheader, %for.body26.prol.preheader
  %indvars.iv33.unr.ph = phi i64 [ 1, %for.body26.prol.preheader ], [ 0, %for.cond23.preheader ]
  %12 = icmp eq i64 %indvars.iv4346, 0
  br i1 %12, label %for.end38, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit.unr-lcssa
  br label %for.body26

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv33 = phi i64 [ %indvars.iv.next.1, %for.body26 ], [ %indvars.iv33.unr.ph, %for.body26.preheader ]
  %13 = add nuw nsw i64 %indvars.iv33, %indvars.iv4346
  %14 = trunc i64 %13 to i32
  %rem28 = srem i32 %14, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4346, i64 %indvars.iv33
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv33, 1
  %15 = add nuw nsw i64 %indvars.iv.next, %indvars.iv4346
  %16 = trunc i64 %15 to i32
  %rem28.1 = srem i32 %16, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4346, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv33, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv69
  br i1 %exitcond.1, label %for.end38.loopexit, label %for.body26

for.end38.loopexit:                               ; preds = %for.body26
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.body26.prol.loopexit.unr-lcssa
  %exitcond3839 = icmp eq i64 %indvars.iv69, 1000
  br i1 %exitcond3839, label %for.cond19.loopexit, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.end38
  %xtraiter62 = and i64 %8, 7
  %lcmp.mod63 = icmp eq i64 %xtraiter62, 0
  br i1 %lcmp.mod63, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.preheader
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv3540.prol = phi i64 [ %indvars.iv.next36.prol, %for.body43.prol ], [ %indvars.iv69, %for.body43.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter62, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4346, i64 %indvars.iv3540.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next36.prol = add nuw nsw i64 %indvars.iv3540.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.preheader
  %indvars.iv3540.unr = phi i64 [ %indvars.iv69, %for.body43.preheader ], [ %7, %for.body43.prol.loopexit.loopexit ]
  %17 = icmp ult i64 %9, 7
  br i1 %17, label %for.cond19.loopexit, label %for.body43.preheader68

for.body43.preheader68:                           ; preds = %for.body43.prol.loopexit
  %18 = sub i64 992, %indvars.iv3540.unr
  %19 = lshr i64 %18, 3
  %20 = add nuw nsw i64 %19, 1
  %min.iters.check = icmp ult i64 %20, 2
  br i1 %min.iters.check, label %for.body43.preheader73, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body43.preheader68
  %n.mod.vf = and i64 %20, 1
  %n.vec = sub nsw i64 %20, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %21 = add i64 %indvars.iv3540.unr, 8
  %22 = shl nuw i64 %19, 3
  %23 = add i64 %21, %22
  %24 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %23, %24
  br i1 %cmp.zero, label %for.body43.preheader73, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %25 = shl i64 %index, 3
  %26 = add i64 %indvars.iv3540.unr, %25
  %27 = add nsw i64 %26, 7
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4346, i64 %27
  %29 = getelementptr double, double* %28, i64 -7
  %30 = bitcast double* %29 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %30, align 8
  %index.next = add i64 %index, 2
  %31 = icmp eq i64 %index.next, %n.vec
  br i1 %31, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond19.loopexit, label %for.body43.preheader73

for.body43.preheader73:                           ; preds = %middle.block, %min.iters.checked, %for.body43.preheader68
  %indvars.iv3540.ph = phi i64 [ %indvars.iv3540.unr, %min.iters.checked ], [ %indvars.iv3540.unr, %for.body43.preheader68 ], [ %ind.end, %middle.block ]
  br label %for.body43

for.body43:                                       ; preds = %for.body43.preheader73, %for.body43
  %indvars.iv3540 = phi i64 [ %indvars.iv.next36.7, %for.body43 ], [ %indvars.iv3540.ph, %for.body43.preheader73 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4346, i64 %indvars.iv3540
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv3540, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4346, i64 %indvars.iv.next36
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv3540, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4346, i64 %indvars.iv.next36.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next36.2 = add nsw i64 %indvars.iv3540, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4346, i64 %indvars.iv.next36.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next36.3 = add nsw i64 %indvars.iv3540, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4346, i64 %indvars.iv.next36.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next36.4 = add nsw i64 %indvars.iv3540, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4346, i64 %indvars.iv.next36.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next36.5 = add nsw i64 %indvars.iv3540, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4346, i64 %indvars.iv.next36.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next36.6 = add nsw i64 %indvars.iv3540, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4346, i64 %indvars.iv.next36.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next36.7 = add nsw i64 %indvars.iv3540, 8
  %exitcond38.7 = icmp eq i64 %indvars.iv.next36.7, 1000
  br i1 %exitcond38.7, label %for.cond19.loopexit.loopexit, label %for.body43, !llvm.loop !6

for.end53:                                        ; preds = %for.cond19.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #2 {
entry:
  %mul44.us56 = fmul double %alpha, 0.000000e+00
  %scevgep115 = bitcast [1200 x double]* %C to double*
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 1200
  %scevgep95116 = bitcast [1200 x double]* %B to double*
  %scevgep98 = getelementptr [1200 x double], [1200 x double]* %B, i64 0, i64 1200
  %bound0 = icmp ult double* %scevgep115, %scevgep98
  %bound1 = icmp ult double* %scevgep95116, %scevgep93
  %found.conflict = and i1 %bound0, %bound1
  %broadcast.splatinsert105 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat106 = shufflevector <2 x double> %broadcast.splatinsert105, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert110 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat111 = shufflevector <2 x double> %broadcast.splatinsert110, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert112 = insertelement <2 x double> undef, double %mul44.us56, i32 0
  %broadcast.splat113 = shufflevector <2 x double> %broadcast.splatinsert112, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc53_crit_edge.us
  %indvars.iv45.us = phi i64 [ %indvars.iv.next43.us, %for.cond1.for.inc53_crit_edge.us ], [ 0, %entry ]
  %exitcond36.us = icmp eq i64 %indvars.iv45.us, 0
  %arrayidx41.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv45.us, i64 %indvars.iv45.us
  br i1 %exitcond36.us, label %for.cond4.preheader.us72.preheader86, label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us72.preheader86:             ; preds = %for.cond1.preheader.us
  %0 = bitcast [1200 x double]* %C to double*
  %bound0101 = icmp ult double* %0, %arrayidx41.us
  %bound1102 = icmp ult double* %arrayidx41.us, %scevgep93
  %found.conflict103 = and i1 %bound0101, %bound1102
  %conflict.rdx = or i1 %found.conflict, %found.conflict103
  br i1 %conflict.rdx, label %for.cond4.preheader.us72.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond4.preheader.us72.preheader86
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = shl i64 %index, 1
  %2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %1
  %3 = bitcast double* %2 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %3, align 8, !alias.scope !8, !noalias !11
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec104 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %4 = fmul <2 x double> %strided.vec, %broadcast.splat106
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 0, i64 %1
  %6 = bitcast double* %5 to <4 x double>*
  %wide.vec107 = load <4 x double>, <4 x double>* %6, align 8, !alias.scope !14
  %strided.vec108 = shufflevector <4 x double> %wide.vec107, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec109 = shufflevector <4 x double> %wide.vec107, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %7 = fmul <2 x double> %strided.vec108, %broadcast.splat111
  %8 = load double, double* %arrayidx41.us, align 8, !alias.scope !15
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  %11 = fmul <2 x double> %7, %10
  %12 = fadd <2 x double> %4, %11
  %13 = fadd <2 x double> %broadcast.splat113, %12
  %14 = or i64 %1, 1
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %14
  %16 = fmul <2 x double> %strided.vec104, %broadcast.splat106
  %17 = fmul <2 x double> %strided.vec109, %broadcast.splat111
  %18 = load double, double* %arrayidx41.us, align 8, !alias.scope !15
  %19 = insertelement <2 x double> undef, double %18, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = fmul <2 x double> %17, %20
  %22 = fadd <2 x double> %16, %21
  %23 = fadd <2 x double> %broadcast.splat113, %22
  %24 = getelementptr double, double* %15, i64 -1
  %25 = bitcast double* %24 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %13, <2 x double> %23, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %25, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 2
  %26 = icmp eq i64 %index.next, 600
  br i1 %26, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br label %for.cond1.for.inc53_crit_edge.us

for.cond4.preheader.us72.preheader:               ; preds = %for.cond4.preheader.us72.preheader86
  br label %for.cond4.preheader.us72

for.cond4.preheader.us72:                         ; preds = %for.cond4.preheader.us72.preheader, %for.cond4.preheader.us72
  %indvars.iv41.us73 = phi i64 [ %indvars.iv.next39.us58.1, %for.cond4.preheader.us72 ], [ 0, %for.cond4.preheader.us72.preheader ]
  %arrayidx31.us50 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %indvars.iv41.us73
  %27 = load double, double* %arrayidx31.us50, align 8
  %mul32.us51 = fmul double %27, %beta
  %arrayidx36.us52 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 0, i64 %indvars.iv41.us73
  %28 = load double, double* %arrayidx36.us52, align 8
  %mul37.us53 = fmul double %28, %alpha
  %29 = load double, double* %arrayidx41.us, align 8
  %mul42.us54 = fmul double %mul37.us53, %29
  %add43.us55 = fadd double %mul32.us51, %mul42.us54
  %add45.us57 = fadd double %mul44.us56, %add43.us55
  store double %add45.us57, double* %arrayidx31.us50, align 8
  %indvars.iv.next39.us58 = or i64 %indvars.iv41.us73, 1
  %arrayidx31.us50.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %indvars.iv.next39.us58
  %30 = load double, double* %arrayidx31.us50.1, align 8
  %mul32.us51.1 = fmul double %30, %beta
  %arrayidx36.us52.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 0, i64 %indvars.iv.next39.us58
  %31 = load double, double* %arrayidx36.us52.1, align 8
  %mul37.us53.1 = fmul double %31, %alpha
  %32 = load double, double* %arrayidx41.us, align 8
  %mul42.us54.1 = fmul double %mul37.us53.1, %32
  %add43.us55.1 = fadd double %mul32.us51.1, %mul42.us54.1
  %add45.us57.1 = fadd double %mul44.us56, %add43.us55.1
  store double %add45.us57.1, double* %arrayidx31.us50.1, align 8
  %indvars.iv.next39.us58.1 = add nuw nsw i64 %indvars.iv41.us73, 2
  %exitcond80.1 = icmp eq i64 %indvars.iv.next39.us58.1, 1200
  br i1 %exitcond80.1, label %for.cond1.for.inc53_crit_edge.us.loopexit, label %for.cond4.preheader.us72, !llvm.loop !17

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.preheader.us72
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit117:     ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit117, %for.cond1.for.inc53_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next43.us = add nuw nsw i64 %indvars.iv45.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next43.us, 1000
  br i1 %exitcond, label %for.end55, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.end_crit_edge.us.us
  %indvars.iv41.us.us = phi i64 [ %indvars.iv.next39.us.us, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv45.us, i64 %indvars.iv41.us.us
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv45.us, i64 %indvars.iv41.us.us
  %33 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %33, %beta
  %34 = load double, double* %arrayidx8.us.us, align 8
  %mul37.us.us = fmul double %34, %alpha
  %35 = load double, double* %arrayidx41.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %35
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %mul44.us.us, %add43.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next39.us.us = add nuw nsw i64 %indvars.iv41.us.us, 1
  %exitcond42.us = icmp eq i64 %indvars.iv.next39.us.us, 1200
  br i1 %exitcond42.us, label %for.cond1.for.inc53_crit_edge.us.loopexit117, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us
  %temp2.038.us.us = phi double [ 0.000000e+00, %for.cond4.preheader.us.us ], [ %add27.us.us, %for.body6.us.us ]
  %indvars.iv37.us.us = phi i64 [ 0, %for.cond4.preheader.us.us ], [ %indvars.iv.next.us.us, %for.body6.us.us ]
  %36 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %36, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv45.us, i64 %indvars.iv37.us.us
  %37 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %37
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv37.us.us, i64 %indvars.iv41.us.us
  %38 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %38, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv37.us.us, i64 %indvars.iv41.us.us
  %39 = load double, double* %arrayidx21.us.us, align 8
  %40 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %39, %40
  %add27.us.us = fadd double %temp2.038.us.us, %mul26.us.us
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv37.us.us, 1
  %exitcond.us.us = icmp eq i64 %indvars.iv.next.us.us, %indvars.iv45.us
  br i1 %exitcond.us.us, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us

for.end55:                                        ; preds = %for.cond1.for.inc53_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* %C) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %entry, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv13.us = phi i64 [ %indvars.iv.next10.us, %for.cond2.for.inc10_crit_edge.us ], [ 0, %entry ]
  %3 = mul nuw nsw i64 %indvars.iv13.us, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv9.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us ]
  %4 = add nuw nsw i64 %indvars.iv9.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv13.us, i64 %indvars.iv9.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv9.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv13.us, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond15, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
