; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %tsteps = alloca i32, align 4
  %A = alloca [120 x [120 x [120 x double]]]*, align 8
  %B = alloca [120 x [120 x [120 x double]]]*, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 120, i32* %n, align 4
  store i32 500, i32* %tsteps, align 4
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %0 = bitcast [120 x [120 x [120 x double]]]** %A to i8**
  store i8* %call, i8** %0, align 8
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %1 = bitcast [120 x [120 x [120 x double]]]** %B to i8**
  store i8* %call1, i8** %1, align 8
  %2 = load i32, i32* %n, align 4
  %.cast = bitcast i8* %call to [120 x [120 x double]]*
  %.cast7 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 %2, [120 x [120 x double]]* %.cast, [120 x [120 x double]]* %.cast7)
  tail call void (...) @polybench_timer_start() #4
  %3 = load i32, i32* %tsteps, align 4
  %4 = bitcast [120 x [120 x [120 x double]]]** %A to [120 x [120 x double]]**
  %5 = load [120 x [120 x double]]*, [120 x [120 x double]]** %4, align 8
  %6 = bitcast [120 x [120 x [120 x double]]]** %B to [120 x [120 x double]]**
  %7 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  tail call fastcc void @kernel_heat_3d(i32 %3, i32 %2, [120 x [120 x double]]* %5, [120 x [120 x double]]* %7)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %8 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %8, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %9 = load i8**, i8*** %argv.addr, align 8
  %10 = load i8*, i8** %9, align 8
  %strcmpload = load i8, i8* %10, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %11 = load i32, i32* %n, align 4
  %12 = bitcast [120 x [120 x [120 x double]]]** %A to [120 x [120 x double]]**
  %13 = load [120 x [120 x double]]*, [120 x [120 x double]]** %12, align 8
  tail call fastcc void @print_array(i32 %11, [120 x [120 x double]]* %13)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  %14 = bitcast [120 x [120 x [120 x double]]]** %A to i8**
  %15 = load i8*, i8** %14, align 8
  tail call void @free(i8* %15) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) unnamed_addr #2 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [120 x [120 x double]]*, align 8
  %B.addr = alloca [120 x [120 x double]]*, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store [120 x [120 x double]]* %A, [120 x [120 x double]]** %A.addr, align 8
  store [120 x [120 x double]]* %B, [120 x [120 x double]]** %B.addr, align 8
  store i32 0, i32* %i, align 4
  %cmp9 = icmp sgt i32 %n, 0
  br i1 %cmp9, label %for.cond1.preheader.lr.ph, label %for.end24

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = load i32, i32* %n.addr, align 4
  %1 = sext i32 %0 to i64
  %cmp25 = icmp sgt i32 %0, 0
  %conv8 = sitofp i32 %0 to double
  %2 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8
  %3 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  br i1 %cmp25, label %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge, label %for.cond1.preheader.for.cond.for.end24_crit_edge_crit_edge

for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.preheader.lr.ph
  %4 = sext i32 %i.promoted to i64
  %5 = add i32 %0, -1
  %wide.trip.count = zext i32 %5 to i64
  %6 = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %6, 0
  %7 = icmp eq i32 %5, 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc22.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv46 = phi i64 [ %4, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next47, %for.inc22.us ]
  br i1 true, label %for.cond4.preheader.us.us.preheader, label %for.inc22.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %8 = trunc i64 %indvars.iv46 to i32
  br label %for.cond4.preheader.us.us

for.inc22.us.loopexit:                            ; preds = %for.inc19.us.us
  br label %for.inc22.us

for.inc22.us:                                     ; preds = %for.inc22.us.loopexit, %for.cond1.preheader.us
  %inc.lcssa8.lcssa.us = phi i32 [ 0, %for.cond1.preheader.us ], [ %0, %for.inc22.us.loopexit ]
  %indvars.iv.next47 = add nsw i64 %indvars.iv46, 1
  %cmp.us = icmp slt i64 %indvars.iv.next47, %1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.inc22.us.for.cond.for.end24_crit_edge_crit_edge

