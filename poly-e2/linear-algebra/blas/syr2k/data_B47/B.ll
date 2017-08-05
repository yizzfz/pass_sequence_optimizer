; ModuleID = 'A.ll'
source_filename = "syr2k.c"
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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1000 x double]*
  call void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_syr2k(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
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
  call void @print_array([1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc17_crit_edge.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.cond1.for.inc17_crit_edge.us ], [ 0, %entry ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv31 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next32, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv38, %indvars.iv31
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv31
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, 1000
  %conv10.us = sitofp i32 %rem9.us to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv10.us, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.200000e+03, double 1.000000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx6.us, align 8
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv38, i64 %indvars.iv31
  store double %div.us.v.r2, double* %arrayidx16.us, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond46, label %for.cond1.for.inc17_crit_edge.us, label %for.inc.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next39, 1200
  br i1 %exitcond48, label %for.cond24.preheader.us.preheader, label %for.cond1.preheader.us

for.cond24.preheader.us.preheader:                ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.preheader.us.preheader, %for.cond24.for.inc41_crit_edge.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.cond24.for.inc41_crit_edge.us ], [ 0, %for.cond24.preheader.us.preheader ]
  br label %for.inc38.us

for.inc38.us:                                     ; preds = %for.inc38.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.inc38.us ]
  %5 = mul nuw nsw i64 %indvars.iv26, %indvars.iv
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, 1200
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, 1.000000e+03
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv26, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond44, label %for.cond24.for.inc41_crit_edge.us, label %for.inc38.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.inc38.us
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, 1200
  br i1 %exitcond, label %for.end43, label %for.cond24.preheader.us

for.end43:                                        ; preds = %for.cond24.for.inc41_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) #2 {
entry:
  %broadcast.splatinsert29 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat30 = shufflevector <2 x double> %broadcast.splatinsert29, <2 x double> undef, <2 x i32> zeroinitializer
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2.prol = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.cond6.for.inc43_crit_edge.us, %entry
  %indvars.iv2 = phi i2 [ %indvars.iv.next3, %for.cond6.for.inc43_crit_edge.us ], [ 1, %entry ]
  %indvars.iv72 = phi i64 [ %4, %for.cond6.for.inc43_crit_edge.us ], [ 0, %entry ]
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %for.cond6.for.inc43_crit_edge.us ], [ 1, %entry ]
  %1 = add i64 %indvars.iv72, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv72, i64 0
  %2 = mul i64 %indvars.iv72, 1201
  %3 = add i64 %2, 1
  %scevgep5 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %3
  %4 = add i64 %indvars.iv72, 1
  %5 = zext i2 %indvars.iv2 to i64
  %xtraiter = and i64 %4, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.us.preheader
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv72, i64 %indvars.iv.prol
  %6 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %6, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !1

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.inc.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.inc.us.preheader ], [ %5, %for.inc.us.prol.loopexit.loopexit ]
  %7 = icmp ult i64 %indvars.iv72, 3
  br i1 %7, label %for.cond9.preheader.us43.preheader, label %for.inc.us.preheader32

for.inc.us.preheader32:                           ; preds = %for.inc.us.prol.loopexit
  %8 = sub i64 %1, %indvars.iv.unr
  %9 = lshr i64 %8, 2
  %10 = and i64 %9, 1
  %lcmp.mod36 = icmp eq i64 %10, 0
  br i1 %lcmp.mod36, label %for.inc.us.prol.preheader33, label %for.inc.us.prol.loopexit34.unr-lcssa

for.inc.us.prol.preheader33:                      ; preds = %for.inc.us.preheader32
  %arrayidx5.us.prol39 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv72, i64 %indvars.iv.unr
  %11 = bitcast double* %arrayidx5.us.prol39 to <2 x double>*
  %12 = load <2 x double>, <2 x double>* %11, align 8
  %mul.us.prol40 = fmul <2 x double> %12, %mul.us.v.i1.2.prol
  store <2 x double> %mul.us.prol40, <2 x double>* %11, align 8
  %indvars.iv.next.1.prol = add nuw nsw i64 %indvars.iv.unr, 2
  %arrayidx5.us.2.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv72, i64 %indvars.iv.next.1.prol
  %13 = bitcast double* %arrayidx5.us.2.prol to <2 x double>*
  %14 = load <2 x double>, <2 x double>* %13, align 8
  %mul.us.2.prol = fmul <2 x double> %14, %mul.us.v.i1.2.prol
  store <2 x double> %mul.us.2.prol, <2 x double>* %13, align 8
  %indvars.iv.next.3.prol = or i64 %indvars.iv.unr, 4
  br label %for.inc.us.prol.loopexit34.unr-lcssa

