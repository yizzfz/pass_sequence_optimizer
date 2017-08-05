; ModuleID = 'A.ll'
source_filename = "lu.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #5
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %arraydecay3 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  %cmp76 = icmp sgt i32 %n, 0
  br i1 %cmp76, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call141 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %0 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call141, i8** %0, align 8
  br label %for.cond78.preheader.for.end99_crit_edge

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %1 = sext i32 %n to i64
  %2 = zext i32 %n to i64
  %3 = add nuw nsw i64 %2, 7
  %4 = add nsw i64 %2, -2
  %5 = trunc i32 %n to i3
  %wide.trip.count118.7 = zext i32 %n to i64
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23.for.inc.lr.ph_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv138.in = phi i3 [ %5, %for.cond1.preheader.lr.ph ], [ %indvars.iv138, %for.inc23.for.inc.lr.ph_crit_edge ]
  %indvars.iv136 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next137, %for.inc23.for.inc.lr.ph_crit_edge ]
  %indvars.iv122 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next123, %for.inc23.for.inc.lr.ph_crit_edge ]
  %6 = phi [2000 x double]* [ %A, %for.cond1.preheader.lr.ph ], [ %.lcssa8, %for.inc23.for.inc.lr.ph_crit_edge ]
  %indvars.iv138 = add i3 %indvars.iv138.in, -1
  %7 = zext i3 %indvars.iv138 to i64
  %8 = sub i64 %3, %indvars.iv122
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %9 = add i64 %indvars.iv136, %7
  %10 = sub i64 %4, %indvars.iv122
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %cmp968 = icmp slt i64 %indvars.iv.next123, %1
  br i1 %cmp968, label %for.inc16.lr.ph, label %for.inc23

for.inc16.lr.ph:                                  ; preds = %for.cond8.preheader
  %11 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %xtraiter131 = and i64 %8, 7
  %lcmp.mod132 = icmp eq i64 %xtraiter131, 0
  br i1 %lcmp.mod132, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol.preheader, %for.inc16.prol.for.inc16.prol_crit_edge
  %indvars.iv116.prol = phi i64 [ %indvars.iv.next117.prol, %for.inc16.prol.for.inc16.prol_crit_edge ], [ %indvars.iv136, %for.inc16.prol.preheader ]
  %12 = phi [2000 x double]* [ %11, %for.inc16.prol.for.inc16.prol_crit_edge ], [ %.pre, %for.inc16.prol.preheader ]
  %prol.iter133 = phi i64 [ %prol.iter133.sub, %for.inc16.prol.for.inc16.prol_crit_edge ], [ %xtraiter131, %for.inc16.prol.preheader ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %indvars.iv122, i64 %indvars.iv116.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %prol.iter133.sub = add nsw i64 %prol.iter133, -1
  %prol.iter133.cmp = icmp eq i64 %prol.iter133.sub, 0
  br i1 %prol.iter133.cmp, label %for.inc16.prol.loopexit.loopexit, label %for.inc16.prol.for.inc16.prol_crit_edge, !llvm.loop !1

for.inc16.prol.for.inc16.prol_crit_edge:          ; preds = %for.inc16.prol
  %indvars.iv.next117.prol = add nuw nsw i64 %indvars.iv116.prol, 1
  br label %for.inc16.prol

for.inc16.prol.loopexit.loopexit:                 ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.prol.loopexit.loopexit, %for.inc16.lr.ph
  %indvars.iv116.unr = phi i64 [ %indvars.iv136, %for.inc16.lr.ph ], [ %9, %for.inc16.prol.loopexit.loopexit ]
  %.unr = phi [2000 x double]* [ %.pre, %for.inc16.lr.ph ], [ %11, %for.inc16.prol.loopexit.loopexit ]
  %13 = icmp ult i64 %10, 7
  br i1 %13, label %for.inc23, label %for.inc16.preheader

for.inc16.preheader:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv107 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next108, %for.inc ]
  %14 = sub nsw i64 0, %indvars.iv107
  %15 = trunc i64 %14 to i32
  %rem = srem i32 %15, %n
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv122, i64 %indvars.iv107
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next108, %indvars.iv136
  br i1 %exitcond113, label %for.cond8.preheader, label %for.inc