for.inc22.us.for.cond.for.end24_crit_edge_crit_edge: ; preds = %for.inc22.us
  %9 = trunc i64 %indvars.iv.next47 to i32
  br label %for.cond.for.end24_crit_edge

for.cond4.preheader.us.us:                        ; preds = %for.inc19.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.inc19.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %10 = trunc i64 %indvars.iv44 to i32
  %sub.us.us = add i32 %10, %8
  %add.us.us = add i32 %sub.us.us, %0
  br i1 %lcmp.mod, label %for.inc.us.us.prol.preheader, label %for.inc.us.us.prol.loopexit.unr-lcssa

for.inc.us.us.prol.preheader:                     ; preds = %for.cond4.preheader.us.us
  br label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.inc.us.us.prol.preheader
  %conv.us.us.prol = sitofp i32 %add.us.us to double
  %mul.us.us.prol = fmul double %conv.us.us.prol, 1.000000e+01
  %div.us.us.prol = fdiv double %mul.us.us.prol, %conv8
  %arrayidx12.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv46, i64 %indvars.iv44, i64 0
  store double %div.us.us.prol, double* %arrayidx12.us.us.prol, align 8
  %arrayidx18.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv46, i64 %indvars.iv44, i64 0
  store double %div.us.us.prol, double* %arrayidx18.us.us.prol, align 8
  br label %for.inc.us.us.prol.loopexit.unr-lcssa

for.inc.us.us.prol.loopexit.unr-lcssa:            ; preds = %for.cond4.preheader.us.us, %for.inc.us.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol.loopexit.unr-lcssa
  br i1 %7, label %for.inc19.us.us, label %for.cond4.preheader.us.us.new

for.cond4.preheader.us.us.new:                    ; preds = %for.inc.us.us.prol.loopexit
  br label %for.inc.us.us

for.inc19.us.us.unr-lcssa:                        ; preds = %for.inc.us.us
  br label %for.inc19.us.us

for.inc19.us.us:                                  ; preds = %for.inc.us.us.prol.loopexit, %for.inc19.us.us.unr-lcssa
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next45, %1
  br i1 %exitcond48, label %for.inc22.us.loopexit, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.cond4.preheader.us.us.new ], [ %indvars.iv.next.1, %for.inc.us.us ]
  %11 = trunc i64 %indvars.iv to i32
  %add7.us.us = sub i32 %add.us.us, %11
  %conv.us.us = sitofp i32 %add7.us.us to double
  %mul.us.us = fmul double %conv.us.us, 1.000000e+01
  %div.us.us = fdiv double %mul.us.us, %conv8
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv46, i64 %indvars.iv44, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx12.us.us, align 8
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv46, i64 %indvars.iv44, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx18.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = trunc i64 %indvars.iv.next to i32
  %add7.us.us.1 = sub i32 %add.us.us, %12
  %conv.us.us.1 = sitofp i32 %add7.us.us.1 to double
  %mul.us.us.1 = fmul double %conv.us.us.1, 1.000000e+01
  %div.us.us.1 = fdiv double %mul.us.us.1, %conv8
  %arrayidx12.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv46, i64 %indvars.iv44, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx12.us.us.1, align 8
  %arrayidx18.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv46, i64 %indvars.iv44, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx18.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc19.us.us.unr-lcssa, label %for.inc.us.us

for.cond1.preheader.for.cond.for.end24_crit_edge_crit_edge: ; preds = %for.cond1.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  %13 = add i32 %i.promoted, 1
  %14 = icmp sgt i32 %0, %13
  %smax = select i1 %14, i32 %0, i32 %13
  br label %for.cond.for.end24_crit_edge

