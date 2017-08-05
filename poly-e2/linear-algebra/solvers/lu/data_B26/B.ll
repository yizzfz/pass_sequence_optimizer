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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %arraydecay)
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
  tail call fastcc void @print_array([2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.body3.lr.ph.backedge, %entry
  %indvars.iv48 = phi i64 [ 0, %entry ], [ %indvars.iv.next49, %for.body3.lr.ph.backedge ]
  %indvars.iv46 = phi i64 [ 1, %entry ], [ %indvars.iv46.be, %for.body3.lr.ph.backedge ]
  %0 = mul nuw nsw i64 %indvars.iv48, 2001
  %1 = add nuw nsw i64 %0, 1
  %scevgep44 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %1
  %2 = sub i64 1998, %indvars.iv48
  %3 = shl i64 %2, 3
  %4 = and i64 %3, 34359738360
  br label %for.body3

for.cond8.preheader:                              ; preds = %for.body3
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %cmp911 = icmp slt i64 %indvars.iv.next49, 2000
  br i1 %cmp911, label %for.end18.thread, label %for.end18

for.end18.thread:                                 ; preds = %for.cond8.preheader
  %5 = add nuw nsw i64 %4, 8
  %scevgep4445 = bitcast double* %scevgep44 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep4445, i8 0, i64 %5, i32 8, i1 false)
  %arrayidx2251 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv48
  store double 1.000000e+00, double* %arrayidx2251, align 8
  br label %for.body3.lr.ph.backedge

for.body3.lr.ph.backedge:                         ; preds = %for.end18, %for.end18.thread
  %indvars.iv46.be = add nuw nsw i64 %indvars.iv46, 1
  br label %for.body3.lr.ph

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv33 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next34, %for.body3 ]
  %6 = sub nsw i64 0, %indvars.iv33
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv33
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next34, %indvars.iv46
  br i1 %exitcond38, label %for.cond8.preheader, label %for.body3

for.end18:                                        ; preds = %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv48
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond50 = icmp eq i64 %indvars.iv.next49, 2000
  br i1 %exitcond50, label %for.end25, label %for.body3.lr.ph.backedge

for.end25:                                        ; preds = %for.end18
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %8 = bitcast i8* %call to [2000 x [2000 x double]]*
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 32000000, i32 8, i1 false)
  br label %for.cond48.preheader

for.cond48.preheader:                             ; preds = %for.end74, %for.end25
  %indvars.iv24 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next25, %for.end74 ]
  br label %for.cond52.preheader

for.cond52.preheader:                             ; preds = %for.end71, %for.cond48.preheader
  %indvars.iv21 = phi i64 [ 0, %for.cond48.preheader ], [ %indvars.iv.next22, %for.end71 ]
  %arrayidx59 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv24
  br label %for.body55

for.body55:                                       ; preds = %for.body55, %for.cond52.preheader
  %indvars.iv18 = phi i64 [ 0, %for.cond52.preheader ], [ %indvars.iv.next19.1, %for.body55 ]
  %9 = load double, double* %arrayidx59, align 8
  %arrayidx63 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv24
  %10 = load double, double* %arrayidx63, align 8
  %mul = fmul double %9, %10
  %arrayidx67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv21, i64 %indvars.iv18
  %11 = load double, double* %arrayidx67, align 8
  %add68 = fadd double %11, %mul
  store double %add68, double* %arrayidx67, align 8
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %12 = load double, double* %arrayidx59, align 8
  %arrayidx63.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next19, i64 %indvars.iv24
  %13 = load double, double* %arrayidx63.1, align 8
  %mul.1 = fmul double %12, %13
  %arrayidx67.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv21, i64 %indvars.iv.next19
  %14 = load double, double* %arrayidx67.1, align 8
  %add68.1 = fadd double %14, %mul.1
  store double %add68.1, double* %arrayidx67.1, align 8
  %indvars.iv.next19.1 = add nuw nsw i64 %indvars.iv18, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next19.1, 2000
  br i1 %exitcond20.1, label %for.end71, label %for.body55

