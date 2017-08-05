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
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 %2, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %3 = load i32, i32* %tsteps, align 4
  %4 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %A, align 8
  %arraydecay3 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %4, i64 0, i64 0
  %5 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %B, align 8
  %arraydecay4 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %5, i64 0, i64 0
  tail call fastcc void @kernel_heat_3d(i32 %3, i32 %2, [120 x [120 x double]]* %arraydecay3, [120 x [120 x double]]* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %6 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %6, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %7 = load i8**, i8*** %argv.addr, align 8
  %8 = load i8*, i8** %7, align 8
  %strcmpload = load i8, i8* %8, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %9 = load i32, i32* %n, align 4
  %10 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %A, align 8
  %arraydecay6 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %10, i64 0, i64 0
  tail call fastcc void @print_array(i32 %9, [120 x [120 x double]]* %arraydecay6)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  %11 = bitcast [120 x [120 x [120 x double]]]** %A to i8**
  %12 = load i8*, i8** %11, align 8
  tail call void @free(i8* %12) #4
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
  %cmp25 = icmp sgt i32 %0, 0
  %cmp53 = icmp sgt i32 %0, 0
  %conv8 = sitofp i32 %0 to double
  %1 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8
  %2 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  br i1 %cmp25, label %for.cond1.preheader.us.preheader, label %for.cond.for.end24_crit_edge.loopexit44

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %3 = sext i32 %i.promoted to i64
  %4 = sext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %5 = icmp eq i32 %0, 1
  %wide.trip.count48 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc22.us
  %indvars.iv49 = phi i64 [ %3, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next50, %for.inc22.us ]
  br i1 %cmp53, label %for.cond4.preheader.us.us.preheader, label %for.inc22.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %6 = trunc i64 %indvars.iv49 to i32
  br label %for.cond4.preheader.us.us

for.inc22.us.loopexit:                            ; preds = %for.inc19.us.us
  br label %for.inc22.us

for.inc22.us:                                     ; preds = %for.inc22.us.loopexit, %for.cond1.preheader.us
  %inc.lcssa8.lcssa.us = phi i32 [ 0, %for.cond1.preheader.us ], [ %0, %for.inc22.us.loopexit ]
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, 1
  %cmp.us = icmp slt i64 %indvars.iv.next50, %4
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond.for.end24_crit_edge.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.inc19.us.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.inc19.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %7 = trunc i64 %indvars.iv46 to i32
  %sub.us.us = add i32 %7, %6
  %add.us.us = add i32 %sub.us.us, %0
  br i1 %lcmp.mod, label %for.body6.us.us.prol.loopexit, label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %conv.us.us.prol = sitofp i32 %add.us.us to double
  %mul.us.us.prol = fmul double %conv.us.us.prol, 1.000000e+01
  %div.us.us.prol = fdiv double %mul.us.us.prol, %conv8
  %arrayidx12.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv49, i64 %indvars.iv46, i64 0
  store double %div.us.us.prol, double* %arrayidx12.us.us.prol, align 8
  %arrayidx18.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv49, i64 %indvars.iv46, i64 0
  store double %div.us.us.prol, double* %arrayidx18.us.us.prol, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br i1 %5, label %for.inc19.us.us, label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.inc19.us.us.loopexit:                         ; preds = %for.body6.us.us
  br label %for.inc19.us.us

for.inc19.us.us:                                  ; preds = %for.inc19.us.us.loopexit, %for.body6.us.us.prol.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond, label %for.inc22.us.loopexit, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.body6.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.us.us ], [ %indvars.iv.unr.ph, %for.body6.us.us.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %add7.us.us = sub i32 %add.us.us, %8
  %conv.us.us = sitofp i32 %add7.us.us to double
  %mul.us.us = fmul double %conv.us.us, 1.000000e+01
  %div.us.us = fdiv double %mul.us.us, %conv8
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv49, i64 %indvars.iv46, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx12.us.us, align 8
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv49, i64 %indvars.iv46, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx18.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = trunc i64 %indvars.iv.next to i32
  %add7.us.us.1 = sub i32 %add.us.us, %9
  %conv.us.us.1 = sitofp i32 %add7.us.us.1 to double
  %mul.us.us.1 = fmul double %conv.us.us.1, 1.000000e+01
  %div.us.us.1 = fdiv double %mul.us.us.1, %conv8
  %arrayidx12.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv49, i64 %indvars.iv46, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx12.us.us.1, align 8
  %arrayidx18.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv49, i64 %indvars.iv46, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx18.us.us.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.inc19.us.us.loopexit, label %for.body6.us.us

for.cond.for.end24_crit_edge.loopexit:            ; preds = %for.inc22.us
  %10 = trunc i64 %indvars.iv.next50 to i32
  br label %for.cond.for.end24_crit_edge

for.cond.for.end24_crit_edge.loopexit44:          ; preds = %for.cond1.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  %11 = add i32 %i.promoted, 1
  %12 = icmp sgt i32 %0, %11
  %smax = select i1 %12, i32 %0, i32 %11
  br label %for.cond.for.end24_crit_edge

for.cond.for.end24_crit_edge:                     ; preds = %for.cond.for.end24_crit_edge.loopexit44, %for.cond.for.end24_crit_edge.loopexit
  %inc.lcssa8.lcssa14.lcssa = phi i32 [ %inc.lcssa8.lcssa.us, %for.cond.for.end24_crit_edge.loopexit ], [ %k.promoted, %for.cond.for.end24_crit_edge.loopexit44 ]
  %inc23.lcssa = phi i32 [ %10, %for.cond.for.end24_crit_edge.loopexit ], [ %smax, %for.cond.for.end24_crit_edge.loopexit44 ]
  store i32 %inc23.lcssa, i32* %i, align 4
  store i32 %inc.lcssa8.lcssa14.lcssa, i32* %k, align 4
  br label %for.end24

for.end24:                                        ; preds = %for.cond.for.end24_crit_edge, %entry
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
  %cmp216 = icmp sgt i32 %sub15, 1
  %sub10231 = add nsw i32 %n, -1
  %cmp10332 = icmp sgt i32 %sub10231, 1
  %0 = load i32, i32* %n.addr, align 4
  %sub10626 = add nsw i32 %0, -1
  %cmp10727 = icmp sgt i32 %sub10626, 1
  %sub102 = add nsw i32 %0, -1
  %sub11022 = add nsw i32 %0, -1
  %cmp11123 = icmp sgt i32 %sub11022, 1
  %sub106 = add nsw i32 %0, -1
  %1 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8
  %2 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %3 = load i32, i32* %n.addr, align 4
  %sub110 = add nsw i32 %3, -1
  %sub510 = add nsw i32 %3, -1
  %cmp611 = icmp sgt i32 %sub510, 1
  %sub = add nsw i32 %3, -1
  %sub97 = add nsw i32 %3, -1
  %cmp108 = icmp sgt i32 %sub97, 1
  %4 = load i32, i32* %n.addr, align 4
  %sub5 = add nsw i32 %4, -1
  %5 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %6 = load [120 x [120 x double]]*, [120 x [120 x double]]** %B.addr, align 8
  %sub9 = add nsw i32 %4, -1
  %t.promoted = load i32, i32* %t, align 4
  %7 = sext i32 %sub9 to i64
  %8 = sext i32 %sub5 to i64
  %9 = sext i32 %sub to i64
  %10 = sext i32 %sub110 to i64
  %11 = sext i32 %sub102 to i64
  %wide.trip.count = zext i32 %sub106 to i64
  %12 = icmp sgt i64 %10, 2
  %smax = select i1 %12, i64 %10, i64 2
  %13 = add nsw i64 %smax, -1
  %14 = icmp sgt i64 %10, 2
  %smax73 = select i1 %14, i64 %10, i64 2
  %15 = icmp sgt i64 %7, 2
  %smax92 = select i1 %15, i64 %7, i64 2
  %16 = add nsw i64 %smax92, -1
  %17 = icmp sgt i64 %7, 2
  %smax105 = select i1 %17, i64 %7, i64 2
  %min.iters.check = icmp ult i64 %13, 2
  %n.vec = and i64 %13, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %13, 1
  %cmp.n = icmp eq i64 %13, %n.vec
  %min.iters.check93 = icmp ult i64 %16, 2
  %n.vec96 = and i64 %16, -2
  %cmp.zero97 = icmp eq i64 %n.vec96, 0
  %ind.end121 = or i64 %16, 1
  %cmp.n122 = icmp eq i64 %16, %n.vec96
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc209
  %inc21049 = phi i32 [ %t.promoted, %entry ], [ %inc210, %for.inc209 ]
  br i1 %cmp216, label %for.cond4.preheader.preheader, label %for.cond101.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond101.preheader.loopexit:                   ; preds = %for.inc98
  br label %for.cond101.preheader

for.cond101.preheader:                            ; preds = %for.cond101.preheader.loopexit, %for.cond1.preheader
  br i1 %cmp10332, label %for.cond105.preheader.preheader, label %for.inc209

for.cond105.preheader.preheader:                  ; preds = %for.cond101.preheader
  br label %for.cond105.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc98
  %indvar99 = phi i64 [ %indvar.next100, %for.inc98 ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.inc98 ], [ 1, %for.cond4.preheader.preheader ]
  %18 = add nuw nsw i64 %indvar99, 1
  %19 = add nuw nsw i64 %indvar99, 2
  br i1 %cmp611, label %for.cond8.preheader.lr.ph, label %for.inc98

for.cond8.preheader.lr.ph:                        ; preds = %for.cond4.preheader
  %20 = add nuw nsw i64 %indvars.iv56, 1
  %21 = add nsw i64 %indvars.iv56, -1
  br i1 %cmp108, label %for.cond8.preheader.us.preheader, label %for.inc98

for.cond8.preheader.us.preheader:                 ; preds = %for.cond8.preheader.lr.ph
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.preheader.us.preheader, %for.inc95.us
  %indvar101 = phi i64 [ %indvar.next102, %for.inc95.us ], [ 0, %for.cond8.preheader.us.preheader ]
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.inc95.us ], [ 1, %for.cond8.preheader.us.preheader ]
  %22 = add nuw nsw i64 %indvar101, 1
  %scevgep103 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %6, i64 %18, i64 %22, i64 1
  %scevgep106 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %6, i64 %18, i64 %22, i64 %smax105
  %scevgep108 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvar99, i64 %22, i64 1
  %scevgep110 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %19, i64 %22, i64 %smax105
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %23 = add nsw i64 %indvars.iv53, -1
  br i1 %min.iters.check93, label %for.body11.us.preheader, label %min.iters.checked94