for.cond.for.end24_crit_edge:                     ; preds = %for.cond1.preheader.for.cond.for.end24_crit_edge_crit_edge, %for.inc22.us.for.cond.for.end24_crit_edge_crit_edge
  %inc.lcssa8.lcssa14.lcssa = phi i32 [ %inc.lcssa8.lcssa.us, %for.inc22.us.for.cond.for.end24_crit_edge_crit_edge ], [ %k.promoted, %for.cond1.preheader.for.cond.for.end24_crit_edge_crit_edge ]
  %inc23.lcssa = phi i32 [ %9, %for.inc22.us.for.cond.for.end24_crit_edge_crit_edge ], [ %smax, %for.cond1.preheader.for.cond.for.end24_crit_edge_crit_edge ]
  store i32 %inc23.lcssa, i32* %i, align 4
  store i32 %inc.lcssa8.lcssa14.lcssa, i32* %k, align 4
  br label %for.end24

for.end24:                                        ; preds = %entry, %for.cond.for.end24_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) unnamed_addr #2 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [120 x [120 x double]]*, align 8
  %B.addr = alloca [120 x [120 x double]]*, align 8
  %t = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store [120 x [120 x double]]* %A, [120 x [120 x double]]** %A.addr, align 8
  store [120 x [120 x double]]* %B, [120 x [120 x double]]** %B.addr, align 8
  store i32 1, i32* %t, align 4
  %sub15 = add nsw i32 %n, -1
  %sub10231 = add nsw i32 %n, -1
  %0 = sext i32 %n to i64
  %1 = sext i32 %n to i64
  %sub10626 = add nsw i32 %n, -1
  %sub102 = add nsw i64 %0, -1
  %sub11022 = add nsw i32 %n, -1
  %sub106 = add nsw i64 %1, -1
  %2 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8
  %3 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %4 = load i32, i32* %n.addr, align 4
  %5 = sext i32 %4 to i64
  %6 = sext i32 %4 to i64
  %sub110 = add nsw i64 %5, -1
  %sub510 = add nsw i32 %4, -1
  %sub = add nsw i64 %6, -1
  %sub97 = add nsw i32 %4, -1
  %7 = load i32, i32* %n.addr, align 4
  %8 = sext i32 %7 to i64
  %9 = sext i32 %7 to i64
  %sub5 = add nsw i64 %8, -1
  %10 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %11 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8
  %sub9 = add nsw i64 %9, -1
  %t.promoted = load i32, i32* %t, align 4
  %12 = icmp sgt i64 %sub110, 2
  %smax = select i1 %12, i64 %sub110, i64 2
  %13 = add nsw i64 %smax, -1
  %14 = icmp sgt i64 %sub110, 2
  %smax63 = select i1 %14, i64 %sub110, i64 2
  %15 = icmp sgt i64 %sub9, 2
  %smax82 = select i1 %15, i64 %sub9, i64 2
  %16 = add nsw i64 %smax82, -1
  %17 = icmp sgt i64 %sub9, 2
  %smax95 = select i1 %17, i64 %sub9, i64 2
  %18 = icmp sgt i32 %sub15, 1
  %19 = icmp sgt i32 %sub10231, 1
  %20 = icmp sgt i32 %sub10626, 1
  %21 = icmp sgt i32 %sub11022, 1
  %min.iters.check = icmp ult i64 %13, 2
  %n.vec = and i64 %13, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %13, 1
  %cmp.n = icmp eq i64 %13, %n.vec
  %22 = icmp sgt i32 %sub510, 1
  %23 = icmp sgt i32 %sub97, 1
  %min.iters.check83 = icmp ult i64 %16, 2
  %n.vec86 = and i64 %16, -2
  %cmp.zero87 = icmp eq i64 %n.vec86, 0
  %ind.end111 = or i64 %16, 1
  %cmp.n112 = icmp eq i64 %16, %n.vec86
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %inc21049 = phi i32 [ %t.promoted, %entry ], [ %inc210, %for.inc209 ]
  br i1 %18, label %for.cond4.preheader.preheader, label %for.cond101.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond101.preheader.loopexit:                   ; preds = %for.inc98
  br label %for.cond101.preheader

for.cond101.preheader:                            ; preds = %for.cond101.preheader.loopexit, %for.cond1.preheader
  br i1 %19, label %for.cond105.preheader.preheader, label %for.inc209