for.inc16:                                        ; preds = %for.inc16.preheader, %for.inc16
  %indvars.iv116 = phi i64 [ %indvars.iv.next117.7, %for.inc16 ], [ %indvars.iv116.unr, %for.inc16.preheader ]
  %16 = phi [2000 x double]* [ %11, %for.inc16 ], [ %.unr, %for.inc16.preheader ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv122, i64 %indvars.iv116
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv122, i64 %indvars.iv.next117
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next117.1 = add nsw i64 %indvars.iv116, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv122, i64 %indvars.iv.next117.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next117.2 = add nsw i64 %indvars.iv116, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv122, i64 %indvars.iv.next117.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next117.3 = add nsw i64 %indvars.iv116, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv122, i64 %indvars.iv.next117.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next117.4 = add nsw i64 %indvars.iv116, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv122, i64 %indvars.iv.next117.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next117.5 = add nsw i64 %indvars.iv116, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv122, i64 %indvars.iv.next117.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next117.6 = add nsw i64 %indvars.iv116, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv122, i64 %indvars.iv.next117.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %indvars.iv.next117.7 = add nsw i64 %indvars.iv116, 8
  %exitcond119.7 = icmp eq i64 %indvars.iv.next117.7, %wide.trip.count118.7
  br i1 %exitcond119.7, label %for.inc23.loopexit, label %for.inc16

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.inc16.prol.loopexit, %for.cond8.preheader
  %.lcssa8 = phi [2000 x double]* [ %.pre, %for.cond8.preheader ], [ %11, %for.inc16.prol.loopexit ], [ %11, %for.inc23.loopexit ]
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %.lcssa8, i64 %indvars.iv122, i64 %indvars.iv122
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond140 = icmp eq i64 %indvars.iv.next123, %2
  br i1 %exitcond140, label %for.end25, label %for.inc23.for.inc.lr.ph_crit_edge

for.inc23.for.inc.lr.ph_crit_edge:                ; preds = %for.inc23
  %indvars.iv.next137 = add nuw i64 %indvars.iv136, 1
  br label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %17 = icmp sgt i32 %n, 0
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %18 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %18, align 8
  br i1 %17, label %for.cond30.preheader.us.preheader, label %for.cond78.preheader.for.end99_crit_edge

for.cond30.preheader.us.preheader:                ; preds = %for.end25
  %19 = add i32 %n, -1
  %20 = zext i32 %19 to i64
  %21 = shl nuw nsw i64 %20, 3
  %22 = add nuw nsw i64 %21, 8
  %23 = zext i32 %n to i64
  %24 = add nsw i64 %23, -1
  %xtraiter128 = and i64 %23, 3
  %lcmp.mod129 = icmp eq i64 %xtraiter128, 0
  br i1 %lcmp.mod129, label %for.cond30.preheader.us.prol.loopexit, label %for.cond30.for.inc41_crit_edge.us.prol.preheader

for.cond30.for.inc41_crit_edge.us.prol.preheader: ; preds = %for.cond30.preheader.us.preheader
  br label %for.cond30.for.inc41_crit_edge.us.prol

for.cond30.for.inc41_crit_edge.us.prol:           ; preds = %for.cond30.for.inc41_crit_edge.us.prol.preheader, %for.cond30.for.inc41_crit_edge.us.prol.for.cond30.for.inc41_crit_edge.us.prol_crit_edge
  %indvars.iv103.prol = phi i64 [ %indvars.iv.next104.prol, %for.cond30.for.inc41_crit_edge.us.prol.for.cond30.for.inc41_crit_edge.us.prol_crit_edge ], [ 0, %for.cond30.for.inc41_crit_edge.us.prol.preheader ]
  %prol.iter130 = phi i64 [ %prol.iter130.sub, %for.cond30.for.inc41_crit_edge.us.prol.for.cond30.for.inc41_crit_edge.us.prol_crit_edge ], [ %xtraiter128, %for.cond30.for.inc41_crit_edge.us.prol.preheader ]
  %25 = mul nuw nsw i64 %indvars.iv103.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %22, i32 8, i1 false)
  %prol.iter130.sub = add nsw i64 %prol.iter130, -1
  %prol.iter130.cmp = icmp eq i64 %prol.iter130.sub, 0
  br i1 %prol.iter130.cmp, label %for.cond30.preheader.us.prol.loopexit.loopexit, label %for.cond30.for.inc41_crit_edge.us.prol.for.cond30.for.inc41_crit_edge.us.prol_crit_edge, !llvm.loop !3