min.iters.checked94:                              ; preds = %for.cond8.preheader.us
  br i1 %cmp.zero97, label %for.body11.us.preheader, label %vector.memcheck116

vector.memcheck116:                               ; preds = %min.iters.checked94
  %bound0112 = icmp ult double* %scevgep103, %scevgep110
  %bound1113 = icmp ult double* %scevgep108, %scevgep106
  %memcheck.conflict115 = and i1 %bound0112, %bound1113
  br i1 %memcheck.conflict115, label %for.body11.us.preheader, label %vector.body89.preheader

vector.body89.preheader:                          ; preds = %vector.memcheck116
  br label %vector.body89

vector.body89:                                    ; preds = %vector.body89.preheader, %vector.body89
  %index118 = phi i64 [ %index.next119, %vector.body89 ], [ 0, %vector.body89.preheader ]
  %offset.idx123 = or i64 %index118, 1
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %20, i64 %indvars.iv53, i64 %offset.idx123
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv56, i64 %indvars.iv53, i64 %offset.idx123
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fmul <2 x double> %wide.load128, <double 2.000000e+00, double 2.000000e+00>
  %29 = fsub <2 x double> %wide.load127, %28
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %21, i64 %indvars.iv53, i64 %offset.idx123
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fadd <2 x double> %29, %wide.load129
  %33 = fmul <2 x double> %32, <double 1.250000e-01, double 1.250000e-01>
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv56, i64 %indvars.iv.next54, i64 %offset.idx123
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = bitcast double* %26 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !1
  %37 = fmul <2 x double> %wide.load131, <double 2.000000e+00, double 2.000000e+00>
  %38 = fsub <2 x double> %wide.load130, %37
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv56, i64 %23, i64 %offset.idx123
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fadd <2 x double> %38, %wide.load132
  %42 = fmul <2 x double> %41, <double 1.250000e-01, double 1.250000e-01>
  %43 = fadd <2 x double> %33, %42
  %44 = add nuw nsw i64 %offset.idx123, 1
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv56, i64 %indvars.iv53, i64 %44
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !1
  %47 = bitcast double* %26 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !1
  %48 = fmul <2 x double> %wide.load134, <double 2.000000e+00, double 2.000000e+00>
  %49 = fsub <2 x double> %wide.load133, %48
  %50 = add nsw i64 %offset.idx123, -1
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv56, i64 %indvars.iv53, i64 %50
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !1
  %53 = fadd <2 x double> %49, %wide.load135
  %54 = fmul <2 x double> %53, <double 1.250000e-01, double 1.250000e-01>
  %55 = fadd <2 x double> %43, %54
  %56 = bitcast double* %26 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !1
  %57 = fadd <2 x double> %55, %wide.load136
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %6, i64 %indvars.iv56, i64 %indvars.iv53, i64 %offset.idx123
  %59 = bitcast double* %58 to <2 x double>*
  store <2 x double> %57, <2 x double>* %59, align 8, !alias.scope !4, !noalias !1
  %index.next119 = add i64 %index118, 2
  %60 = icmp eq i64 %index.next119, %n.vec96
  br i1 %60, label %middle.block90, label %vector.body89, !llvm.loop !6