for.cond105.preheader.preheader:                  ; preds = %for.cond101.preheader
  br label %for.cond105.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc98
  %indvar89 = phi i64 [ %indvar.next90, %for.inc98 ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.inc98 ], [ 1, %for.cond4.preheader.preheader ]
  %24 = add nuw nsw i64 %indvar89, 1
  %25 = add nuw nsw i64 %indvar89, 2
  br i1 %22, label %for.cond8.preheader.lr.ph, label %for.inc98

for.cond8.preheader.lr.ph:                        ; preds = %for.cond4.preheader
  %add = add nuw nsw i64 %indvars.iv52, 1
  %sub23 = add nsw i64 %indvars.iv52, -1
  br i1 %23, label %for.cond8.preheader.us.preheader, label %for.inc98

for.cond8.preheader.us.preheader:                 ; preds = %for.cond8.preheader.lr.ph
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.preheader.us.preheader, %for.inc95.us
  %indvar91 = phi i64 [ %indvar.next92, %for.inc95.us ], [ 0, %for.cond8.preheader.us.preheader ]
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.inc95.us ], [ 1, %for.cond8.preheader.us.preheader ]
  %26 = add nuw nsw i64 %indvar91, 1
  %scevgep93 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %11, i64 %24, i64 %26, i64 1
  %scevgep96 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %11, i64 %24, i64 %26, i64 %smax95
  %scevgep98 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvar89, i64 %26, i64 1
  %scevgep100 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %25, i64 %26, i64 %smax95
  %add34.us = add nuw nsw i64 %indvars.iv50, 1
  %sub49.us = add nsw i64 %indvars.iv50, -1
  br i1 %min.iters.check83, label %for.inc.us.preheader, label %min.iters.checked84

min.iters.checked84:                              ; preds = %for.cond8.preheader.us
  br i1 %cmp.zero87, label %for.inc.us.preheader, label %vector.memcheck106

vector.memcheck106:                               ; preds = %min.iters.checked84
  %bound0102 = icmp ult double* %scevgep93, %scevgep100
  %bound1103 = icmp ult double* %scevgep98, %scevgep96
  %memcheck.conflict105 = and i1 %bound0102, %bound1103
  br i1 %memcheck.conflict105, label %for.inc.us.preheader, label %vector.body79.preheader

vector.body79.preheader:                          ; preds = %vector.memcheck106
  br label %vector.body79

vector.body79:                                    ; preds = %vector.body79.preheader, %vector.body79
  %index108 = phi i64 [ %index.next109, %vector.body79 ], [ 0, %vector.body79.preheader ]
  %offset.idx113 = or i64 %index108, 1
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %add, i64 %indvars.iv50, i64 %offset.idx113
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvars.iv52, i64 %indvars.iv50, i64 %offset.idx113
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load118 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fmul <2 x double> %wide.load118, <double 2.000000e+00, double 2.000000e+00>
  %32 = fsub <2 x double> %wide.load117, %31
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %sub23, i64 %indvars.iv50, i64 %offset.idx113
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load119 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %32, %wide.load119
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvars.iv52, i64 %add34.us, i64 %offset.idx113
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = bitcast double* %29 to <2 x double>*
  %wide.load121 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !1
  %40 = fmul <2 x double> %wide.load121, <double 2.000000e+00, double 2.000000e+00>
  %41 = fsub <2 x double> %wide.load120, %40
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvars.iv52, i64 %sub49.us, i64 %offset.idx113
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load122 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !1
  %44 = fadd <2 x double> %41, %wide.load122
  %45 = fmul <2 x double> %44, <double 1.250000e-01, double 1.250000e-01>
  %46 = fadd <2 x double> %36, %45
  %47 = add nuw nsw i64 %offset.idx113, 1
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvars.iv52, i64 %indvars.iv50, i64 %47
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load123 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !1
  %50 = bitcast double* %29 to <2 x double>*
  %wide.load124 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !1
  %51 = fmul <2 x double> %wide.load124, <double 2.000000e+00, double 2.000000e+00>
  %52 = fsub <2 x double> %wide.load123, %51
  %53 = add nsw i64 %offset.idx113, -1
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvars.iv52, i64 %indvars.iv50, i64 %53
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load125 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !1
  %56 = fadd <2 x double> %52, %wide.load125
  %57 = fmul <2 x double> %56, <double 1.250000e-01, double 1.250000e-01>
  %58 = fadd <2 x double> %46, %57
  %59 = bitcast double* %29 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !1
  %60 = fadd <2 x double> %58, %wide.load126
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %11, i64 %indvars.iv52, i64 %indvars.iv50, i64 %offset.idx113
  %62 = bitcast double* %61 to <2 x double>*
  store <2 x double> %60, <2 x double>* %62, align 8, !alias.scope !4, !noalias !1
  %index.next109 = add i64 %index108, 2
  %63 = icmp eq i64 %index.next109, %n.vec86
  br i1 %63, label %middle.block80, label %vector.body79, !llvm.loop !6