for.end71:                                        ; preds = %for.body55
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond23, label %for.end74, label %for.cond52.preheader

for.end74:                                        ; preds = %for.end71
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 2000
  br i1 %exitcond26, label %for.cond82.preheader.preheader, label %for.cond48.preheader

for.cond82.preheader.preheader:                   ; preds = %for.end74
  br label %for.cond82.preheader

for.cond82.preheader:                             ; preds = %for.cond82.preheader.preheader, %for.end96
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.end96 ], [ 0, %for.cond82.preheader.preheader ]
  br label %for.body85

for.body85:                                       ; preds = %for.body85, %for.cond82.preheader
  %indvars.iv = phi i64 [ 0, %for.cond82.preheader ], [ %indvars.iv.next.4, %for.body85 ]
  %arrayidx89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv15, i64 %indvars.iv
  %15 = bitcast double* %arrayidx89 to i64*
  %16 = load i64, i64* %15, align 8
  %arrayidx93 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  %17 = bitcast double* %arrayidx93 to i64*
  store i64 %16, i64* %17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv15, i64 %indvars.iv.next
  %18 = bitcast double* %arrayidx89.1 to i64*
  %19 = load i64, i64* %18, align 8
  %arrayidx93.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next
  %20 = bitcast double* %arrayidx93.1 to i64*
  store i64 %19, i64* %20, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv15, i64 %indvars.iv.next.1
  %21 = bitcast double* %arrayidx89.2 to i64*
  %22 = load i64, i64* %21, align 8
  %arrayidx93.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next.1
  %23 = bitcast double* %arrayidx93.2 to i64*
  store i64 %22, i64* %23, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv15, i64 %indvars.iv.next.2
  %24 = bitcast double* %arrayidx89.3 to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx93.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next.2
  %26 = bitcast double* %arrayidx93.3 to i64*
  store i64 %25, i64* %26, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv15, i64 %indvars.iv.next.3
  %27 = bitcast double* %arrayidx89.4 to i64*
  %28 = load i64, i64* %27, align 8
  %arrayidx93.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next.3
  %29 = bitcast double* %arrayidx93.4 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.end96, label %for.body85

for.end96:                                        ; preds = %for.body85
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond17, label %for.end99, label %for.cond82.preheader