for.cond30.for.inc41_crit_edge.us.prol.for.cond30.for.inc41_crit_edge.us.prol_crit_edge: ; preds = %for.cond30.for.inc41_crit_edge.us.prol
  %indvars.iv.next104.prol = add nuw nsw i64 %indvars.iv103.prol, 1
  br label %for.cond30.for.inc41_crit_edge.us.prol

for.cond30.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond30.for.inc41_crit_edge.us.prol
  br label %for.cond30.preheader.us.prol.loopexit

for.cond30.preheader.us.prol.loopexit:            ; preds = %for.cond30.preheader.us.prol.loopexit.loopexit, %for.cond30.preheader.us.preheader
  %indvars.iv103.unr = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %xtraiter128, %for.cond30.preheader.us.prol.loopexit.loopexit ]
  %26 = icmp ult i64 %24, 3
  br i1 %26, label %for.cond44.preheader, label %for.cond30.for.inc41_crit_edge.us.3.preheader

for.cond30.for.inc41_crit_edge.us.3.preheader:    ; preds = %for.cond30.preheader.us.prol.loopexit
  %wide.trip.count105.3 = zext i32 %n to i64
  %27 = add nsw i64 %23, -4
  %28 = sub nsw i64 %27, %indvars.iv103.unr
  %29 = lshr i64 %28, 2
  %30 = and i64 %29, 1
  %lcmp.mod = icmp eq i64 %30, 0
  br i1 %lcmp.mod, label %for.cond30.for.inc41_crit_edge.us.3.prol.preheader, label %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit

for.cond30.for.inc41_crit_edge.us.3.prol.preheader: ; preds = %for.cond30.for.inc41_crit_edge.us.3.preheader
  br label %for.cond30.for.inc41_crit_edge.us.3.prol

for.cond30.for.inc41_crit_edge.us.3.prol:         ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol.preheader
  %31 = mul nuw nsw i64 %indvars.iv103.unr, 16000
  %scevgep.prol150 = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol150, i8 0, i64 %22, i32 8, i1 false)
  %32 = mul nuw nsw i64 %indvars.iv103.unr, 16000
  %33 = add nuw nsw i64 %32, 16000
  %scevgep.1.prol = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %22, i32 8, i1 false)
  %34 = mul nuw nsw i64 %indvars.iv103.unr, 16000
  %35 = add nuw nsw i64 %34, 32000
  %scevgep.2.prol = getelementptr i8, i8* %call, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %22, i32 8, i1 false)
  %36 = mul nuw nsw i64 %indvars.iv103.unr, 16000
  %37 = add nuw nsw i64 %36, 48000
  %scevgep.3.prol = getelementptr i8, i8* %call, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next104.3.prol = or i64 %indvars.iv103.unr, 4
  br label %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit

for.cond30.for.inc41_crit_edge.us.3.prol.loopexit: ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol, %for.cond30.for.inc41_crit_edge.us.3.preheader
  %indvars.iv103.unr151 = phi i64 [ %indvars.iv103.unr, %for.cond30.for.inc41_crit_edge.us.3.preheader ], [ %indvars.iv.next104.3.prol, %for.cond30.for.inc41_crit_edge.us.3.prol ]
  %38 = icmp eq i64 %29, 0
  br i1 %38, label %for.cond44.preheader.loopexit, label %for.cond30.for.inc41_crit_edge.us.3.preheader.new

for.cond30.for.inc41_crit_edge.us.3.preheader.new: ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit
  br label %for.cond30.for.inc41_crit_edge.us.3

for.cond44.preheader.loopexit.unr-lcssa:          ; preds = %for.cond30.for.inc41_crit_edge.us.3
  br label %for.cond44.preheader.loopexit

for.cond44.preheader.loopexit:                    ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit, %for.cond44.preheader.loopexit.unr-lcssa
  br label %for.cond44.preheader

for.cond44.preheader:                             ; preds = %for.cond44.preheader.loopexit, %for.cond30.preheader.us.prol.loopexit
  %39 = icmp sgt i32 %n, 0
  br i1 %39, label %for.cond48.preheader.us.preheader, label %for.cond78.preheader.for.end99_crit_edge

for.cond48.preheader.us.preheader:                ; preds = %for.cond44.preheader
  %40 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %41 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %42 = zext i32 %n to i64
  %xtraiter126 = and i64 %42, 1
  %wide.trip.count89.1 = zext i32 %n to i64
  %43 = icmp eq i64 %xtraiter126, 0
  %44 = icmp eq i32 %n, 1
  %sunkaddr = ptrtoint [2000 x double]* %40 to i64
  br label %for.cond52.preheader.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next96, %42
  br i1 %exitcond135, label %for.cond78.preheader, label %for.cond52.preheader.lr.ph.us