middle.block80:                                   ; preds = %vector.body79
  br i1 %cmp.n112, label %for.inc95.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %middle.block80, %vector.memcheck106, %min.iters.checked84, %for.cond8.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck106 ], [ 1, %min.iters.checked84 ], [ 1, %for.cond8.preheader.us ], [ %ind.end111, %middle.block80 ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %add, i64 %indvars.iv50, i64 %indvars.iv
  %64 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvars.iv52, i64 %indvars.iv50, i64 %indvars.iv
  %65 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %65, 2.000000e+00
  %sub22.us = fsub double %64, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %sub23, i64 %indvars.iv50, i64 %indvars.iv
  %66 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %sub22.us, %66
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvars.iv52, i64 %add34.us, i64 %indvars.iv
  %67 = load double, double* %arrayidx38.us, align 8
  %arrayidx44.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvars.iv52, i64 %indvars.iv50, i64 %indvars.iv
  %68 = load double, double* %arrayidx44.us, align 8
  %mul45.us = fmul double %68, 2.000000e+00
  %sub46.us = fsub double %67, %mul45.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvars.iv52, i64 %sub49.us, i64 %indvars.iv
  %69 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %sub46.us, %69
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %add61.us = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvars.iv52, i64 %indvars.iv50, i64 %add61.us
  %70 = load double, double* %arrayidx63.us, align 8
  %arrayidx69.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvars.iv52, i64 %indvars.iv50, i64 %indvars.iv
  %71 = load double, double* %arrayidx69.us, align 8
  %mul70.us = fmul double %71, 2.000000e+00
  %sub71.us = fsub double %70, %mul70.us
  %sub76.us = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvars.iv52, i64 %indvars.iv50, i64 %sub76.us
  %72 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %72
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %arrayidx87.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %10, i64 %indvars.iv52, i64 %indvars.iv50, i64 %indvars.iv
  %73 = load double, double* %arrayidx87.us, align 8
  %add88.us = fadd double %add81.us, %73
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %11, i64 %indvars.iv52, i64 %indvars.iv50, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp10.us = icmp slt i64 %indvars.iv.next, %sub9
  br i1 %cmp10.us, label %for.inc.us, label %for.inc95.us.loopexit, !llvm.loop !9

for.inc95.us.loopexit:                            ; preds = %for.inc.us
  br label %for.inc95.us

for.inc95.us:                                     ; preds = %for.inc95.us.loopexit, %middle.block80
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %cmp6.us = icmp slt i64 %indvars.iv.next51, %sub5
  %indvar.next92 = add nuw nsw i64 %indvar91, 1
  br i1 %cmp6.us, label %for.cond8.preheader.us, label %for.inc98.loopexit

for.inc98.loopexit:                               ; preds = %for.inc95.us
  br label %for.inc98

for.inc98:                                        ; preds = %for.inc98.loopexit, %for.cond8.preheader.lr.ph, %for.cond4.preheader
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %cmp2 = icmp slt i64 %indvars.iv.next53, %sub
  %indvar.next90 = add nuw nsw i64 %indvar89, 1
  br i1 %cmp2, label %for.cond4.preheader, label %for.cond101.preheader.loopexit

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond105.preheader.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  %74 = add nuw nsw i64 %indvar, 1
  %75 = add nuw nsw i64 %indvar, 2
  br i1 %20, label %for.cond109.preheader.lr.ph, label %for.inc206

for.cond109.preheader.lr.ph:                      ; preds = %for.cond105.preheader
  %add113 = add nuw nsw i64 %indvars.iv58, 1
  %sub128 = add nsw i64 %indvars.iv58, -1
  br i1 %21, label %for.cond109.preheader.us.preheader, label %for.inc206

for.cond109.preheader.us.preheader:               ; preds = %for.cond109.preheader.lr.ph
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.preheader.us.preheader, %for.inc203.us
  %indvar60 = phi i64 [ %indvar.next61, %for.inc203.us ], [ 0, %for.cond109.preheader.us.preheader ]
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.inc203.us ], [ 1, %for.cond109.preheader.us.preheader ]
  %76 = add nuw nsw i64 %indvar60, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %74, i64 %76, i64 1
  %scevgep64 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %74, i64 %76, i64 %smax63
  %scevgep66 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %76, i64 1
  %scevgep68 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %75, i64 %76, i64 %smax63
  %add139.us = add nuw nsw i64 %indvars.iv56, 1
  %sub154.us = add nsw i64 %indvars.iv56, -1
  br i1 %min.iters.check, label %for.inc200.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond109.preheader.us
  br i1 %cmp.zero, label %for.inc200.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep68
  %bound1 = icmp ult double* %scevgep66, %scevgep64
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc200.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %add113, i64 %indvars.iv56, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv58, i64 %indvars.iv56, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = fmul <2 x double> %wide.load70, <double 2.000000e+00, double 2.000000e+00>
  %82 = fsub <2 x double> %wide.load, %81
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %sub128, i64 %indvars.iv56, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = fadd <2 x double> %82, %wide.load71
  %86 = fmul <2 x double> %85, <double 1.250000e-01, double 1.250000e-01>
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv58, i64 %add139.us, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = bitcast double* %79 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = fmul <2 x double> %wide.load73, <double 2.000000e+00, double 2.000000e+00>
  %91 = fsub <2 x double> %wide.load72, %90
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv58, i64 %sub154.us, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = fadd <2 x double> %91, %wide.load74
  %95 = fmul <2 x double> %94, <double 1.250000e-01, double 1.250000e-01>
  %96 = fadd <2 x double> %86, %95
  %97 = add nuw nsw i64 %offset.idx, 1
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv58, i64 %indvars.iv56, i64 %97
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !10
  %100 = bitcast double* %79 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !10
  %101 = fmul <2 x double> %wide.load76, <double 2.000000e+00, double 2.000000e+00>
  %102 = fsub <2 x double> %wide.load75, %101
  %103 = add nsw i64 %offset.idx, -1
  %104 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv58, i64 %indvars.iv56, i64 %103
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !10
  %106 = fadd <2 x double> %102, %wide.load77
  %107 = fmul <2 x double> %106, <double 1.250000e-01, double 1.250000e-01>
  %108 = fadd <2 x double> %96, %107
  %109 = bitcast double* %79 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !10
  %110 = fadd <2 x double> %108, %wide.load78
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv58, i64 %indvars.iv56, i64 %offset.idx
  %112 = bitcast double* %111 to <2 x double>*
  store <2 x double> %110, <2 x double>* %112, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %113 = icmp eq i64 %index.next, %n.vec
  br i1 %113, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc203.us, label %for.inc200.us.preheader

