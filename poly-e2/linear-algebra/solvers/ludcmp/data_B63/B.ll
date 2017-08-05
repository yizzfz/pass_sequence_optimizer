; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
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
  %1 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(i32 2000, double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
for.inc.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv110 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next111.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv110
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv110
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next111 = or i64 %indvars.iv110, 1
  %0 = trunc i64 %indvars.iv.next111 to i32
  %conv4 = sitofp i32 %0 to double
  %div = fdiv double %conv4, 2.000000e+03
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv110
  store double %add6, double* %arrayidx8, align 8
  %arrayidx.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next111
  store double 0.000000e+00, double* %arrayidx.1, align 8
  %arrayidx3.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next111
  store double 0.000000e+00, double* %arrayidx3.1, align 8
  %indvars.iv.next111.1 = add nuw nsw i64 %indvars.iv110, 2
  %1 = trunc i64 %indvars.iv.next111.1 to i32
  %conv4.1 = sitofp i32 %1 to double
  %div.1 = fdiv double %conv4.1, 2.000000e+03
  %div5.1 = fmul double %div.1, 5.000000e-01
  %add6.1 = fadd double %div5.1, 4.000000e+00
  %arrayidx8.1 = getelementptr inbounds double, double* %b, i64 %indvars.iv.next111
  store double %add6.1, double* %arrayidx8.1, align 8
  %cmp.1 = icmp slt i64 %indvars.iv.next111.1, 2000
  br i1 %cmp.1, label %for.inc, label %for.body12.preheader

for.body12.preheader:                             ; preds = %for.inc
  br label %for.body12

for.body12:                                       ; preds = %for.body12.preheader, %for.inc44.for.body12_crit_edge
  %2 = phi [2000 x double]* [ %7, %for.inc44.for.body12_crit_edge ], [ %A, %for.body12.preheader ]
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %for.inc44.for.body12_crit_edge ], [ 0, %for.body12.preheader ]
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %for.inc44.for.body12_crit_edge ], [ 1, %for.body12.preheader ]
  %indvars.iv98 = phi i32 [ %indvars.iv.next99, %for.inc44.for.body12_crit_edge ], [ 0, %for.body12.preheader ]
  %sext = shl i64 %indvars.iv102, 32
  %3 = ashr exact i64 %sext, 32
  %cmp1457 = icmp sgt i64 %indvars.iv108, -1
  br i1 %cmp1457, label %for.inc25.preheader, label %for.end27

for.inc25.preheader:                              ; preds = %for.body12
  %wide.trip.count100 = zext i32 %indvars.iv98 to i64
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25, %for.inc25.preheader
  %indvars.iv95 = phi i64 [ 0, %for.inc25.preheader ], [ %indvars.iv.next96, %for.inc25 ]
  %4 = sub nsw i64 0, %indvars.iv95
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv108, i64 %indvars.iv95
  store double %add20, double* %arrayidx24, align 8
  %exitcond101 = icmp eq i64 %indvars.iv95, %wide.trip.count100
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  br i1 %exitcond101, label %for.inc25.for.end27_crit_edge, label %for.inc25

for.inc25.for.end27_crit_edge:                    ; preds = %for.inc25
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end27

for.end27:                                        ; preds = %for.body12, %for.inc25.for.end27_crit_edge
  %6 = phi [2000 x double]* [ %.pre, %for.inc25.for.end27_crit_edge ], [ %2, %for.body12 ]
  %indvars.iv.next109 = add i64 %indvars.iv108, 1
  %cmp3059 = icmp slt i64 %indvars.iv.next109, 2000
  br i1 %cmp3059, label %for.inc37.lr.ph, label %for.body50.lr.ph.for.body50.us_crit_edge

for.inc37.lr.ph:                                  ; preds = %for.end27
  %7 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %8 = sub nsw i64 1999, %3
  %9 = sub nsw i64 0, %3
  %xtraiter = and i64 %9, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc37.prol.loopexit, label %for.inc37.prol.preheader

for.inc37.prol.preheader:                         ; preds = %for.inc37.lr.ph
  br label %for.inc37.prol

for.inc37.prol:                                   ; preds = %for.inc37.prol, %for.inc37.prol.preheader
  %indvars.iv104.prol = phi i64 [ %3, %for.inc37.prol.preheader ], [ %indvars.iv.next105.prol, %for.inc37.prol ]
  %10 = phi [2000 x double]* [ %6, %for.inc37.prol.preheader ], [ %7, %for.inc37.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc37.prol.preheader ], [ %prol.iter.sub, %for.inc37.prol ]
  %arrayidx36.prol = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv108, i64 %indvars.iv104.prol
  store double 0.000000e+00, double* %arrayidx36.prol, align 8
  %indvars.iv.next105.prol = add nsw i64 %indvars.iv104.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc37.prol.loopexit.unr-lcssa, label %for.inc37.prol, !llvm.loop !1

