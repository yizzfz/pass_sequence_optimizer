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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #0 {
for.cond1.preheader.lr.ph:
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.body3.lr.ph.backedge, %for.cond1.preheader.lr.ph
  %indvars.iv141 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %0, %for.body3.lr.ph.backedge ]
  %indvars.iv139 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv139.be, %for.body3.lr.ph.backedge ]
  %0 = add nuw nsw i64 %indvars.iv141, 1
  %1 = sub i64 1998, %indvars.iv141
  %2 = shl i64 %1, 3
  %3 = and i64 %2, 34359738360
  br label %for.body3

for.cond8.preheader:                              ; preds = %for.body3
  %cmp994 = icmp slt i64 %0, 2000
  br i1 %cmp994, label %for.end18.thread, label %for.end18

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %for.body3 ], [ 0, %for.body3.lr.ph ]
  %4 = sub nsw i64 0, %indvars.iv123
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv141, i64 %indvars.iv123
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next124, %indvars.iv139
  br i1 %exitcond129, label %for.cond8.preheader, label %for.body3

for.end18.thread:                                 ; preds = %for.cond8.preheader
  %6 = add nuw nsw i64 %3, 8
  %scevgep136 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %0
  %7 = mul nuw nsw i64 %indvars.iv141, 2000
  %scevgep137 = getelementptr double, double* %scevgep136, i64 %7
  %scevgep137138 = bitcast double* %scevgep137 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep137138, i8 0, i64 %6, i32 8, i1 false)
  %arrayidx22150 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv141, i64 %indvars.iv141
  store double 1.000000e+00, double* %arrayidx22150, align 8
  br label %for.body3.lr.ph.backedge

for.end18:                                        ; preds = %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv141, i64 %indvars.iv141
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond144 = icmp eq i64 %0, 2000
  br i1 %exitcond144, label %for.cond30.preheader.us.preheader.new, label %for.body3.lr.ph.backedge

for.body3.lr.ph.backedge:                         ; preds = %for.end18, %for.end18.thread
  %indvars.iv139.be = add nuw nsw i64 %indvars.iv139, 1
  br label %for.body3.lr.ph

for.cond30.preheader.us.preheader.new:            ; preds = %for.end18
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  br label %for.cond30.for.inc41_crit_edge.us.3

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond52.preheader.us.us.preheader.preheader, %for.cond48.for.inc75_crit_edge.us
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %for.cond48.for.inc75_crit_edge.us ], [ 0, %for.cond52.preheader.us.us.preheader.preheader ]
  br label %for.cond52.preheader.us.us.new

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next112, 2000
  br i1 %exitcond114, label %for.cond82.preheader.us.new.preheader, label %for.cond52.preheader.us.us.preheader

for.cond82.preheader.us.new.preheader:            ; preds = %for.cond48.for.inc75_crit_edge.us
  br label %for.cond82.preheader.us.new

for.cond52.preheader.us.us.new:                   ; preds = %for.cond52.preheader.us.us.preheader, %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv107 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next108, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv107, i64 %indvars.iv111
  br label %for.body55.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.body55.us.us
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next108, 2000
  br i1 %exitcond110, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us.new

for.body55.us.us:                                 ; preds = %for.body55.us.us, %for.cond52.preheader.us.us.new
  %indvars.iv103 = phi i64 [ 0, %for.cond52.preheader.us.us.new ], [ %indvars.iv.next104.1, %for.body55.us.us ]
  %8 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv111
  %9 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %8, %9
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv107, i64 %indvars.iv103
  %10 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %10, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next104 = or i64 %indvars.iv103, 1
  %11 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next104, i64 %indvars.iv111
  %12 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %11, %12
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next104
  %13 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %13, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next104.1 = add nuw nsw i64 %indvars.iv103, 2
  %exitcond106.1 = icmp eq i64 %indvars.iv.next104.1, 2000
  br i1 %exitcond106.1, label %for.cond52.for.inc72_crit_edge.us.us, label %for.body55.us.us

for.cond82.preheader.us.new:                      ; preds = %for.cond82.preheader.us.new.preheader, %for.cond82.for.inc97_crit_edge.us
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %for.cond82.for.inc97_crit_edge.us ], [ 0, %for.cond82.preheader.us.new.preheader ]
  br label %for.body85.us

for.body85.us:                                    ; preds = %for.body85.us, %for.cond82.preheader.us.new
  %indvars.iv = phi i64 [ 0, %for.cond82.preheader.us.new ], [ %indvars.iv.next.3, %for.body85.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv99, i64 %indvars.iv
  %14 = bitcast double* %arrayidx89.us to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv
  %16 = bitcast double* %arrayidx93.us to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv99, i64 %indvars.iv.next
  %17 = bitcast double* %arrayidx89.us.1 to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv.next
  %19 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv99, i64 %indvars.iv.next.1
  %20 = bitcast double* %arrayidx89.us.2 to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv.next.1
  %22 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv99, i64 %indvars.iv.next.2
  %23 = bitcast double* %arrayidx89.us.3 to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv.next.2
  %25 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us, label %for.body85.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.body85.us
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next100, 2000
  br i1 %exitcond102, label %for.end99, label %for.cond82.preheader.us.new

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* nonnull %call) #5
  ret void