for.inc.us.prol.loopexit34.unr-lcssa:             ; preds = %for.inc.us.preheader32, %for.inc.us.prol.preheader33
  %indvars.iv.unr41.ph = phi i64 [ %indvars.iv.next.3.prol, %for.inc.us.prol.preheader33 ], [ %indvars.iv.unr, %for.inc.us.preheader32 ]
  %15 = icmp eq i64 %9, 0
  br i1 %15, label %for.cond9.preheader.us43.preheader.loopexit, label %for.inc.us.preheader32.new

for.inc.us.preheader32.new:                       ; preds = %for.inc.us.prol.loopexit34.unr-lcssa
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.preheader32.new
  %indvars.iv = phi i64 [ %indvars.iv.unr41.ph, %for.inc.us.preheader32.new ], [ %indvars.iv.next.3.1, %for.inc.us ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv72, i64 %indvars.iv
  %16 = bitcast double* %arrayidx5.us to <2 x double>*
  %17 = load <2 x double>, <2 x double>* %16, align 8
  %mul.us = fmul <2 x double> %17, %mul.us.v.i1.2.prol
  store <2 x double> %mul.us, <2 x double>* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv72, i64 %indvars.iv.next.1
  %18 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %19 = load <2 x double>, <2 x double>* %18, align 8
  %mul.us.2 = fmul <2 x double> %19, %mul.us.v.i1.2.prol
  store <2 x double> %mul.us.2, <2 x double>* %18, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv72, i64 %indvars.iv.next.3
  %20 = bitcast double* %arrayidx5.us.1 to <2 x double>*
  %21 = load <2 x double>, <2 x double>* %20, align 8
  %mul.us.1 = fmul <2 x double> %21, %mul.us.v.i1.2.prol
  store <2 x double> %mul.us.1, <2 x double>* %20, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %arrayidx5.us.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv72, i64 %indvars.iv.next.1.1
  %22 = bitcast double* %arrayidx5.us.2.1 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %mul.us.2.1 = fmul <2 x double> %23, %mul.us.v.i1.2.prol
  store <2 x double> %mul.us.2.1, <2 x double>* %22, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %indvars.iv70
  br i1 %exitcond.3.1, label %for.cond9.preheader.us43.preheader.loopexit.unr-lcssa, label %for.inc.us

for.cond9.preheader.us43.preheader.loopexit.unr-lcssa: ; preds = %for.inc.us
  br label %for.cond9.preheader.us43.preheader.loopexit

for.cond9.preheader.us43.preheader.loopexit:      ; preds = %for.inc.us.prol.loopexit34.unr-lcssa, %for.cond9.preheader.us43.preheader.loopexit.unr-lcssa
  br label %for.cond9.preheader.us43.preheader

for.cond9.preheader.us43.preheader:               ; preds = %for.cond9.preheader.us43.preheader.loopexit, %for.inc.us.prol.loopexit
  %min.iters.check = icmp ult i64 %4, 2
  %n.vec = and i64 %4, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %4, %n.vec
  br label %for.cond9.preheader.us43

for.inc37.us21:                                   ; preds = %for.inc37.us21.preheader, %for.inc37.us21
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.inc37.us21 ], [ %indvars.iv59.ph, %for.inc37.us21.preheader ]
  %arrayidx15.us25 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv65
  %24 = load double, double* %arrayidx15.us25, align 8
  %mul16.us26 = fmul double %24, %alpha
  %25 = load double, double* %arrayidx20.us28, align 8
  %mul21.us29 = fmul double %mul16.us26, %25
  %arrayidx25.us30 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv59, i64 %indvars.iv65
  %26 = load double, double* %arrayidx25.us30, align 8
  %mul26.us31 = fmul double %26, %alpha
  %27 = load double, double* %arrayidx30.us32, align 8
  %mul31.us33 = fmul double %mul26.us31, %27
  %add.us34 = fadd double %mul21.us29, %mul31.us33
  %arrayidx35.us35 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv72, i64 %indvars.iv59
  %28 = load double, double* %arrayidx35.us35, align 8
  %add36.us36 = fadd double %28, %add.us34
  store double %add36.us36, double* %arrayidx35.us35, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next60, %indvars.iv70
  br i1 %exitcond64, label %for.cond9.for.inc40_crit_edge.us47.loopexit, label %for.inc37.us21, !llvm.loop !3