for.end99:                                        ; preds = %for.end96
  tail call void @free(i8* nonnull %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end53, %entry
  %indvars.iv37 = phi i64 [ 0, %entry ], [ %indvars.iv.next38, %for.end53 ]
  %cmp27 = icmp sgt i64 %indvars.iv37, 0
  br i1 %cmp27, label %for.cond4.preheader.preheader, label %for.end53

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 0
  br label %for.cond4.preheader

for.body33.lr.ph.us.preheader:                    ; preds = %for.end
  %xtraiter41 = and i64 %indvars.iv37, 1
  %lcmp.mod42 = icmp eq i64 %xtraiter41, 0
  %0 = icmp eq i64 %indvars.iv37, 1
  br label %for.body33.lr.ph.us

for.body33.lr.ph.us:                              ; preds = %for.end50.us, %for.body33.lr.ph.us.preheader
  %indvars.iv33 = phi i64 [ %indvars.iv37, %for.body33.lr.ph.us.preheader ], [ %indvars.iv.next34, %for.end50.us ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv33
  br i1 %lcmp.mod42, label %for.body33.us.prol.loopexit.unr-lcssa, label %for.body33.us.prol.preheader

for.body33.us.prol.preheader:                     ; preds = %for.body33.lr.ph.us
  %1 = load double, double* %arrayidx8.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv33
  %2 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %1, %2
  %3 = load double, double* %arrayidx46.us, align 8
  %sub47.us.prol = fsub double %3, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.body33.us.prol.loopexit.unr-lcssa

for.body33.us.prol.loopexit.unr-lcssa:            ; preds = %for.body33.lr.ph.us, %for.body33.us.prol.preheader
  %indvars.iv26.unr.ph = phi i64 [ 1, %for.body33.us.prol.preheader ], [ 0, %for.body33.lr.ph.us ]
  br i1 %0, label %for.end50.us, label %for.body33.lr.ph.us.new

for.body33.lr.ph.us.new:                          ; preds = %for.body33.us.prol.loopexit.unr-lcssa
  %.pre43 = load double, double* %arrayidx46.us, align 8
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us, %for.body33.lr.ph.us.new
  %4 = phi double [ %.pre43, %for.body33.lr.ph.us.new ], [ %sub47.us.1, %for.body33.us ]
  %indvars.iv26 = phi i64 [ %indvars.iv26.unr.ph, %for.body33.lr.ph.us.new ], [ %indvars.iv.next27.1, %for.body33.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv26
  %5 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv26, i64 %indvars.iv33
  %6 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %5, %6
  %sub47.us = fsub double %4, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.next27
  %7 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next27, i64 %indvars.iv33
  %8 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %7, %8
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next27.1 = add nuw nsw i64 %indvars.iv26, 2
  %exitcond30.1 = icmp eq i64 %indvars.iv.next27.1, %indvars.iv37
  br i1 %exitcond30.1, label %for.end50.us.loopexit, label %for.body33.us

for.end50.us.loopexit:                            ; preds = %for.body33.us
  br label %for.end50.us

for.end50.us:                                     ; preds = %for.end50.us.loopexit, %for.body33.us.prol.loopexit.unr-lcssa
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, 2000
  br i1 %exitcond, label %for.end53.loopexit, label %for.body33.lr.ph.us

for.cond4.preheader:                              ; preds = %for.end, %for.cond4.preheader.preheader
  %indvars.iv19 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next20, %for.end ]
  %cmp55 = icmp sgt i64 %indvars.iv19, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv19
  br i1 %cmp55, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv19, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit.unr-lcssa, label %for.body6.prol.preheader

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  %9 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv19
  %10 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %9, %10
  %11 = load double, double* %arrayidx16, align 8
  %sub.prol = fsub double %11, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.lr.ph, %for.body6.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol.preheader ], [ 0, %for.body6.lr.ph ]
  %12 = icmp eq i64 %indvars.iv19, 1
  br i1 %12, label %for.end, label %for.body6.lr.ph.new

for.body6.lr.ph.new:                              ; preds = %for.body6.prol.loopexit.unr-lcssa
  %.pre = load double, double* %arrayidx16, align 8
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.new
  %13 = phi double [ %.pre, %for.body6.lr.ph.new ], [ %sub.1, %for.body6 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.lr.ph.new ], [ %indvars.iv.next.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv
  %14 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv19
  %15 = load double, double* %arrayidx12, align 8
  %mul = fmul double %14, %15
  %sub = fsub double %13, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.next
  %16 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv19
  %17 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %16, %17
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv19
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body6.prol.loopexit.unr-lcssa, %for.cond4.preheader
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv19
  %18 = load double, double* %arrayidx20, align 8
  %19 = load double, double* %arrayidx16, align 8
  %div = fdiv double %19, %18
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next20, %indvars.iv37
  br i1 %exitcond24, label %for.body33.lr.ph.us.preheader, label %for.cond4.preheader

for.end53.loopexit:                               ; preds = %for.end50.us
  br label %for.end53

for.end53:                                        ; preds = %for.end53.loopexit, %for.cond1.preheader
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next38, 2000
  br i1 %exitcond45, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.end53
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body4.lr.ph.us

for.body4.lr.ph.us:                               ; preds = %for.end.us, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.end.us ]
  %3 = mul nsw i64 %indvars.iv8, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body4.lr.ph.us
  %indvars.iv = phi i64 [ 0, %for.body4.lr.ph.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond13, label %for.end.us, label %for.body4.us

for.end.us:                                       ; preds = %if.end.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond12, label %for.end12, label %for.body4.lr.ph.us

for.end12:                                        ; preds = %for.end.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
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