for.cond52.preheader.lr.ph.us:                    ; preds = %for.inc75.us, %for.cond48.preheader.us.preheader
  %indvars.iv95 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %indvars.iv.next96, %for.inc75.us ]
  %sunkaddr143 = shl nuw nsw i64 %indvars.iv95, 3
  %sunkaddr144 = add i64 %sunkaddr, %sunkaddr143
  %sunkaddr145 = inttoptr i64 %sunkaddr144 to double*
  br label %for.cond52.preheader.us.us

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.lr.ph.us
  %indvars.iv91 = phi i64 [ 0, %for.cond52.preheader.lr.ph.us ], [ %indvars.iv.next92, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv91, i64 %indvars.iv95
  br i1 %43, label %for.inc69.us.us.prol.loopexit, label %for.inc69.us.us.prol

for.inc69.us.us.prol:                             ; preds = %for.cond52.preheader.us.us
  %45 = load double, double* %arrayidx59.us.us, align 8
  %46 = load double, double* %sunkaddr145, align 8
  %mul.us.us.prol = fmul double %45, %46
  %arrayidx67.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv91, i64 0
  %47 = load double, double* %arrayidx67.us.us.prol, align 8
  %add68.us.us.prol = fadd double %mul.us.us.prol, %47
  store double %add68.us.us.prol, double* %arrayidx67.us.us.prol, align 8
  br label %for.inc69.us.us.prol.loopexit

for.inc69.us.us.prol.loopexit:                    ; preds = %for.cond52.preheader.us.us, %for.inc69.us.us.prol
  %indvars.iv87.unr.ph = phi i64 [ 1, %for.inc69.us.us.prol ], [ 0, %for.cond52.preheader.us.us ]
  br i1 %44, label %for.cond52.for.inc72_crit_edge.us.us, label %for.inc69.us.us.preheader

for.inc69.us.us.preheader:                        ; preds = %for.inc69.us.us.prol.loopexit
  br label %for.inc69.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit, %for.inc69.us.us.prol.loopexit
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next92, %42
  br i1 %exitcond134, label %for.inc75.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us.preheader, %for.inc69.us.us
  %indvars.iv87 = phi i64 [ %indvars.iv.next88.1, %for.inc69.us.us ], [ %indvars.iv87.unr.ph, %for.inc69.us.us.preheader ]
  %48 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv87, i64 %indvars.iv95
  %49 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %48, %49
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv91, i64 %indvars.iv87
  %50 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %50
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %51 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 %indvars.iv.next88, i64 %indvars.iv95
  %52 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %51, %52
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next88
  %53 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %53
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next88.1 = add nuw nsw i64 %indvars.iv87, 2
  %exitcond90.1 = icmp eq i64 %indvars.iv.next88.1, %wide.trip.count89.1
  br i1 %exitcond90.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us

for.cond78.preheader:                             ; preds = %for.inc75.us
  %54 = icmp sgt i32 %n, 0
  br i1 %54, label %for.cond82.preheader.us.preheader, label %for.cond78.preheader.for.end99_crit_edge

for.cond78.preheader.for.end99_crit_edge:         ; preds = %for.cond78.preheader, %for.cond44.preheader, %for.end25, %for.end25.thread
  %sunkaddr147 = bitcast [2000 x [2000 x double]]** %B to i8**
  %.pre80 = load i8*, i8** %sunkaddr147, align 8
  br label %for.end99

for.cond82.preheader.us.preheader:                ; preds = %for.cond78.preheader
  %55 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %56 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %57 = zext i32 %n to i64
  %58 = add nsw i64 %57, -1
  %xtraiter = and i64 %57, 3
  %wide.trip.count.3 = zext i32 %n to i64
  %59 = icmp eq i64 %xtraiter, 0
  %60 = icmp ult i64 %58, 3
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv83 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next84, %for.cond82.for.inc97_crit_edge.us ]
  br i1 %59, label %for.inc94.us.prol.loopexit, label %for.inc94.us.prol.preheader

for.inc94.us.prol.preheader:                      ; preds = %for.cond82.preheader.us
  br label %for.inc94.us.prol