for.inc37.prol.loopexit.unr-lcssa:                ; preds = %for.inc37.prol
  %11 = add i64 %3, %xtraiter
  br label %for.inc37.prol.loopexit

for.inc37.prol.loopexit:                          ; preds = %for.inc37.lr.ph, %for.inc37.prol.loopexit.unr-lcssa
  %indvars.iv104.unr = phi i64 [ %11, %for.inc37.prol.loopexit.unr-lcssa ], [ %3, %for.inc37.lr.ph ]
  %.unr = phi [2000 x double]* [ %7, %for.inc37.prol.loopexit.unr-lcssa ], [ %6, %for.inc37.lr.ph ]
  %12 = icmp ult i64 %8, 7
  br i1 %12, label %for.inc44.for.body12_crit_edge, label %for.inc37.lr.ph.new

for.inc37.lr.ph.new:                              ; preds = %for.inc37.prol.loopexit
  br label %for.inc37

for.inc37:                                        ; preds = %for.inc37, %for.inc37.lr.ph.new
  %indvars.iv104 = phi i64 [ %indvars.iv104.unr, %for.inc37.lr.ph.new ], [ %indvars.iv.next105.7, %for.inc37 ]
  %13 = phi [2000 x double]* [ %.unr, %for.inc37.lr.ph.new ], [ %7, %for.inc37 ]
  %arrayidx36 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv108, i64 %indvars.iv104
  store double 0.000000e+00, double* %arrayidx36, align 8
  %indvars.iv.next105 = add nsw i64 %indvars.iv104, 1
  %arrayidx36.1 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv108, i64 %indvars.iv.next105
  store double 0.000000e+00, double* %arrayidx36.1, align 8
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  %arrayidx36.2 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv108, i64 %indvars.iv.next105.1
  store double 0.000000e+00, double* %arrayidx36.2, align 8
  %indvars.iv.next105.2 = add nsw i64 %indvars.iv104, 3
  %arrayidx36.3 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv108, i64 %indvars.iv.next105.2
  store double 0.000000e+00, double* %arrayidx36.3, align 8
  %indvars.iv.next105.3 = add nsw i64 %indvars.iv104, 4
  %arrayidx36.4 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv108, i64 %indvars.iv.next105.3
  store double 0.000000e+00, double* %arrayidx36.4, align 8
  %indvars.iv.next105.4 = add nsw i64 %indvars.iv104, 5
  %arrayidx36.5 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv108, i64 %indvars.iv.next105.4
  store double 0.000000e+00, double* %arrayidx36.5, align 8
  %indvars.iv.next105.5 = add nsw i64 %indvars.iv104, 6
  %arrayidx36.6 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv108, i64 %indvars.iv.next105.5
  store double 0.000000e+00, double* %arrayidx36.6, align 8
  %indvars.iv.next105.6 = add nsw i64 %indvars.iv104, 7
  %arrayidx36.7 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv108, i64 %indvars.iv.next105.6
  store double 0.000000e+00, double* %arrayidx36.7, align 8
  %exitcond107.7 = icmp eq i64 %indvars.iv.next105.6, 1999
  %indvars.iv.next105.7 = add nsw i64 %indvars.iv104, 8
  br i1 %exitcond107.7, label %for.inc44.for.body12_crit_edge.loopexit, label %for.inc37

for.inc44.for.body12_crit_edge.loopexit:          ; preds = %for.inc37
  br label %for.inc44.for.body12_crit_edge

for.inc44.for.body12_crit_edge:                   ; preds = %for.inc44.for.body12_crit_edge.loopexit, %for.inc37.prol.loopexit
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv108, i64 %indvars.iv108
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvars.iv.next99 = add i32 %indvars.iv98, 1
  %indvars.iv.next103 = add nsw i64 %3, 1
  br label %for.body12

for.body50.lr.ph.for.body50.us_crit_edge:         ; preds = %for.end27
  %arrayidx43121 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv108, i64 %indvars.iv108
  store double 1.000000e+00, double* %arrayidx43121, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.body50.us

