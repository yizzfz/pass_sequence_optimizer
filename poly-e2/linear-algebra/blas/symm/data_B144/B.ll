; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
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
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add i64 %indvars.iv70, 1200
  %1 = trunc i64 %0 to i32
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv65 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next66, %for.inc.us ]
  %2 = add nuw nsw i64 %indvars.iv65, %indvars.iv70
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv65
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = trunc i64 %indvars.iv65 to i32
  %sub.us = sub i32 %1, %4
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv70, i64 %indvars.iv65
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next66, 1200
  br i1 %exitcond69, label %for.cond1.for.inc16_crit_edge.us, label %for.inc.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next71, 1000
  br i1 %exitcond74, label %for.cond1.for.inc16_crit_edge.us.for.inc36.lr.ph_crit_edge, label %for.cond1.preheader.us

for.cond1.for.inc16_crit_edge.us.for.inc36.lr.ph_crit_edge: ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.inc36.lr.ph

for.inc36.lr.ph:                                  ; preds = %for.inc51.for.inc36.lr.ph_crit_edge, %for.cond1.for.inc16_crit_edge.us.for.inc36.lr.ph_crit_edge
  %indvars.iv61 = phi i64 [ %7, %for.inc51.for.inc36.lr.ph_crit_edge ], [ 0, %for.cond1.for.inc16_crit_edge.us.for.inc36.lr.ph_crit_edge ]
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.inc51.for.inc36.lr.ph_crit_edge ], [ 1, %for.cond1.for.inc16_crit_edge.us.for.inc36.lr.ph_crit_edge ]
  %5 = sub i64 1007, %indvars.iv61
  %6 = sub i64 998, %indvars.iv61
  %7 = add i64 %indvars.iv61, 1
  %xtraiter = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc36.prol.loopexit.unr-lcssa, label %for.inc36.prol.preheader

for.inc36.prol.preheader:                         ; preds = %for.inc36.lr.ph
  %8 = trunc i64 %indvars.iv61 to i32
  %rem28.prol = srem i32 %8, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv61, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.inc36.prol.loopexit.unr-lcssa

for.inc36.prol.loopexit.unr-lcssa:                ; preds = %for.inc36.lr.ph, %for.inc36.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc36.prol.preheader ], [ 0, %for.inc36.lr.ph ]
  %9 = icmp eq i64 %indvars.iv61, 0
  br i1 %9, label %for.end38, label %for.inc36.prol.loopexit.unr-lcssa.for.inc36_crit_edge

for.inc36.prol.loopexit.unr-lcssa.for.inc36_crit_edge: ; preds = %for.inc36.prol.loopexit.unr-lcssa
  br label %for.inc36

for.inc36:                                        ; preds = %for.inc36, %for.inc36.prol.loopexit.unr-lcssa.for.inc36_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc36.prol.loopexit.unr-lcssa.for.inc36_crit_edge ], [ %indvars.iv.next.1, %for.inc36 ]
  %10 = add nuw nsw i64 %indvars.iv, %indvars.iv61
  %11 = trunc i64 %10 to i32
  %rem28 = srem i32 %11, 100
  %conv29 = sitofp i32 %rem28 to double
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = add nuw nsw i64 %indvars.iv.next, %indvars.iv61
  %13 = trunc i64 %12 to i32
  %rem28.1 = srem i32 %13, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.v.i0.1 = insertelement <2 x double> undef, double %conv29, i32 0
  %div31.v.i0.2 = insertelement <2 x double> %div31.v.i0.1, double %conv29.1, i32 1
  %div31 = fdiv <2 x double> %div31.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %arrayidx35 to <2 x double>*
  store <2 x double> %div31, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv59
  br i1 %exitcond52.1, label %for.end38.loopexit, label %for.inc36

for.end38.loopexit:                               ; preds = %for.inc36
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.inc36.prol.loopexit.unr-lcssa
  %cmp4134 = icmp slt i64 %7, 1000
  br i1 %cmp4134, label %for.inc48.lr.ph, label %for.inc51

for.inc48.lr.ph:                                  ; preds = %for.end38
  %xtraiter75 = and i64 %5, 7
  %lcmp.mod76 = icmp eq i64 %xtraiter75, 0
  br i1 %lcmp.mod76, label %for.inc48.prol.loopexit, label %for.inc48.lr.ph.for.inc48.prol_crit_edge

for.inc48.lr.ph.for.inc48.prol_crit_edge:         ; preds = %for.inc48.lr.ph
  br label %for.inc48.prol

