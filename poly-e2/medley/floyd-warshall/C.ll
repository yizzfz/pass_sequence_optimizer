; ModuleID = 'B.ll'
source_filename = "floyd-warshall.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"path\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_floyd_warshall = private constant [26 x i8] c"B.ll:kernel_floyd_warshall"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 72057642879544746, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_floyd_warshall = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_floyd_warshall = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1369982241097617872, i64 216172870439726390, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [66 x i8] c"@\00main\01B.ll:init_array\01B.ll:kernel_floyd_warshall\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_floyd_warshall to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 7840000, i32 4) #4
  %arraydecay = bitcast i8* %call to [2800 x i32]*
  tail call fastcc void @init_array(i32 2800, [2800 x i32]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_floyd_warshall(i32 2800, [2800 x i32]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %2 = add i64 %pgocount1, 1
  store i64 %2, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 2800, [2800 x i32]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2800 x i32]* nocapture %path) unnamed_addr #2 {
entry:
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond1.preheader.us.preheader, label %for.end22

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count11 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc20_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.cond1.for.inc20_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.body3.us.for.body3.us_crit_edge ]
  %0 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 7
  %add.us = add nsw i32 %rem.us, 1
  %arrayidx5.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv9, i64 %indvars.iv
  %2 = add nuw nsw i64 %indvars.iv, %indvars.iv9
  %3 = trunc i64 %2 to i32
  %rem7.us = srem i32 %3, 13
  %cmp8.us = icmp eq i32 %rem7.us, 0
  %4 = trunc i64 %2 to i32
  %rem10.us = srem i32 %4, 7
  %cmp11.us = icmp eq i32 %rem10.us, 0
  %or.cond.us = or i1 %cmp8.us, %cmp11.us
  %5 = trunc i64 %2 to i32
  %rem14.us = srem i32 %5, 11
  %cmp15.us = icmp eq i32 %rem14.us, 0
  %or.cond1.us = or i1 %cmp15.us, %or.cond.us
  %6 = zext i1 %or.cond1.us to i64
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %7 = add i64 %pgocount, %6
  store i64 %7, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %.add.us = select i1 %or.cond1.us, i32 999, i32 %add.us
  store i32 %.add.us, i32* %arrayidx5.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond1.for.inc20_crit_edge.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %8 = add i64 %pgocount1, 1
  store i64 %8, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body3.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.body3.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %9 = add i64 %pgocount2, 1
  store i64 %9, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  br i1 %exitcond12, label %for.end22.loopexit, label %for.cond1.preheader.us

for.end22.loopexit:                               ; preds = %for.cond1.for.inc20_crit_edge.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %10 = add i64 %pgocount3, 1
  store i64 %10, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %11 = add i64 %pgocount4, 1
  store i64 %11, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall(i32 %n, [2800 x i32]* nocapture %path) unnamed_addr #2 {
entry:
  %cmp6 = icmp sgt i32 %n, 0
  br i1 %cmp6, label %for.cond4.preheader.us.us.preheader.preheader, label %for.end40

for.cond4.preheader.us.us.preheader.preheader:    ; preds = %entry
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %0 = icmp eq i32 %n, 1
  %wide.trip.count32 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  %wide.trip.count35 = zext i32 %n to i64
  br label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.for.inc38_crit_edge.us, %for.cond4.preheader.us.us.preheader.preheader
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.cond1.for.inc38_crit_edge.us ], [ 0, %for.cond4.preheader.us.us.preheader.preheader ]
  %arrayidx16.us.us.prol = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv33, i64 0
  br label %for.cond4.preheader.us.us

for.cond1.for.inc38_crit_edge.us:                 ; preds = %for.cond4.for.inc35_crit_edge.us.us
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 4)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 4)
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %for.end40.loopexit, label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.inc35_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv30 = phi i64 [ 0, %for.cond4.preheader.us.us.preheader ], [ %indvars.iv.next31, %for.cond4.for.inc35_crit_edge.us.us ]
  %arrayidx12.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv30, i64 %indvars.iv33
  br i1 %lcmp.mod, label %for.body6.us.us.prol.loopexit, label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 2)
  %2 = add i64 %pgocount1, 1
  store i64 %2, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 2)
  %arrayidx8.us.us.prol = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv30, i64 0
  %3 = load i32, i32* %arrayidx8.us.us.prol, align 4
  %4 = load i32, i32* %arrayidx12.us.us, align 4
  %5 = load i32, i32* %arrayidx16.us.us.prol, align 4
  %add.us.us.prol = add nsw i32 %5, %4
  %cmp17.us.us.prol = icmp slt i32 %3, %add.us.us.prol
  %6 = zext i1 %cmp17.us.us.prol to i64
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 7)
  %7 = add i64 %pgocount2, %6
  store i64 %7, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 7)
  %.add.us.us.prol = select i1 %cmp17.us.us.prol, i32 %3, i32 %add.us.us.prol
  store i32 %.add.us.us.prol, i32* %arrayidx8.us.us.prol, align 4
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br i1 %0, label %for.body6.us.us.prol.loopexit.for.cond4.for.inc35_crit_edge.us.us_crit_edge, label %for.body6.us.us.preheader