for.inc94.us.prol:                                ; preds = %for.inc94.us.prol.preheader, %for.inc94.us.prol.for.inc94.us.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc94.us.prol.for.inc94.us.prol_crit_edge ], [ 0, %for.inc94.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc94.us.prol.for.inc94.us.prol_crit_edge ], [ %xtraiter, %for.inc94.us.prol.preheader ]
  %arrayidx89.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv83, i64 %indvars.iv.prol
  %61 = bitcast double* %arrayidx89.us.prol to i64*
  %62 = load i64, i64* %61, align 8
  %arrayidx93.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %56, i64 %indvars.iv83, i64 %indvars.iv.prol
  %63 = bitcast double* %arrayidx93.us.prol to i64*
  store i64 %62, i64* %63, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc94.us.prol.loopexit.loopexit, label %for.inc94.us.prol.for.inc94.us.prol_crit_edge, !llvm.loop !4

for.inc94.us.prol.for.inc94.us.prol_crit_edge:    ; preds = %for.inc94.us.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.inc94.us.prol

for.inc94.us.prol.loopexit.loopexit:              ; preds = %for.inc94.us.prol
  br label %for.inc94.us.prol.loopexit

for.inc94.us.prol.loopexit:                       ; preds = %for.inc94.us.prol.loopexit.loopexit, %for.cond82.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond82.preheader.us ], [ %xtraiter, %for.inc94.us.prol.loopexit.loopexit ]
  br i1 %60, label %for.cond82.for.inc97_crit_edge.us, label %for.inc94.us.preheader

for.inc94.us.preheader:                           ; preds = %for.inc94.us.prol.loopexit
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.inc94.us.preheader, %for.inc94.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc94.us ], [ %indvars.iv.unr, %for.inc94.us.preheader ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv83, i64 %indvars.iv
  %64 = bitcast double* %arrayidx89.us to i64*
  %65 = load i64, i64* %64, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %56, i64 %indvars.iv83, i64 %indvars.iv
  %66 = bitcast double* %arrayidx93.us to i64*
  store i64 %65, i64* %66, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next
  %67 = bitcast double* %arrayidx89.us.1 to i64*
  %68 = load i64, i64* %67, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %56, i64 %indvars.iv83, i64 %indvars.iv.next
  %69 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %68, i64* %69, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next.1
  %70 = bitcast double* %arrayidx89.us.2 to i64*
  %71 = load i64, i64* %70, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %56, i64 %indvars.iv83, i64 %indvars.iv.next.1
  %72 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %71, i64* %72, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next.2
  %73 = bitcast double* %arrayidx89.us.3 to i64*
  %74 = load i64, i64* %73, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %56, i64 %indvars.iv83, i64 %indvars.iv.next.2
  %75 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %74, i64* %75, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit, %for.inc94.us.prol.loopexit
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond = icmp eq i64 %indvars.iv.next84, %57
  br i1 %exitcond, label %for.end99.loopexit, label %for.cond82.preheader.us

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  %76 = bitcast [2000 x [2000 x double]]* %55 to i8*
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.cond78.preheader.for.end99_crit_edge
  %77 = phi i8* [ %.pre80, %for.cond78.preheader.for.end99_crit_edge ], [ %76, %for.end99.loopexit ]
  tail call void @free(i8* %77) #5
  ret void

for.cond30.for.inc41_crit_edge.us.3:              ; preds = %for.cond30.for.inc41_crit_edge.us.3, %for.cond30.for.inc41_crit_edge.us.3.preheader.new
  %indvars.iv103 = phi i64 [ %indvars.iv103.unr151, %for.cond30.for.inc41_crit_edge.us.3.preheader.new ], [ %indvars.iv.next104.3.1, %for.cond30.for.inc41_crit_edge.us.3 ]
  %78 = mul nuw nsw i64 %indvars.iv103, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %78
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %22, i32 8, i1 false)
  %79 = mul i64 %indvars.iv103, 16000
  %80 = add i64 %79, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %80
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %22, i32 8, i1 false)
  %81 = mul i64 %indvars.iv103, 16000
  %82 = add i64 %81, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %82
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %22, i32 8, i1 false)
  %83 = mul i64 %indvars.iv103, 16000
  %84 = add i64 %83, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %84
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next104.3 = add nuw nsw i64 %indvars.iv103, 4
  %85 = mul nuw nsw i64 %indvars.iv.next104.3, 16000
  %scevgep.1152 = getelementptr i8, i8* %call, i64 %85
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1152, i8 0, i64 %22, i32 8, i1 false)
  %86 = mul i64 %indvars.iv.next104.3, 16000
  %87 = add i64 %86, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %87
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %22, i32 8, i1 false)
  %88 = mul i64 %indvars.iv.next104.3, 16000
  %89 = add i64 %88, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %89
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %22, i32 8, i1 false)
  %90 = mul i64 %indvars.iv.next104.3, 16000
  %91 = add i64 %90, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %91
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next104.3.1 = add nsw i64 %indvars.iv103, 8
  %exitcond106.3.1 = icmp eq i64 %indvars.iv.next104.3.1, %wide.trip.count105.3
  br i1 %exitcond106.3.1, label %for.cond44.preheader.loopexit.unr-lcssa, label %for.cond30.for.inc41_crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* %A) unnamed_addr #2 {