for.body50.us:                                    ; preds = %for.body50.us, %for.body50.lr.ph.for.body50.us_crit_edge
  %indvars.iv92 = phi i64 [ 0, %for.body50.lr.ph.for.body50.us_crit_edge ], [ %indvars.iv.next93.4, %for.body50.us ]
  %14 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv92, i64 0
  %scevgep91 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep91, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvars.iv92, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvar.next, i64 0
  %scevgep91.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep91.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.1 = add nuw nsw i64 %indvars.iv92, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvar.next.1, i64 0
  %scevgep91.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep91.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.2 = add nuw nsw i64 %indvars.iv92, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvar.next.2, i64 0
  %scevgep91.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep91.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.3 = add nuw nsw i64 %indvars.iv92, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvar.next.3, i64 0
  %scevgep91.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep91.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next93.4 = add nuw nsw i64 %indvars.iv92, 5
  %cmp48.us.4 = icmp slt i64 %indvars.iv.next93.4, 2000
  br i1 %cmp48.us.4, label %for.body50.us, label %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge

for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge: ; preds = %for.body50.us
  %15 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body72.lr.ph.us

for.inc96.us:                                     ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %cmp66.us = icmp slt i64 %16, 2000
  br i1 %cmp66.us, label %for.body72.lr.ph.us, label %vector.memcheck163.preheader

vector.memcheck163.preheader:                     ; preds = %for.inc96.us
  br label %vector.memcheck163

for.body72.lr.ph.us:                              ; preds = %for.inc96.us, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge
  %indvars.iv84 = phi i64 [ 0, %for.cond69.preheader.lr.ph.for.cond69.preheader.us_crit_edge ], [ %16, %for.inc96.us ]
  %scevgep136 = getelementptr [2000 x double], [2000 x double]* %15, i64 0, i64 %indvars.iv84
  %16 = add i64 %indvars.iv84, 1
  %scevgep138 = getelementptr [2000 x double], [2000 x double]* %15, i64 1999, i64 %16
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond73.for.inc93_crit_edge.us.us, %for.body72.lr.ph.us
  %indvars.iv82 = phi i64 [ 0, %for.body72.lr.ph.us ], [ %indvars.iv.next83, %for.cond73.for.inc93_crit_edge.us.us ]
  %17 = bitcast double* %scevgep136 to i8*
  %18 = bitcast double* %scevgep138 to i8*
  %19 = mul i64 %indvars.iv82, 16000
  %scevgep134 = getelementptr i8, i8* %call, i64 %19
  %20 = add i64 %19, 16000
  %scevgep135 = getelementptr i8, i8* %call, i64 %20
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv82, i64 %indvars.iv84
  %bound0 = icmp ult i8* %scevgep134, %18
  %bound1 = icmp ult i8* %17, %scevgep135
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80.us.us to i8*
  %bound0141 = icmp ult i8* %scevgep134, %bc
  %bound1142 = icmp ult i8* %bc, %scevgep135
  %found.conflict143 = and i1 %bound0141, %bound1142
  %conflict.rdx = or i1 %found.conflict, %found.conflict143
  br i1 %conflict.rdx, label %for.inc90.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.inc90.us.us.preheader:                        ; preds = %vector.memcheck
  br label %for.inc90.us.us

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %22 = or i64 %index, 1
  %23 = or i64 %index, 2
  %24 = or i64 %index, 3
  %25 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !3
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %index, i64 %indvars.iv84
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %22, i64 %indvars.iv84
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %23, i64 %indvars.iv84
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %24, i64 %indvars.iv84
  %32 = load double, double* %28, align 8, !alias.scope !6
  %33 = load double, double* %29, align 8, !alias.scope !6
  %34 = load double, double* %30, align 8, !alias.scope !6
  %35 = load double, double* %31, align 8, !alias.scope !6
  %36 = insertelement <2 x double> undef, double %32, i32 0
  %37 = insertelement <2 x double> %36, double %33, i32 1
  %38 = insertelement <2 x double> undef, double %34, i32 0
  %39 = insertelement <2 x double> %38, double %35, i32 1
  %40 = fmul <2 x double> %27, %37
  %41 = fmul <2 x double> %27, %39
  %42 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv82, i64 %index
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load145 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !8, !noalias !10
  %46 = fadd <2 x double> %40, %wide.load
  %47 = fadd <2 x double> %41, %wide.load145
  store <2 x double> %46, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %47, <2 x double>* %45, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %48 = icmp eq i64 %index.next, 2000
  br i1 %48, label %for.cond73.for.inc93_crit_edge.us.us.loopexit179, label %vector.body, !llvm.loop !11

for.cond73.for.inc93_crit_edge.us.us.loopexit:    ; preds = %for.inc90.us.us
  br label %for.cond73.for.inc93_crit_edge.us.us