for.body6.us.us.prol.loopexit.for.cond4.for.inc35_crit_edge.us.us_crit_edge: ; preds = %for.body6.us.us.prol.loopexit
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 1)
  %8 = add i64 %pgocount3, 1
  store i64 %8, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 1)
  br label %for.cond4.for.inc35_crit_edge.us.us

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.inc35_crit_edge.us.us.loopexit:     ; preds = %for.body6.us.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 3)
  %9 = add i64 %pgocount4, 1
  store i64 %9, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 3)
  br label %for.cond4.for.inc35_crit_edge.us.us

for.cond4.for.inc35_crit_edge.us.us:              ; preds = %for.body6.us.us.prol.loopexit.for.cond4.for.inc35_crit_edge.us.us_crit_edge, %for.cond4.for.inc35_crit_edge.us.us.loopexit
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond, label %for.cond1.for.inc38_crit_edge.us, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.for.body6.us.us_crit_edge, %for.body6.us.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.us.us.for.body6.us.us_crit_edge ], [ %indvars.iv.unr.ph, %for.body6.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv30, i64 %indvars.iv
  %10 = load i32, i32* %arrayidx8.us.us, align 4
  %11 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx16.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv33, i64 %indvars.iv
  %12 = load i32, i32* %arrayidx16.us.us, align 4
  %add.us.us = add nsw i32 %12, %11
  %cmp17.us.us = icmp slt i32 %10, %add.us.us
  %13 = zext i1 %cmp17.us.us to i64
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 8)
  %14 = add i64 %pgocount5, %13
  store i64 %14, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 8)
  %.add.us.us = select i1 %cmp17.us.us, i32 %10, i32 %add.us.us
  store i32 %.add.us.us, i32* %arrayidx8.us.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv30, i64 %indvars.iv.next
  %15 = load i32, i32* %arrayidx8.us.us.1, align 4
  %16 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx16.us.us.1 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv33, i64 %indvars.iv.next
  %17 = load i32, i32* %arrayidx16.us.us.1, align 4
  %add.us.us.1 = add nsw i32 %17, %16
  %cmp17.us.us.1 = icmp slt i32 %15, %add.us.us.1
  %18 = zext i1 %cmp17.us.us.1 to i64
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 9)
  %19 = add i64 %pgocount6, %18
  store i64 %19, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 9)
  %.add.us.us.1 = select i1 %cmp17.us.us.1, i32 %15, i32 %add.us.us.1
  store i32 %.add.us.us.1, i32* %arrayidx8.us.us.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond4.for.inc35_crit_edge.us.us.loopexit, label %for.body6.us.us.for.body6.us.us_crit_edge

for.body6.us.us.for.body6.us.us_crit_edge:        ; preds = %for.body6.us.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 0)
  %20 = add i64 %pgocount7, 1
  store i64 %20, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 0)
  br label %for.body6.us.us

for.end40.loopexit:                               ; preds = %for.cond1.for.inc38_crit_edge.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 6)
  %21 = add i64 %pgocount8, 1
  store i64 %21, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 6)
  br label %for.end40

for.end40:                                        ; preds = %for.end40.loopexit, %entry
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 5)
  %22 = add i64 %pgocount9, 1
  store i64 %22, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_floyd_warshall, i64 0, i64 5)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2800 x i32]* nocapture readonly %path) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count10 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv7, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.if.end.us_crit_edge

for.body4.us.if.end.us_crit_edge:                 ; preds = %for.body4.us
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %8 = add i64 %pgocount1, 1
  store i64 %8, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us.if.end.us_crit_edge, %if.then.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv7, i64 %indvars.iv
  %11 = load i32, i32* %arrayidx8.us, align 4
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %11) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, %wide.trip.count10
  br i1 %exitcond11, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %13 = add i64 %pgocount3, 1
  store i64 %13, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %14 = add i64 %pgocount4, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