middle.block90:                                   ; preds = %vector.body89
  br i1 %cmp.n122, label %for.inc95.us, label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %middle.block90, %vector.memcheck116, %min.iters.checked94, %for.cond8.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck116 ], [ 1, %min.iters.checked94 ], [ 1, %for.cond8.preheader.us ], [ %ind.end121, %middle.block90 ]
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us.preheader, %for.body11.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body11.us ], [ %indvars.iv.ph, %for.body11.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %20, i64 %indvars.iv53, i64 %indvars.iv
  %61 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv56, i64 %indvars.iv53, i64 %indvars.iv
  %62 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %62, 2.000000e+00
  %sub22.us = fsub double %61, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %21, i64 %indvars.iv53, i64 %indvars.iv
  %63 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %sub22.us, %63
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv56, i64 %indvars.iv.next54, i64 %indvars.iv
  %64 = load double, double* %arrayidx38.us, align 8
  %arrayidx44.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv56, i64 %indvars.iv53, i64 %indvars.iv
  %65 = load double, double* %arrayidx44.us, align 8
  %mul45.us = fmul double %65, 2.000000e+00
  %sub46.us = fsub double %64, %mul45.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv56, i64 %23, i64 %indvars.iv
  %66 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %sub46.us, %66
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv56, i64 %indvars.iv53, i64 %indvars.iv.next
  %67 = load double, double* %arrayidx63.us, align 8
  %arrayidx69.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv56, i64 %indvars.iv53, i64 %indvars.iv
  %68 = load double, double* %arrayidx69.us, align 8
  %mul70.us = fmul double %68, 2.000000e+00
  %sub71.us = fsub double %67, %mul70.us
  %69 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv56, i64 %indvars.iv53, i64 %69
  %70 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %70
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %arrayidx87.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv56, i64 %indvars.iv53, i64 %indvars.iv
  %71 = load double, double* %arrayidx87.us, align 8
  %add88.us = fadd double %add81.us, %71
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %6, i64 %indvars.iv56, i64 %indvars.iv53, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %cmp10.us = icmp slt i64 %indvars.iv.next, %7
  br i1 %cmp10.us, label %for.body11.us, label %for.inc95.us.loopexit, !llvm.loop !9

for.inc95.us.loopexit:                            ; preds = %for.body11.us
  br label %for.inc95.us

for.inc95.us:                                     ; preds = %for.inc95.us.loopexit, %middle.block90
  %cmp6.us = icmp slt i64 %indvars.iv.next54, %8
  %indvar.next102 = add nuw nsw i64 %indvar101, 1
  br i1 %cmp6.us, label %for.cond8.preheader.us, label %for.inc98.loopexit

for.inc98.loopexit:                               ; preds = %for.inc95.us
  br label %for.inc98

for.inc98:                                        ; preds = %for.inc98.loopexit, %for.cond8.preheader.lr.ph, %for.cond4.preheader
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %cmp2 = icmp slt i64 %indvars.iv.next57, %9
  %indvar.next100 = add nuw nsw i64 %indvar99, 1
  br i1 %cmp2, label %for.cond4.preheader, label %for.cond101.preheader.loopexit

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond105.preheader.preheader ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  %72 = add nuw nsw i64 %indvar, 1
  %73 = add nuw nsw i64 %indvar, 2
  br i1 %cmp10727, label %for.cond109.preheader.lr.ph, label %for.inc206

for.cond109.preheader.lr.ph:                      ; preds = %for.cond105.preheader
  %74 = add nuw nsw i64 %indvars.iv66, 1
  %75 = add nsw i64 %indvars.iv66, -1
  br i1 %cmp11123, label %for.cond109.preheader.us.preheader, label %for.inc206

for.cond109.preheader.us.preheader:               ; preds = %for.cond109.preheader.lr.ph
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.preheader.us.preheader, %for.inc203.us
  %indvar70 = phi i64 [ %indvar.next71, %for.inc203.us ], [ 0, %for.cond109.preheader.us.preheader ]
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc203.us ], [ 1, %for.cond109.preheader.us.preheader ]
  %76 = add nuw nsw i64 %indvar70, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %72, i64 %76, i64 1
  %scevgep74 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %72, i64 %76, i64 %smax73
  %scevgep76 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %76, i64 1
  %scevgep78 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %73, i64 %76, i64 %smax73
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %77 = add nsw i64 %indvars.iv63, -1
  br i1 %min.iters.check, label %for.body112.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond109.preheader.us
  br i1 %cmp.zero, label %for.body112.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep78
  %bound1 = icmp ult double* %scevgep76, %scevgep74
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body112.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %74, i64 %indvars.iv63, i64 %offset.idx
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %offset.idx
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !10
  %82 = fmul <2 x double> %wide.load80, <double 2.000000e+00, double 2.000000e+00>
  %83 = fsub <2 x double> %wide.load, %82
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %75, i64 %indvars.iv63, i64 %offset.idx
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = fadd <2 x double> %83, %wide.load81
  %87 = fmul <2 x double> %86, <double 1.250000e-01, double 1.250000e-01>
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv.next64, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = bitcast double* %80 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fmul <2 x double> %wide.load83, <double 2.000000e+00, double 2.000000e+00>
  %92 = fsub <2 x double> %wide.load82, %91
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %77, i64 %offset.idx
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fadd <2 x double> %92, %wide.load84
  %96 = fmul <2 x double> %95, <double 1.250000e-01, double 1.250000e-01>
  %97 = fadd <2 x double> %87, %96
  %98 = add nuw nsw i64 %offset.idx, 1
  %99 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %98
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !10
  %101 = bitcast double* %80 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = fmul <2 x double> %wide.load86, <double 2.000000e+00, double 2.000000e+00>
  %103 = fsub <2 x double> %wide.load85, %102
  %104 = add nsw i64 %offset.idx, -1
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %104
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !10
  %107 = fadd <2 x double> %103, %wide.load87
  %108 = fmul <2 x double> %107, <double 1.250000e-01, double 1.250000e-01>
  %109 = fadd <2 x double> %97, %108
  %110 = bitcast double* %80 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %110, align 8, !alias.scope !10
  %111 = fadd <2 x double> %109, %wide.load88
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv66, i64 %indvars.iv63, i64 %offset.idx
  %113 = bitcast double* %112 to <2 x double>*
  store <2 x double> %111, <2 x double>* %113, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %114 = icmp eq i64 %index.next, %n.vec
  br i1 %114, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc203.us, label %for.body112.us.preheader