for.cond73.for.inc93_crit_edge.us.us.loopexit179: ; preds = %vector.body
  br label %for.cond73.for.inc93_crit_edge.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.cond73.for.inc93_crit_edge.us.us.loopexit179, %for.cond73.for.inc93_crit_edge.us.us.loopexit
  %indvars.iv.next83 = add i64 %indvars.iv82, 1
  %cmp70.us.us = icmp slt i64 %indvars.iv.next83, 2000
  br i1 %cmp70.us.us, label %vector.memcheck, label %for.inc96.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us, %for.inc90.us.us.preheader
  %indvars.iv78 = phi i64 [ 0, %for.inc90.us.us.preheader ], [ %indvars.iv.next79.1, %for.inc90.us.us ]
  %49 = bitcast i8* %call to [2000 x [2000 x double]]*
  %50 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv78, i64 %indvars.iv84
  %51 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %50, %51
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv82, i64 %indvars.iv78
  %52 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %mul.us.us, %52
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next79 = or i64 %indvars.iv78, 1
  %53 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv.next79, i64 %indvars.iv84
  %54 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %53, %54
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next79
  %55 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %mul.us.us.1, %55
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond81.1 = icmp eq i64 %indvars.iv.next79, 1999
  %indvars.iv.next79.1 = add nuw nsw i64 %indvars.iv78, 2
  br i1 %exitcond81.1, label %for.cond73.for.inc93_crit_edge.us.us.loopexit, label %for.inc90.us.us, !llvm.loop !14

vector.memcheck163:                               ; preds = %for.cond103.for.inc118_crit_edge.us, %vector.memcheck163.preheader
  %indvars.iv76 = phi i64 [ 0, %vector.memcheck163.preheader ], [ %57, %for.cond103.for.inc118_crit_edge.us ]
  %56 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep151 = getelementptr [2000 x double], [2000 x double]* %15, i64 %indvars.iv76, i64 0
  %57 = add i64 %indvars.iv76, 1
  %scevgep153 = getelementptr [2000 x double], [2000 x double]* %15, i64 %57, i64 0
  %scevgep155 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv76, i64 0
  %scevgep157 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %57, i64 0
  %bound0159 = icmp ult double* %scevgep151, %scevgep157
  %bound1160 = icmp ult double* %scevgep155, %scevgep153
  %memcheck.conflict162 = and i1 %bound0159, %bound1160
  br i1 %memcheck.conflict162, label %for.inc115.us.preheader, label %vector.body146.preheader

vector.body146.preheader:                         ; preds = %vector.memcheck163
  br label %vector.body146

for.inc115.us.preheader:                          ; preds = %vector.memcheck163
  br label %for.inc115.us

vector.body146:                                   ; preds = %vector.body146, %vector.body146.preheader
  %index165 = phi i64 [ 0, %vector.body146.preheader ], [ %index.next166.1, %vector.body146 ]
  %58 = bitcast i8* %call to [2000 x [2000 x double]]*
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv76, i64 %index165
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load173 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !15
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load174 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !15
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv76, i64 %index165
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load173, <2 x i64>* %64, align 8, !alias.scope !18, !noalias !15
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load174, <2 x i64>* %66, align 8, !alias.scope !18, !noalias !15
  %index.next166 = or i64 %index165, 4
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv76, i64 %index.next166
  %68 = bitcast double* %67 to <2 x i64>*
  %wide.load173.1 = load <2 x i64>, <2 x i64>* %68, align 8, !alias.scope !15
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  %wide.load174.1 = load <2 x i64>, <2 x i64>* %70, align 8, !alias.scope !15
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv76, i64 %index.next166
  %72 = bitcast double* %71 to <2 x i64>*
  store <2 x i64> %wide.load173.1, <2 x i64>* %72, align 8, !alias.scope !18, !noalias !15
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x i64>*
  store <2 x i64> %wide.load174.1, <2 x i64>* %74, align 8, !alias.scope !18, !noalias !15
  %index.next166.1 = add nuw nsw i64 %index165, 8
  %75 = icmp eq i64 %index.next166.1, 2000
  br i1 %75, label %for.cond103.for.inc118_crit_edge.us.loopexit178, label %vector.body146, !llvm.loop !20

for.inc115.us:                                    ; preds = %for.inc115.us, %for.inc115.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc115.us.preheader ], [ %indvars.iv.next.4, %for.inc115.us ]
  %76 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv76, i64 %indvars.iv
  %77 = bitcast double* %arrayidx110.us to i64*
  %78 = load i64, i64* %77, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv76, i64 %indvars.iv
  %79 = bitcast double* %arrayidx114.us to i64*
  store i64 %78, i64* %79, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv76, i64 %indvars.iv.next
  %80 = bitcast double* %arrayidx110.us.1 to i64*
  %81 = load i64, i64* %80, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv76, i64 %indvars.iv.next
  %82 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %81, i64* %82, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv76, i64 %indvars.iv.next.1
  %83 = bitcast double* %arrayidx110.us.2 to i64*
  %84 = load i64, i64* %83, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv76, i64 %indvars.iv.next.1
  %85 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %84, i64* %85, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv76, i64 %indvars.iv.next.2
  %86 = bitcast double* %arrayidx110.us.3 to i64*
  %87 = load i64, i64* %86, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv76, i64 %indvars.iv.next.2
  %88 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %87, i64* %88, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx110.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv76, i64 %indvars.iv.next.3
  %89 = bitcast double* %arrayidx110.us.4 to i64*
  %90 = load i64, i64* %89, align 8
  %arrayidx114.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv76, i64 %indvars.iv.next.3
  %91 = bitcast double* %arrayidx114.us.4 to i64*
  store i64 %90, i64* %91, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.cond103.for.inc118_crit_edge.us.loopexit, label %for.inc115.us, !llvm.loop !21