for.inc48.prol:                                   ; preds = %for.inc48.prol, %for.inc48.lr.ph.for.inc48.prol_crit_edge
  %indvars.iv55.prol = phi i64 [ %indvars.iv59, %for.inc48.lr.ph.for.inc48.prol_crit_edge ], [ %indvars.iv.next56.prol, %for.inc48.prol ]
  %prol.iter = phi i64 [ %xtraiter75, %for.inc48.lr.ph.for.inc48.prol_crit_edge ], [ %prol.iter.sub, %for.inc48.prol ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv55.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next56.prol = add nuw nsw i64 %indvars.iv55.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc48.prol.loopexit.loopexit, label %for.inc48.prol, !llvm.loop !1

for.inc48.prol.loopexit.loopexit:                 ; preds = %for.inc48.prol
  br label %for.inc48.prol.loopexit

for.inc48.prol.loopexit:                          ; preds = %for.inc48.prol.loopexit.loopexit, %for.inc48.lr.ph
  %indvars.iv55.unr = phi i64 [ %indvars.iv59, %for.inc48.lr.ph ], [ %indvars.iv.next56.prol, %for.inc48.prol.loopexit.loopexit ]
  %15 = icmp ult i64 %6, 7
  br i1 %15, label %for.inc51, label %for.inc48.preheader

for.inc48.preheader:                              ; preds = %for.inc48.prol.loopexit
  %16 = sub i64 992, %indvars.iv55.unr
  %17 = lshr i64 %16, 3
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check = icmp ult i64 %18, 2
  br i1 %min.iters.check, label %for.inc48.preheader78, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc48.preheader
  %n.mod.vf = and i64 %18, 1
  %n.vec = sub nsw i64 %18, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %19 = add i64 %indvars.iv55.unr, 8
  %20 = shl nuw i64 %17, 3
  %21 = add i64 %19, %20
  %22 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %21, %22
  br i1 %cmp.zero, label %for.inc48.preheader78, label %min.iters.checked.vector.body_crit_edge

min.iters.checked.vector.body_crit_edge:          ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %min.iters.checked.vector.body_crit_edge
  %index = phi i64 [ 0, %min.iters.checked.vector.body_crit_edge ], [ %index.next, %vector.body ]
  %23 = shl i64 %index, 3
  %24 = add i64 %indvars.iv55.unr, %23
  %25 = add nsw i64 %24, 7
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv61, i64 %25
  %27 = getelementptr double, double* %26, i64 -7
  %28 = bitcast double* %27 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %28, align 8
  %index.next = add i64 %index, 2
  %29 = icmp eq i64 %index.next, %n.vec
  br i1 %29, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51, label %for.inc48.preheader78

for.inc48.preheader78:                            ; preds = %middle.block, %min.iters.checked, %for.inc48.preheader
  %indvars.iv55.ph = phi i64 [ %indvars.iv55.unr, %for.inc48.preheader ], [ %indvars.iv55.unr, %min.iters.checked ], [ %ind.end, %middle.block ]
  br label %for.inc48

for.inc48:                                        ; preds = %for.inc48, %for.inc48.preheader78
  %indvars.iv55 = phi i64 [ %indvars.iv55.ph, %for.inc48.preheader78 ], [ %indvars.iv.next56.7, %for.inc48 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv55
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv.next56
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv.next56.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next56.2 = add nsw i64 %indvars.iv55, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv.next56.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next56.3 = add nsw i64 %indvars.iv55, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv.next56.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next56.4 = add nsw i64 %indvars.iv55, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv.next56.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next56.5 = add nsw i64 %indvars.iv55, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv.next56.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next56.6 = add nsw i64 %indvars.iv55, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv.next56.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next56.7 = add nsw i64 %indvars.iv55, 8
  %exitcond58.7 = icmp eq i64 %indvars.iv.next56.7, 1000
  br i1 %exitcond58.7, label %for.inc51.loopexit, label %for.inc48, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.inc48
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.inc48.prol.loopexit, %for.end38
  %exitcond64 = icmp eq i64 %7, 1000
  br i1 %exitcond64, label %for.end53, label %for.inc51.for.inc36.lr.ph_crit_edge

for.inc51.for.inc36.lr.ph_crit_edge:              ; preds = %for.inc51
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  br label %for.inc36.lr.ph

for.end53:                                        ; preds = %for.inc51
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #0 {
entry:
  %mul44 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert76 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat77 = shufflevector <2 x double> %broadcast.splatinsert76, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert80 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat81 = shufflevector <2 x double> %broadcast.splatinsert80, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert82 = insertelement <2 x double> undef, double %mul44, i32 0
  %broadcast.splat83 = shufflevector <2 x double> %broadcast.splatinsert82, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc53, %entry
  %indvars.iv56 = phi i64 [ 0, %entry ], [ %indvars.iv.next57, %for.inc53 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 0
  %0 = add i64 %indvars.iv56, 1
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp532 = icmp sgt i64 %indvars.iv56, 0
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv56, i64 %indvars.iv56
  br i1 %cmp532, label %for.cond1.preheader.for.cond4.preheader.us_crit_edge, label %vector.memcheck

for.cond1.preheader.for.cond4.preheader.us_crit_edge: ; preds = %for.cond1.preheader
  br label %for.cond4.preheader.us

vector.memcheck:                                  ; preds = %for.cond1.preheader
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv56, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep68
  %bound1 = icmp ult double* %scevgep66, %scevgep64
  %found.conflict = and i1 %bound0, %bound1
  %bound071 = icmp ult double* %scevgep, %arrayidx41
  %bound172 = icmp ult double* %arrayidx41, %scevgep64
  %found.conflict73 = and i1 %bound071, %bound172
  %conflict.rdx = or i1 %found.conflict, %found.conflict73
  br i1 %conflict.rdx, label %vector.memcheck.for.cond4.preheader_crit_edge, label %vector.ph

vector.memcheck.for.cond4.preheader_crit_edge:    ; preds = %vector.memcheck
  br label %for.cond4.preheader

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !8, !noalias !11
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %5 = fmul <2 x double> %wide.load, %broadcast.splat77
  %6 = fmul <2 x double> %wide.load75, %broadcast.splat77
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv56, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !14
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = fmul <2 x double> %wide.load78, %broadcast.splat81
  %12 = fmul <2 x double> %wide.load79, %broadcast.splat81
  %13 = load double, double* %arrayidx41, align 8, !alias.scope !15
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %5, %18
  %21 = fadd <2 x double> %6, %19
  %22 = fadd <2 x double> %broadcast.splat83, %20
  %23 = fadd <2 x double> %broadcast.splat83, %21
  %24 = bitcast double* %1 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !8, !noalias !11
  %25 = bitcast double* %3 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.inc53.loopexit85, label %vector.body, !llvm.loop !16

for.cond4.preheader.us:                           ; preds = %for.cond4.for.inc50_crit_edge.us, %for.cond1.preheader.for.cond4.preheader.us_crit_edge
  %indvars.iv52 = phi i64 [ 0, %for.cond1.preheader.for.cond4.preheader.us_crit_edge ], [ %indvars.iv.next53, %for.cond4.for.inc50_crit_edge.us ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv56, i64 %indvars.iv52
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond4.preheader.us
  %indvars.iv44 = phi i64 [ 0, %for.cond4.preheader.us ], [ %indvars.iv.next45, %for.inc.us ]
  %temp2.034.us = phi double [ 0.000000e+00, %for.cond4.preheader.us ], [ %add27.us, %for.inc.us ]
  %27 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %27, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv56, i64 %indvars.iv44
  %28 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %28
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv44, i64 %indvars.iv52
  %29 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %29, %mul13.us
  store double %add.us, double* %arrayidx17.us, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv52
  %30 = load double, double* %arrayidx21.us, align 8
  %31 = load double, double* %arrayidx12.us, align 8
  %mul26.us = fmul double %30, %31
  %add27.us = fadd double %temp2.034.us, %mul26.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next45, %indvars.iv56
  br i1 %exitcond51, label %for.cond4.for.inc50_crit_edge.us, label %for.inc.us

for.cond4.for.inc50_crit_edge.us:                 ; preds = %for.inc.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %indvars.iv52
  %32 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %32, %beta
  %33 = load double, double* %arrayidx8.us, align 8
  %mul37.us = fmul double %33, %alpha
  %34 = load double, double* %arrayidx41, align 8
  %mul42.us = fmul double %mul37.us, %34
  %add43.us = fadd double %mul32.us, %mul42.us
  %mul44.us = fmul double %add27.us, %alpha
  %add45.us = fadd double %mul44.us, %add43.us
  store double %add45.us, double* %arrayidx31.us, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 1200
  br i1 %exitcond55, label %for.inc53.loopexit, label %for.cond4.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader, %vector.memcheck.for.cond4.preheader_crit_edge
  %indvars.iv = phi i64 [ 0, %vector.memcheck.for.cond4.preheader_crit_edge ], [ %indvars.iv.next, %for.cond4.preheader ]
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %indvars.iv
  %35 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %35, %beta
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv56, i64 %indvars.iv
  %36 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %36, %alpha
  %37 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %37
  %add43 = fadd double %mul32, %mul42
  %add45 = fadd double %mul44, %add43
  store double %add45, double* %arrayidx31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond43, label %for.inc53.loopexit84, label %for.cond4.preheader, !llvm.loop !17

for.inc53.loopexit:                               ; preds = %for.cond4.for.inc50_crit_edge.us
  br label %for.inc53

for.inc53.loopexit84:                             ; preds = %for.cond4.preheader
  br label %for.inc53

for.inc53.loopexit85:                             ; preds = %vector.body
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit85, %for.inc53.loopexit84, %for.inc53.loopexit
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, 1000
  br i1 %exitcond59, label %for.end55, label %for.cond1.preheader

for.end55:                                        ; preds = %for.inc53
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* %C) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv16 = phi i64 [ 0, %entry ], [ %indvars.iv.next17, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv16, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv16, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond15, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond20, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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