for.inc200.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond109.preheader.us
  %indvars.iv54.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond109.preheader.us ], [ %ind.end, %middle.block ]
  br label %for.inc200.us

for.inc200.us:                                    ; preds = %for.inc200.us.preheader, %for.inc200.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.inc200.us ], [ %indvars.iv54.ph, %for.inc200.us.preheader ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %add113, i64 %indvars.iv56, i64 %indvars.iv54
  %114 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv58, i64 %indvars.iv56, i64 %indvars.iv54
  %115 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %115, 2.000000e+00
  %sub127.us = fsub double %114, %mul126.us
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %sub128, i64 %indvars.iv56, i64 %indvars.iv54
  %116 = load double, double* %arrayidx134.us, align 8
  %add135.us = fadd double %sub127.us, %116
  %mul136.us = fmul double %add135.us, 1.250000e-01
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv58, i64 %add139.us, i64 %indvars.iv54
  %117 = load double, double* %arrayidx143.us, align 8
  %arrayidx149.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv58, i64 %indvars.iv56, i64 %indvars.iv54
  %118 = load double, double* %arrayidx149.us, align 8
  %mul150.us = fmul double %118, 2.000000e+00
  %sub151.us = fsub double %117, %mul150.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv58, i64 %sub154.us, i64 %indvars.iv54
  %119 = load double, double* %arrayidx158.us, align 8
  %add159.us = fadd double %sub151.us, %119
  %mul160.us = fmul double %add159.us, 1.250000e-01
  %add161.us = fadd double %mul136.us, %mul160.us
  %add166.us = add nuw nsw i64 %indvars.iv54, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv58, i64 %indvars.iv56, i64 %add166.us
  %120 = load double, double* %arrayidx168.us, align 8
  %arrayidx174.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv58, i64 %indvars.iv56, i64 %indvars.iv54
  %121 = load double, double* %arrayidx174.us, align 8
  %mul175.us = fmul double %121, 2.000000e+00
  %sub176.us = fsub double %120, %mul175.us
  %sub181.us = add nsw i64 %indvars.iv54, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv58, i64 %indvars.iv56, i64 %sub181.us
  %122 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %122
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %arrayidx192.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv58, i64 %indvars.iv56, i64 %indvars.iv54
  %123 = load double, double* %arrayidx192.us, align 8
  %add193.us = fadd double %add186.us, %123
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv58, i64 %indvars.iv56, i64 %indvars.iv54
  store double %add193.us, double* %arrayidx199.us, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %cmp111.us = icmp slt i64 %indvars.iv.next55, %sub110
  br i1 %cmp111.us, label %for.inc200.us, label %for.inc203.us.loopexit, !llvm.loop !16

for.inc203.us.loopexit:                           ; preds = %for.inc200.us
  br label %for.inc203.us

for.inc203.us:                                    ; preds = %for.inc203.us.loopexit, %middle.block
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %cmp107.us = icmp slt i64 %indvars.iv.next57, %sub106
  %indvar.next61 = add nuw nsw i64 %indvar60, 1
  br i1 %cmp107.us, label %for.cond109.preheader.us, label %for.inc206.loopexit

for.inc206.loopexit:                              ; preds = %for.inc203.us
  br label %for.inc206

for.inc206:                                       ; preds = %for.inc206.loopexit, %for.cond109.preheader.lr.ph, %for.cond105.preheader
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %cmp103 = icmp slt i64 %indvars.iv.next59, %sub102
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %cmp103, label %for.cond105.preheader, label %for.inc209.loopexit

for.inc209.loopexit:                              ; preds = %for.inc206
  br label %for.inc209

for.inc209:                                       ; preds = %for.inc209.loopexit, %for.cond101.preheader
  %inc210 = add nsw i32 %inc21049, 1
  %cmp = icmp slt i32 %inc210, 501
  br i1 %cmp, label %for.cond1.preheader, label %for.end211

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [120 x [120 x double]]* %A) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [120 x [120 x double]]*, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store [120 x [120 x double]]* %A, [120 x [120 x double]]** %A.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp10 = icmp sgt i32 %3, 0
  br i1 %cmp10, label %for.cond2.preheader.lr.ph, label %for.end23

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %4 = load i32, i32* %n.addr, align 4
  %5 = sext i32 %4 to i64
  %6 = sext i32 %4 to i64
  %7 = sext i32 %4 to i64
  %cmp36 = icmp sgt i32 %4, 0
  %8 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  br i1 %cmp36, label %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge, label %for.cond2.preheader.for.cond.for.end23_crit_edge_crit_edge