for.cond103.for.inc118_crit_edge.us.loopexit:     ; preds = %for.inc115.us
  br label %for.cond103.for.inc118_crit_edge.us

for.cond103.for.inc118_crit_edge.us.loopexit178:  ; preds = %vector.body146
  br label %for.cond103.for.inc118_crit_edge.us

for.cond103.for.inc118_crit_edge.us:              ; preds = %for.cond103.for.inc118_crit_edge.us.loopexit178, %for.cond103.for.inc118_crit_edge.us.loopexit
  %cmp100.us = icmp slt i64 %57, 2000
  br i1 %cmp100.us, label %vector.memcheck163, label %for.end120

for.end120:                                       ; preds = %for.cond103.for.inc118_crit_edge.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
for.body.lr.ph:
  br label %for.body

for.body:                                         ; preds = %for.inc58.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv107 = phi i3 [ %indvars.iv.next108, %for.inc58.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.inc58.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %for.inc58.for.body_crit_edge ], [ 4294967295, %for.body.lr.ph ]
  %0 = zext i3 %indvars.iv107 to i64
  %1 = add i64 %indvars.iv105, %0
  %2 = sub i64 1999, %indvars.iv105
  %3 = and i64 %indvars.iv77, 4294967295
  %cmp222 = icmp sgt i64 %indvars.iv105, 0
  br i1 %cmp222, label %for.body3.preheader, label %for.body30.lr.ph

for.body3.preheader:                              ; preds = %for.body
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 0
  br label %for.body3