for.body112.us.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond109.preheader.us
  %indvars.iv60.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond109.preheader.us ], [ %ind.end, %middle.block ]
  br label %for.body112.us

for.body112.us:                                   ; preds = %for.body112.us.preheader, %for.body112.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.body112.us ], [ %indvars.iv60.ph, %for.body112.us.preheader ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %74, i64 %indvars.iv63, i64 %indvars.iv60
  %115 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  %116 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %116, 2.000000e+00
  %sub127.us = fsub double %115, %mul126.us
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %75, i64 %indvars.iv63, i64 %indvars.iv60
  %117 = load double, double* %arrayidx134.us, align 8
  %add135.us = fadd double %sub127.us, %117
  %mul136.us = fmul double %add135.us, 1.250000e-01
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv.next64, i64 %indvars.iv60
  %118 = load double, double* %arrayidx143.us, align 8
  %arrayidx149.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  %119 = load double, double* %arrayidx149.us, align 8
  %mul150.us = fmul double %119, 2.000000e+00
  %sub151.us = fsub double %118, %mul150.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %77, i64 %indvars.iv60
  %120 = load double, double* %arrayidx158.us, align 8
  %add159.us = fadd double %sub151.us, %120
  %mul160.us = fmul double %add159.us, 1.250000e-01
  %add161.us = fadd double %mul136.us, %mul160.us
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv.next61
  %121 = load double, double* %arrayidx168.us, align 8
  %arrayidx174.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  %122 = load double, double* %arrayidx174.us, align 8
  %mul175.us = fmul double %122, 2.000000e+00
  %sub176.us = fsub double %121, %mul175.us
  %123 = add nsw i64 %indvars.iv60, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %123
  %124 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %124
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %arrayidx192.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  %125 = load double, double* %arrayidx192.us, align 8
  %add193.us = fadd double %add186.us, %125
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv60
  store double %add193.us, double* %arrayidx199.us, align 8
  %cmp111.us = icmp slt i64 %indvars.iv.next61, %10
  br i1 %cmp111.us, label %for.body112.us, label %for.inc203.us.loopexit, !llvm.loop !16

for.inc203.us.loopexit:                           ; preds = %for.body112.us
  br label %for.inc203.us

for.inc203.us:                                    ; preds = %for.inc203.us.loopexit, %middle.block
  %exitcond = icmp eq i64 %indvars.iv.next64, %wide.trip.count
  %indvar.next71 = add nuw nsw i64 %indvar70, 1
  br i1 %exitcond, label %for.inc206.loopexit, label %for.cond109.preheader.us

for.inc206.loopexit:                              ; preds = %for.inc203.us
  br label %for.inc206

for.inc206:                                       ; preds = %for.inc206.loopexit, %for.cond109.preheader.lr.ph, %for.cond105.preheader
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %cmp103 = icmp slt i64 %indvars.iv.next67, %11
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
  %cmp36 = icmp sgt i32 %4, 0
  %cmp64 = icmp sgt i32 %4, 0
  %5 = load [120 x [120 x double]]*, [120 x [120 x double]]** %A.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  br i1 %cmp36, label %for.cond2.preheader.us.preheader, label %for.cond.for.end23_crit_edge.loopexit45

for.cond2.preheader.us.preheader:                 ; preds = %for.cond2.preheader.lr.ph
  %6 = sext i32 %i.promoted to i64
  %7 = sext i32 %4 to i64
  %8 = sext i32 %4 to i64
  %wide.trip.count = zext i32 %4 to i64
  %wide.trip.count50 = zext i32 %4 to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.inc21.us
  %indvars.iv52 = phi i64 [ %6, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next53, %for.inc21.us ]
  br i1 %cmp64, label %for.cond5.preheader.us.us.preheader, label %for.inc21.us

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.preheader.us
  %9 = mul nsw i64 %7, %indvars.iv52
  %10 = trunc i64 %9 to i32
  br label %for.cond5.preheader.us.us

for.inc21.us.loopexit:                            ; preds = %for.inc18.us.us
  br label %for.inc21.us

for.inc21.us:                                     ; preds = %for.inc21.us.loopexit, %for.cond2.preheader.us
  %inc.lcssa9.lcssa.us = phi i32 [ 0, %for.cond2.preheader.us ], [ %4, %for.inc21.us.loopexit ]
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, 1
  %cmp.us = icmp slt i64 %indvars.iv.next53, %8
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.cond.for.end23_crit_edge.loopexit

for.cond5.preheader.us.us:                        ; preds = %for.cond5.preheader.us.us.preheader, %for.inc18.us.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.inc18.us.us ], [ 0, %for.cond5.preheader.us.us.preheader ]
  %11 = trunc i64 %indvars.iv48 to i32
  %mul83.us.us = add i32 %10, %11
  %add.us.us = mul i32 %mul83.us.us, %4
  %12 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.inc18.us.us:                                  ; preds = %if.end.us.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51, label %for.inc21.us.loopexit, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %13 = add i64 %12, %indvars.iv
  %14 = trunc i64 %13 to i32
  %rem.us.us = srem i32 %14, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %if.then.us.us, %for.body7.us.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %5, i64 %indvars.iv52, i64 %indvars.iv48, i64 %indvars.iv
  %17 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc18.us.us, label %for.body7.us.us

for.cond.for.end23_crit_edge.loopexit:            ; preds = %for.inc21.us
  %18 = trunc i64 %indvars.iv.next53 to i32
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge.loopexit45:          ; preds = %for.cond2.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  %19 = add i32 %i.promoted, 1
  %20 = icmp sgt i32 %4, %19
  %smax = select i1 %20, i32 %4, i32 %19
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge:                     ; preds = %for.cond.for.end23_crit_edge.loopexit45, %for.cond.for.end23_crit_edge.loopexit
  %inc.lcssa9.lcssa15.lcssa = phi i32 [ %inc.lcssa9.lcssa.us, %for.cond.for.end23_crit_edge.loopexit ], [ %k.promoted, %for.cond.for.end23_crit_edge.loopexit45 ]
  %inc22.lcssa = phi i32 [ %18, %for.cond.for.end23_crit_edge.loopexit ], [ %smax, %for.cond.for.end23_crit_edge.loopexit45 ]
  store i32 %inc22.lcssa, i32* %i, align 4
  store i32 %inc.lcssa9.lcssa15.lcssa, i32* %k, align 4
  br label %for.end23

for.end23:                                        ; preds = %for.cond.for.end23_crit_edge, %entry
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