entry:
  %cmp23 = icmp sgt i32 %n, 0
  br i1 %cmp23, label %for.cond1.preheader.lr.ph, label %for.end56

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = zext i32 %n to i64
  %1 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %for.cond1.preheader.lr.ph
  %indvars.iv52 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next53, %for.inc54 ]
  %cmp211 = icmp sgt i64 %indvars.iv52, 0
  br i1 %cmp211, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.inc25
  %2 = icmp sgt i64 %indvars.iv52, 0
  br i1 %2, label %for.cond31.preheader.us.preheader, label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter56 = and i64 %indvars.iv52, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  %3 = icmp eq i64 %xtraiter56, 0
  %4 = icmp eq i64 %indvars.iv52, 1
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc51_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv52, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next49, %for.cond31.for.inc51_crit_edge.us ]
  %arrayidx46.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv48
  %.pre30 = load double, double* %arrayidx46.us.phi.trans.insert, align 8
  br i1 %3, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.cond31.preheader.us
  %5 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv48
  %6 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %5, %6
  %sub47.us.prol = fsub double %.pre30, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us.phi.trans.insert, align 8
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.cond31.preheader.us, %for.inc48.us.prol
  %indvars.iv41.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr58.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre30, %for.cond31.preheader.us ]
  br i1 %4, label %for.cond31.for.inc51_crit_edge.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42.1, %for.inc48.us ], [ %indvars.iv41.unr.ph, %for.inc48.us.preheader ]
  %7 = phi double [ %sub47.us.1, %for.inc48.us ], [ %.unr58.ph, %for.inc48.us.preheader ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv41
  %8 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv48
  %9 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %8, %9
  %sub47.us = fsub double %7, %mul42.us
  store double %sub47.us, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next42
  %10 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next42, i64 %indvars.iv48
  %11 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %10, %11
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42.1 = add nuw nsw i64 %indvars.iv41, 2
  %exitcond45.1 = icmp eq i64 %indvars.iv.next42.1, %indvars.iv52
  br i1 %exitcond45.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.cond31.for.inc51_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond = icmp eq i64 %indvars.iv.next49, %0
  br i1 %exitcond, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.inc25, %for.cond4.preheader.preheader
  %indvars.iv34 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next35, %for.inc25 ]
  %cmp57 = icmp sgt i64 %indvars.iv34, 0
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv34
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br i1 %cmp57, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv34, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %12 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv34
  %13 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %12, %13
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph, %for.inc.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.lr.ph ]
  %14 = icmp eq i64 %indvars.iv34, 1
  br i1 %14, label %for.inc25, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc ], [ %indvars.iv.unr.ph, %for.inc.preheader ]
  %15 = phi double [ %sub.1, %for.inc ], [ %.unr.ph, %for.inc.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv
  %16 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv34
  %17 = load double, double* %arrayidx12, align 8
  %mul = fmul double %16, %17
  %sub = fsub double %15, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next
  %18 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv34
  %19 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %18, %19
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv34
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.cond4.preheader
  %20 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv34
  %21 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv34
  %div = fdiv double %20, %21
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next35, %indvars.iv52
  br i1 %exitcond39, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond31.preheader.lr.ph, %for.cond1.preheader
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next53, %1
  br i1 %exitcond59, label %for.end56.loopexit, label %for.cond1.preheader

for.end56.loopexit:                               ; preds = %for.inc54
  br label %for.end56

for.end56:                                        ; preds = %for.end56.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp6 = icmp sgt i32 %n, 0
  br i1 %cmp6, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  %5 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv10, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %7 = add nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %rem.us = srem i32 %8, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %11 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond15, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, %5
  br i1 %exitcond, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %13) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