for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge: ; preds = %for.cond2.preheader.lr.ph
  %9 = sext i32 %i.promoted to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc21.us, %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge
  %indvars.iv48 = phi i64 [ %9, %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge ], [ %indvars.iv.next49, %for.inc21.us ]
  br i1 true, label %for.cond5.preheader.us.us.preheader, label %for.inc21.us

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.preheader.us
  %10 = mul nsw i64 %6, %indvars.iv48
  %11 = trunc i64 %10 to i32
  br label %for.cond5.preheader.us.us

for.inc21.us.loopexit:                            ; preds = %for.inc18.us.us
  br label %for.inc21.us

for.inc21.us:                                     ; preds = %for.inc21.us.loopexit, %for.cond2.preheader.us
  %inc.lcssa9.lcssa.us = phi i32 [ 0, %for.cond2.preheader.us ], [ %4, %for.inc21.us.loopexit ]
  %indvars.iv.next49 = add nsw i64 %indvars.iv48, 1
  %cmp.us = icmp slt i64 %indvars.iv.next49, %5
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.inc21.us.for.cond.for.end23_crit_edge_crit_edge

for.inc21.us.for.cond.for.end23_crit_edge_crit_edge: ; preds = %for.inc21.us
  %12 = trunc i64 %indvars.iv.next49 to i32
  br label %for.cond.for.end23_crit_edge