for.cond9.preheader.us43:                         ; preds = %for.cond9.preheader.us43.preheader, %for.cond9.for.inc40_crit_edge.us47
  %indvars.iv65 = phi i64 [ %29, %for.cond9.for.inc40_crit_edge.us47 ], [ 0, %for.cond9.preheader.us43.preheader ]
  %scevgep7 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv65
  %29 = add i64 %indvars.iv65, 1
  %scevgep9 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv72, i64 %29
  %scevgep11 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv65
  %scevgep13 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv72, i64 %29
  %arrayidx20.us28 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv72, i64 %indvars.iv65
  %arrayidx30.us32 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv72, i64 %indvars.iv65
  br i1 %min.iters.check, label %for.inc37.us21.preheader, label %min.iters.checked

for.inc37.us21.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader.us43
  %indvars.iv59.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader.us43 ], [ %n.vec, %middle.block ]
  br label %for.inc37.us21

min.iters.checked:                                ; preds = %for.cond9.preheader.us43
  br i1 %cmp.zero, label %for.inc37.us21.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us32
  %bound1 = icmp ult double* %arrayidx30.us32, %scevgep5
  %found.conflict = and i1 %bound0, %bound1
  %bound016 = icmp ult double* %scevgep, %scevgep9
  %bound117 = icmp ult double* %scevgep7, %scevgep5
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx = or i1 %found.conflict, %found.conflict18
  %bound019 = icmp ult double* %scevgep, %scevgep13
  %bound120 = icmp ult double* %scevgep11, %scevgep5
  %found.conflict21 = and i1 %bound019, %bound120
  %conflict.rdx22 = or i1 %conflict.rdx, %found.conflict21
  %bound025 = icmp ult double* %scevgep, %arrayidx20.us28
  %bound126 = icmp ult double* %arrayidx20.us28, %scevgep5
  %found.conflict27 = and i1 %bound025, %bound126
  %conflict.rdx28 = or i1 %conflict.rdx22, %found.conflict27
  br i1 %conflict.rdx28, label %for.inc37.us21.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %.pre = load double, double* %arrayidx20.us28, align 8, !alias.scope !6
  %.pre31 = load double, double* %arrayidx30.us32, align 8, !alias.scope !9
  %30 = insertelement <2 x double> undef, double %.pre, i32 0
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  %32 = insertelement <2 x double> undef, double %.pre31, i32 0
  %33 = shufflevector <2 x double> %32, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %34 = or i64 %index, 1
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv65
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %34, i64 %indvars.iv65
  %37 = load double, double* %35, align 8, !alias.scope !11
  %38 = load double, double* %36, align 8, !alias.scope !11
  %39 = insertelement <2 x double> undef, double %37, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fmul <2 x double> %40, %broadcast.splat30
  %42 = fmul <2 x double> %41, %31
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index, i64 %indvars.iv65
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %34, i64 %indvars.iv65
  %45 = load double, double* %43, align 8, !alias.scope !13
  %46 = load double, double* %44, align 8, !alias.scope !13
  %47 = insertelement <2 x double> undef, double %45, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  %49 = fmul <2 x double> %48, %broadcast.splat30
  %50 = fmul <2 x double> %49, %33
  %51 = fadd <2 x double> %42, %50
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv72, i64 %index
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !15, !noalias !17
  %54 = fadd <2 x double> %wide.load, %51
  store <2 x double> %54, <2 x double>* %53, align 8, !alias.scope !15, !noalias !17
  %index.next = add i64 %index, 2
  %55 = icmp eq i64 %index.next, %n.vec
  br i1 %55, label %middle.block, label %vector.body, !llvm.loop !18

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond9.for.inc40_crit_edge.us47, label %for.inc37.us21.preheader

for.cond9.for.inc40_crit_edge.us47.loopexit:      ; preds = %for.inc37.us21
  br label %for.cond9.for.inc40_crit_edge.us47

for.cond9.for.inc40_crit_edge.us47:               ; preds = %for.cond9.for.inc40_crit_edge.us47.loopexit, %middle.block
  %exitcond = icmp eq i64 %29, 1000
  br i1 %exitcond, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us43

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us47
  %exitcond87 = icmp eq i64 %4, 1200
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %indvars.iv.next3 = add i2 %indvars.iv2, 1
  br i1 %exitcond87, label %for.end45, label %for.inc.us.preheader

for.end45:                                        ; preds = %for.cond6.for.inc43_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly %C) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv12, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv12, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond19, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, 1200
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

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
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!14}
!14 = distinct !{!14, !8}
!15 = !{!16}
!16 = distinct !{!16, !8}
!17 = !{!10, !12, !14, !7}
!18 = distinct !{!18, !4, !5}