for.cond30.for.inc41_crit_edge.us.3:              ; preds = %for.cond30.for.inc41_crit_edge.us.3, %for.cond30.preheader.us.preheader.new
  %indvars.iv119 = phi i64 [ 0, %for.cond30.preheader.us.preheader.new ], [ %indvars.iv.next120.3.1, %for.cond30.for.inc41_crit_edge.us.3 ]
  %26 = mul nuw nsw i64 %indvars.iv119, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120 = or i64 %indvars.iv119, 1
  %27 = mul nuw nsw i64 %indvars.iv.next120, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.1 = or i64 %indvars.iv119, 2
  %28 = mul nuw nsw i64 %indvars.iv.next120.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.2 = or i64 %indvars.iv119, 3
  %29 = mul nuw nsw i64 %indvars.iv.next120.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.3 = or i64 %indvars.iv119, 4
  %30 = mul nuw nsw i64 %indvars.iv.next120.3, 16000
  %scevgep.1153 = getelementptr i8, i8* %call, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1153, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.1154 = or i64 %indvars.iv119, 5
  %31 = mul nuw nsw i64 %indvars.iv.next120.1154, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.1.1 = or i64 %indvars.iv119, 6
  %32 = mul nuw nsw i64 %indvars.iv.next120.1.1, 16000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.2.1 = or i64 %indvars.iv119, 7
  %33 = mul nuw nsw i64 %indvars.iv.next120.2.1, 16000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.3.1 = add nsw i64 %indvars.iv119, 8
  %exitcond122.3.1 = icmp eq i64 %indvars.iv.next120.3.1, 2000
  br i1 %exitcond122.3.1, label %for.cond52.preheader.us.us.preheader.preheader, label %for.cond30.for.inc41_crit_edge.us.3

for.cond52.preheader.us.us.preheader.preheader:   ; preds = %for.cond30.for.inc41_crit_edge.us.3
  %34 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond52.preheader.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
for.cond1.preheader.preheader:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %for.cond1.preheader.preheader
  %indvars.iv71 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next72, %for.inc54 ]
  %cmp238 = icmp sgt i64 %indvars.iv71, 0
  br i1 %cmp238, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.us.preheader:                ; preds = %for.end
  %xtraiter75 = and i64 %indvars.iv71, 1
  %0 = icmp eq i64 %xtraiter75, 0
  %1 = icmp eq i64 %indvars.iv71, 1
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv71, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv67
  %.pre49 = load double, double* %arrayidx46.us, align 8
  br i1 %0, label %for.body33.us.prol.loopexit, label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.cond31.preheader.us
  %2 = load double, double* %arrayidx8.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv67
  %3 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %2, %3
  %sub47.us.prol = fsub double %.pre49, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.body33.us.prol, %for.cond31.preheader.us
  %indvars.iv60.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr77.ph = phi double [ %sub47.us.prol, %for.body33.us.prol ], [ %.pre49, %for.cond31.preheader.us ]
  br i1 %1, label %for.cond31.for.inc51_crit_edge.us, label %for.body33.us.preheader

for.body33.us.preheader:                          ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us.preheader, %for.body33.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.1, %for.body33.us ], [ %indvars.iv60.unr.ph, %for.body33.us.preheader ]
  %4 = phi double [ %sub47.us.1, %for.body33.us ], [ %.unr77.ph, %for.body33.us.preheader ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv60
  %5 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv67
  %6 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %5, %6
  %sub47.us = fsub double %4, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv.next61
  %7 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next61, i64 %indvars.iv67
  %8 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %7, %8
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next61.1 = add nuw nsw i64 %indvars.iv60, 2
  %exitcond64.1 = icmp eq i64 %indvars.iv.next61.1, %indvars.iv71
  br i1 %exitcond64.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.body33.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.body33.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.cond31.for.inc51_crit_edge.us.loopexit, %for.body33.us.prol.loopexit
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, 2000
  br i1 %exitcond70, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %cmp536 = icmp sgt i64 %indvars.iv53, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv53
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp536, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv53, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit, label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.lr.ph
  %9 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv53
  %10 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol, %for.body6.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ %.pre, %for.body6.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ undef, %for.body6.lr.ph ]
  %11 = icmp eq i64 %indvars.iv53, 1
  br i1 %11, label %for.end, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6.preheader, %for.body6
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6 ], [ %indvars.iv.unr.ph, %for.body6.preheader ]
  %12 = phi double [ %sub.1, %for.body6 ], [ %.unr.ph, %for.body6.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv
  %13 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv53
  %14 = load double, double* %arrayidx12, align 8
  %mul = fmul double %13, %14
  %sub = fsub double %12, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv53
  %16 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %15, %16
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv53
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond4.preheader, %for.body6.prol.loopexit
  %17 = phi double [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit ], [ %.pre, %for.cond4.preheader ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv53
  %18 = load double, double* %arrayidx20, align 8
  %div = fdiv double %17, %18
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next54, %indvars.iv71
  br i1 %exitcond58, label %for.cond31.preheader.us.preheader, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next72, 2000
  br i1 %exitcond74, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next15, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv14, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, 2000
  br i1 %exitcond18, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
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