for.body3:                                        ; preds = %for.inc25, %for.body3.preheader
  %indvars.iv66 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next67, %for.inc25 ]
  %indvars.iv62 = phi i64 [ 4294967295, %for.body3.preheader ], [ %indvars.iv.next63, %for.inc25 ]
  %4 = and i64 %indvars.iv62, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv66
  %5 = load double, double* %arrayidx5, align 8
  %cmp719 = icmp sgt i64 %indvars.iv66, 0
  br i1 %cmp719, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %6 = and i64 %indvars.iv62, 1
  %lcmp.mod95 = icmp eq i64 %6, 0
  br i1 %lcmp.mod95, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  %7 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv66
  %8 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %7, %8
  %sub.prol = fsub double %5, %mul.prol
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ undef, %for.inc.preheader ]
  %indvars.iv60.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.preheader ]
  %sub21.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ %5, %for.inc.preheader ]
  %9 = icmp eq i64 %4, 0
  br i1 %9, label %for.inc25, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv60 = phi i64 [ %indvars.iv60.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next61.1, %for.inc ]
  %sub21 = phi double [ %sub21.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv60
  %10 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv66
  %11 = load double, double* %arrayidx16, align 8
  %mul = fmul double %10, %11
  %sub = fsub double %sub21, %mul
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv.next61
  %12 = load double, double* %arrayidx12.1, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next61, i64 %indvars.iv66
  %13 = load double, double* %arrayidx16.1, align 8
  %mul.1 = fmul double %12, %13
  %sub.1 = fsub double %sub, %mul.1
  %exitcond65.1 = icmp eq i64 %indvars.iv.next61, %4
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  br i1 %exitcond65.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit.unr-lcssa, %for.body3
  %sub.lcssa26 = phi double [ %5, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit.unr-lcssa ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv66
  %14 = load double, double* %arrayidx20, align 8
  %div = fdiv double %sub.lcssa26, %14
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next67 = add nuw i64 %indvars.iv66, 1
  %cmp2 = icmp slt i64 %indvars.iv.next67, %indvars.iv105
  %indvars.iv.next63 = add nuw nsw i64 %4, 1
  br i1 %cmp2, label %for.body3, label %for.body30.lr.ph.loopexit

for.body30.lr.ph.loopexit:                        ; preds = %for.inc25
  br label %for.body30.lr.ph

for.body30.lr.ph:                                 ; preds = %for.body30.lr.ph.loopexit, %for.body
  %15 = icmp sgt i64 %indvars.iv105, 0
  br i1 %15, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.body30.lr.ph
  %16 = sub i64 0, %indvars.iv105
  %xtraiter96 = and i64 %16, 7
  %lcmp.mod97 = icmp eq i64 %xtraiter96, 0
  br i1 %lcmp.mod97, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %prol.iter98 = phi i64 [ %xtraiter96, %for.body30.prol.preheader ], [ %prol.iter98.sub, %for.body30.prol ]
  %prol.iter98.sub = add nsw i64 %prol.iter98, -1
  %prol.iter98.cmp = icmp eq i64 %prol.iter98.sub, 0
  br i1 %prol.iter98.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !22

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.preheader
  %indvars.iv70.unr = phi i64 [ %indvars.iv105, %for.body30.preheader ], [ %1, %for.body30.prol.loopexit.loopexit ]
  %17 = icmp ult i64 %2, 7
  br i1 %17, label %for.inc58, label %for.body30.preheader.new

for.body30.preheader.new:                         ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %18 = and i64 %indvars.iv77, 1
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.cond35.for.inc55_crit_edge.us, %for.body30.us.preheader
  %indvars.iv83 = phi i64 [ %indvars.iv105, %for.body30.us.preheader ], [ %indvars.iv.next84, %for.cond35.for.inc55_crit_edge.us ]
  %19 = icmp eq i64 %18, 0
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv83
  %20 = load double, double* %arrayidx34.us, align 8
  br i1 %19, label %for.inc48.us.prol.preheader, label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.preheader:                      ; preds = %for.body30.us
  %21 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv83
  %22 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %21, %22
  %sub47.us.prol = fsub double %20, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.body30.us, %for.inc48.us.prol.preheader
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol.preheader ], [ undef, %for.body30.us ]
  %indvars.iv75.unr.ph = phi i64 [ 1, %for.inc48.us.prol.preheader ], [ 0, %for.body30.us ]
  %sub4729.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol.preheader ], [ %20, %for.body30.us ]
  %23 = icmp eq i64 %3, 0
  br i1 %23, label %for.cond35.for.inc55_crit_edge.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv75 = phi i64 [ %indvars.iv75.unr.ph, %for.body30.us.new ], [ %indvars.iv.next76.1, %for.inc48.us ]
  %sub4729.us = phi double [ %sub4729.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv75
  %24 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv83
  %25 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %24, %25
  %sub47.us = fsub double %sub4729.us, %mul46.us
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv.next76
  %26 = load double, double* %arrayidx41.us.1, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next76, i64 %indvars.iv83
  %27 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.1 = fmul double %26, %27
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.1
  %exitcond80.1 = icmp eq i64 %indvars.iv.next76, %3
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  br i1 %exitcond80.1, label %for.cond35.for.inc55_crit_edge.us.loopexit, label %for.inc48.us

for.cond35.for.inc55_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond35.for.inc55_crit_edge.us

for.cond35.for.inc55_crit_edge.us:                ; preds = %for.cond35.for.inc55_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit.unr-lcssa
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit.unr-lcssa ], [ %sub47.us.1, %for.cond35.for.inc55_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next84 = add i64 %indvars.iv83, 1
  %cmp29.us = icmp slt i64 %indvars.iv.next84, 2000
  br i1 %cmp29.us, label %for.body30.us, label %for.inc58.loopexit

for.body30:                                       ; preds = %for.body30, %for.body30.preheader.new
  %indvars.iv70 = phi i64 [ %indvars.iv70.unr, %for.body30.preheader.new ], [ %indvars.iv.next71.7, %for.body30 ]
  %exitcond73.7 = icmp eq i64 %indvars.iv70, 1992
  %indvars.iv.next71.7 = add i64 %indvars.iv70, 8
  br i1 %exitcond73.7, label %for.inc58.loopexit109, label %for.body30

for.inc58.loopexit:                               ; preds = %for.cond35.for.inc55_crit_edge.us
  br label %for.inc58

for.inc58.loopexit109:                            ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit109, %for.inc58.loopexit, %for.body30.prol.loopexit
  %indvars.iv.next106 = add i64 %indvars.iv105, 1
  %cmp = icmp slt i64 %indvars.iv.next106, 2000
  %indvars.iv.next78 = add nuw nsw i64 %3, 1
  br i1 %cmp, label %for.inc58.for.body_crit_edge, label %for.body63.preheader

for.inc58.for.body_crit_edge:                     ; preds = %for.inc58
  %indvars.iv.next108 = add i3 %indvars.iv107, -1
  br label %for.body

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.inc82.for.body63_crit_edge, %for.body63.preheader
  %indvars.iv = phi i2 [ %indvars.iv.next, %for.inc82.for.body63_crit_edge ], [ 0, %for.body63.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc82.for.body63_crit_edge ], [ 0, %for.body63.preheader ]
  %indvars.iv54 = phi i32 [ %indvars.iv.next55, %for.inc82.for.body63_crit_edge ], [ -1, %for.body63.preheader ]
  %28 = zext i2 %indvars.iv to i64
  %29 = add i64 %indvars.iv58, 4294967295
  %30 = and i64 %29, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv58
  %31 = load double, double* %arrayidx65, align 8
  %cmp6710 = icmp sgt i64 %indvars.iv58, 0
  br i1 %cmp6710, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  %wide.trip.count56 = zext i32 %indvars.iv54 to i64
  %xtraiter91 = and i64 %indvars.iv58, 3
  %lcmp.mod92 = icmp eq i64 %xtraiter91, 0
  br i1 %lcmp.mod92, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol, %for.inc77.prol.preheader
  %indvars.iv52.prol = phi i64 [ 0, %for.inc77.prol.preheader ], [ %indvars.iv.next53.prol, %for.inc77.prol ]
  %sub7612.prol = phi double [ %31, %for.inc77.prol.preheader ], [ %sub76.prol, %for.inc77.prol ]
  %prol.iter93 = phi i64 [ %xtraiter91, %for.inc77.prol.preheader ], [ %prol.iter93.sub, %for.inc77.prol ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv52.prol
  %32 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv52.prol
  %33 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %32, %33
  %sub76.prol = fsub double %sub7612.prol, %mul75.prol
  %indvars.iv.next53.prol = add nuw nsw i64 %indvars.iv52.prol, 1
  %prol.iter93.sub = add nsw i64 %prol.iter93, -1
  %prol.iter93.cmp = icmp eq i64 %prol.iter93.sub, 0
  br i1 %prol.iter93.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !23

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv52.unr = phi i64 [ 0, %for.inc77.preheader ], [ %28, %for.inc77.prol.loopexit.loopexit ]
  %sub7612.unr = phi double [ %31, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %34 = icmp ult i64 %30, 3
  br i1 %34, label %for.inc82, label %for.inc77.preheader.new

for.inc77.preheader.new:                          ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.inc77.preheader.new
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr, %for.inc77.preheader.new ], [ %indvars.iv.next53.3, %for.inc77 ]
  %sub7612 = phi double [ %sub7612.unr, %for.inc77.preheader.new ], [ %sub76.3, %for.inc77 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv52
  %35 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv52
  %36 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %35, %36
  %sub76 = fsub double %sub7612, %mul75
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %arrayidx72.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next53
  %37 = load double, double* %arrayidx72.1, align 8
  %arrayidx74.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next53
  %38 = load double, double* %arrayidx74.1, align 8
  %mul75.1 = fmul double %37, %38
  %sub76.1 = fsub double %sub76, %mul75.1
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next53.1
  %39 = load double, double* %arrayidx72.2, align 8
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next53.1
  %40 = load double, double* %arrayidx74.2, align 8
  %mul75.2 = fmul double %39, %40
  %sub76.2 = fsub double %sub76.1, %mul75.2
  %indvars.iv.next53.2 = add nsw i64 %indvars.iv52, 3
  %arrayidx72.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next53.2
  %41 = load double, double* %arrayidx72.3, align 8
  %arrayidx74.3 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next53.2
  %42 = load double, double* %arrayidx74.3, align 8
  %mul75.3 = fmul double %41, %42
  %sub76.3 = fsub double %sub76.2, %mul75.3
  %exitcond57.3 = icmp eq i64 %indvars.iv.next53.2, %wide.trip.count56
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  br i1 %exitcond57.3, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %sub76.lcssa18 = phi double [ %31, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv58
  store double %sub76.lcssa18, double* %arrayidx81, align 8
  %indvars.iv.next59 = add i64 %indvars.iv58, 1
  %cmp62 = icmp slt i64 %indvars.iv.next59, 2000
  %indvars.iv.next55 = add i32 %indvars.iv54, 1
  br i1 %cmp62, label %for.inc82.for.body63_crit_edge, label %for.body88.preheader

for.inc82.for.body63_crit_edge:                   ; preds = %for.inc82
  %indvars.iv.next = add i2 %indvars.iv, 1
  br label %for.body63

for.body88.preheader:                             ; preds = %for.inc82
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112.for.body88_crit_edge
  %indvars.iv103 = phi i2 [ 0, %for.body88.preheader ], [ %indvars.iv.next104, %for.inc112.for.body88_crit_edge ]
  %indvars.iv101 = phi i32 [ 2000, %for.body88.preheader ], [ %indvars.iv.next102, %for.inc112.for.body88_crit_edge ]
  %indvar = phi i32 [ 0, %for.body88.preheader ], [ %indvar.next, %for.inc112.for.body88_crit_edge ]
  %indvars.iv49 = phi i64 [ 1999, %for.body88.preheader ], [ %indvars.iv.next50, %for.inc112.for.body88_crit_edge ]
  %43 = sext i32 %indvars.iv101 to i64
  %44 = zext i2 %indvars.iv103 to i64
  %45 = add i64 %43, %44
  %46 = sub i32 2000, %indvar
  %47 = sext i32 %46 to i64
  %48 = sub nsw i64 1999, %47
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv49
  %49 = load double, double* %arrayidx90, align 8
  %50 = add nsw i64 %indvars.iv49, 1
  %cmp921 = icmp slt i64 %50, 2000
  br i1 %cmp921, label %for.inc102.lr.ph, label %for.inc112

for.inc102.lr.ph:                                 ; preds = %for.body88
  %51 = sext i32 %indvars.iv101 to i64
  %52 = sub nsw i64 0, %47
  %xtraiter = and i64 %52, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.lr.ph
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol, %for.inc102.prol.preheader
  %indvars.iv47.prol = phi i64 [ %51, %for.inc102.prol.preheader ], [ %indvars.iv.next48.prol, %for.inc102.prol ]
  %sub1013.prol = phi double [ %49, %for.inc102.prol.preheader ], [ %sub101.prol, %for.inc102.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc102.prol.preheader ], [ %prol.iter.sub, %for.inc102.prol ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv47.prol
  %53 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv47.prol
  %54 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %53, %54
  %sub101.prol = fsub double %sub1013.prol, %mul100.prol
  %indvars.iv.next48.prol = add nsw i64 %indvars.iv47.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !24

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.lr.ph
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.lr.ph ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %indvars.iv47.unr = phi i64 [ %51, %for.inc102.lr.ph ], [ %45, %for.inc102.prol.loopexit.loopexit ]
  %sub1013.unr = phi double [ %49, %for.inc102.lr.ph ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %55 = icmp ult i64 %48, 3
  br i1 %55, label %for.inc112, label %for.inc102.lr.ph.new

for.inc102.lr.ph.new:                             ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102, %for.inc102.lr.ph.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %for.inc102.lr.ph.new ], [ %indvars.iv.next48.3, %for.inc102 ]
  %sub1013 = phi double [ %sub1013.unr, %for.inc102.lr.ph.new ], [ %sub101.3, %for.inc102 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv47
  %56 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv47
  %57 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %56, %57
  %sub101 = fsub double %sub1013, %mul100
  %indvars.iv.next48 = add nsw i64 %indvars.iv47, 1
  %arrayidx97.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv.next48
  %58 = load double, double* %arrayidx97.1, align 8
  %arrayidx99.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next48
  %59 = load double, double* %arrayidx99.1, align 8
  %mul100.1 = fmul double %58, %59
  %sub101.1 = fsub double %sub101, %mul100.1
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv.next48.1
  %60 = load double, double* %arrayidx97.2, align 8
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next48.1
  %61 = load double, double* %arrayidx99.2, align 8
  %mul100.2 = fmul double %60, %61
  %sub101.2 = fsub double %sub101.1, %mul100.2
  %indvars.iv.next48.2 = add nsw i64 %indvars.iv47, 3
  %arrayidx97.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv.next48.2
  %62 = load double, double* %arrayidx97.3, align 8
  %arrayidx99.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next48.2
  %63 = load double, double* %arrayidx99.3, align 8
  %mul100.3 = fmul double %62, %63
  %sub101.3 = fsub double %sub101.2, %mul100.3
  %exitcond.3 = icmp eq i64 %indvars.iv.next48.2, 1999
  %indvars.iv.next48.3 = add nsw i64 %indvars.iv47, 4
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %sub101.lcssa9 = phi double [ %49, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv49
  %64 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %sub101.lcssa9, %64
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv49
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv49, 0
  br i1 %cmp87, label %for.inc112.for.body88_crit_edge, label %for.end113

for.inc112.for.body88_crit_edge:                  ; preds = %for.inc112
  %indvars.iv.next50 = add i64 %indvars.iv49, -1
  %indvars.iv.next102 = add i32 %indvars.iv101, -1
  %indvar.next = add i32 %indvar, 1
  %indvars.iv.next104 = add i2 %indvars.iv103, 1
  br label %for.body88

for.end113:                                       ; preds = %for.inc112
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %x) unnamed_addr #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, 2000
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !12, !13}
!22 = distinct !{!22, !2}
!23 = distinct !{!23, !2}
!24 = distinct !{!24, !2}