for.cond5.preheader.us.us:                        ; preds = %for.inc18.us.us, %for.cond5.preheader.us.us.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.inc18.us.us ], [ 0, %for.cond5.preheader.us.us.preheader ]
  %13 = trunc i64 %indvars.iv46 to i32
  %mul83.us.us = add i32 %11, %13
  %add.us.us = mul i32 %mul83.us.us, %4
  %14 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.inc18.us.us:                                  ; preds = %for.inc.us.us
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next47, %7
  br i1 %exitcond51, label %for.inc21.us.loopexit, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %for.inc.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us.us ], [ %indvars.iv.next, %for.inc.us.us ]
  %15 = add nuw nsw i64 %14, %indvars.iv
  %16 = trunc i64 %15 to i32
  %rem.us.us = srem i32 %16, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %for.inc.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %for.body7.us.us, %if.then.us.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %8, i64 %indvars.iv48, i64 %indvars.iv46, i64 %indvars.iv
  %19 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond, label %for.inc18.us.us, label %for.body7.us.us

for.cond2.preheader.for.cond.for.end23_crit_edge_crit_edge: ; preds = %for.cond2.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  %20 = add i32 %i.promoted, 1
  %21 = icmp sgt i32 %4, %20
  %smax = select i1 %21, i32 %4, i32 %20
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge:                     ; preds = %for.cond2.preheader.for.cond.for.end23_crit_edge_crit_edge, %for.inc21.us.for.cond.for.end23_crit_edge_crit_edge
  %inc.lcssa9.lcssa15.lcssa = phi i32 [ %inc.lcssa9.lcssa.us, %for.inc21.us.for.cond.for.end23_crit_edge_crit_edge ], [ %k.promoted, %for.cond2.preheader.for.cond.for.end23_crit_edge_crit_edge ]
  %inc22.lcssa = phi i32 [ %12, %for.inc21.us.for.cond.for.end23_crit_edge_crit_edge ], [ %smax, %for.cond2.preheader.for.cond.for.end23_crit_edge_crit_edge ]
  store i32 %inc22.lcssa, i32* %i, align 4
  store i32 %inc.lcssa9.lcssa15.lcssa, i32* %k, align 4
  br label %for.end23

for.end23:                                        ; preds = %entry, %for.cond.for.end23_crit_edge
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
