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
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.end18.for.body3.lr.ph_crit_edge, %entry
  %indvars.iv88 = phi i64 [ 0, %entry ], [ %indvars.iv.next89, %for.end18.for.body3.lr.ph_crit_edge ]
  %indvars.iv86 = phi i64 [ 1, %entry ], [ %indvars.iv.next87, %for.end18.for.body3.lr.ph_crit_edge ]
  br label %for.body3

for.cond8.preheader:                              ; preds = %for.body3
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %cmp942 = icmp slt i64 %indvars.iv.next89, 2000
  br i1 %cmp942, label %for.end18.loopexit, label %for.end18

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv70 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next71, %for.body3 ]
  %0 = sub nsw i64 0, %indvars.iv70
  %1 = trunc i64 %0 to i32
  %rem = srem i32 %1, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv88, i64 %indvars.iv70
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next71, %indvars.iv86
  br i1 %exitcond76, label %for.cond8.preheader, label %for.body3

for.end18.loopexit:                               ; preds = %for.cond8.preheader
  %2 = sub i64 1998, %indvars.iv88
  %3 = shl i64 %2, 3
  %4 = and i64 %3, 34359738360
  %5 = add nuw nsw i64 %4, 8
  %scevgep83 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv.next89
  %6 = mul nuw nsw i64 %indvars.iv88, 2000
  %scevgep84 = getelementptr double, double* %scevgep83, i64 %6
  %scevgep8485 = bitcast double* %scevgep84 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8485, i8 0, i64 %5, i32 8, i1 false)
  br label %for.end18

for.end18:                                        ; preds = %for.cond8.preheader, %for.end18.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv88, i64 %indvars.iv88
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond91 = icmp eq i64 %indvars.iv.next89, 2000
  br i1 %exitcond91, label %for.end25, label %for.end18.for.body3.lr.ph_crit_edge

for.end18.for.body3.lr.ph_crit_edge:              ; preds = %for.end18
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  br label %for.body3.lr.ph

for.end25:                                        ; preds = %for.end18
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.cond30.for.end40_crit_edge.us

for.cond30.for.end40_crit_edge.us:                ; preds = %for.cond30.for.end40_crit_edge.us.for.cond30.for.end40_crit_edge.us_crit_edge, %for.end25
  %indvars.iv66 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next67, %for.cond30.for.end40_crit_edge.us.for.cond30.for.end40_crit_edge.us_crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv66, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %7
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %exitcond93 = icmp eq i64 %indvars.iv66, 1999
  br i1 %exitcond93, label %for.cond52.preheader.us.us.preheader.preheader, label %for.cond30.for.end40_crit_edge.us.for.cond30.for.end40_crit_edge.us_crit_edge

for.cond52.preheader.us.us.preheader.preheader:   ; preds = %for.cond30.for.end40_crit_edge.us
  %8 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond52.preheader.us.us.preheader

for.cond30.for.end40_crit_edge.us.for.cond30.for.end40_crit_edge.us_crit_edge: ; preds = %for.cond30.for.end40_crit_edge.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  br label %for.cond30.for.end40_crit_edge.us

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond52.preheader.us.us.preheader.preheader, %for.cond48.for.end74_crit_edge.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.cond48.for.end74_crit_edge.us ], [ 0, %for.cond52.preheader.us.us.preheader.preheader ]
  br label %for.cond52.preheader.us.us

for.cond48.for.end74_crit_edge.us:                ; preds = %for.cond52.for.end71_crit_edge.us.us
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next59, 2000
  br i1 %exitcond104, label %for.cond82.preheader.us.preheader, label %for.cond52.preheader.us.us.preheader

for.cond82.preheader.us.preheader:                ; preds = %for.cond48.for.end74_crit_edge.us
  br label %for.cond82.preheader.us

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.end71_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv54 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next55, %for.cond52.for.end71_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv58
  br label %for.body55.us.us

for.cond52.for.end71_crit_edge.us.us:             ; preds = %for.body55.us.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next55, 2000
  br i1 %exitcond103, label %for.cond48.for.end74_crit_edge.us, label %for.cond52.preheader.us.us

for.body55.us.us:                                 ; preds = %for.body55.us.us.for.body55.us.us_crit_edge, %for.cond52.preheader.us.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.body55.us.us.for.body55.us.us_crit_edge ], [ 0, %for.cond52.preheader.us.us ]
  %9 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv58
  %10 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %9, %10
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv54, i64 %indvars.iv50
  %11 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %11, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %exitcond = icmp eq i64 %indvars.iv50, 1999
  br i1 %exitcond, label %for.cond52.for.end71_crit_edge.us.us, label %for.body55.us.us.for.body55.us.us_crit_edge

for.body55.us.us.for.body55.us.us_crit_edge:      ; preds = %for.body55.us.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  br label %for.body55.us.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.end96_crit_edge.us.1, %for.cond82.preheader.us.preheader
  %indvars.iv46 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next47.1, %for.cond82.for.end96_crit_edge.us.1 ]
  br label %for.body85.us

for.body85.us:                                    ; preds = %for.body85.us.for.body85.us_crit_edge, %for.cond82.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond82.preheader.us ], [ %indvars.iv.next, %for.body85.us.for.body85.us_crit_edge ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv46, i64 %indvars.iv
  %12 = bitcast double* %arrayidx89.us to i64*
  %13 = load i64, i64* %12, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv
  %14 = bitcast double* %arrayidx93.us to i64*
  store i64 %13, i64* %14, align 8
  %exitcond92 = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond92, label %for.cond82.for.end96_crit_edge.us, label %for.body85.us.for.body85.us_crit_edge

for.body85.us.for.body85.us_crit_edge:            ; preds = %for.body85.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body85.us

for.cond82.for.end96_crit_edge.us:                ; preds = %for.body85.us
  %indvars.iv.next47 = or i64 %indvars.iv46, 1
  br label %for.body85.us.1

for.end99:                                        ; preds = %for.cond82.for.end96_crit_edge.us.1
  tail call void @free(i8* %call) #4
  ret void

for.body85.us.1:                                  ; preds = %for.body85.us.for.body85.us_crit_edge.1, %for.cond82.for.end96_crit_edge.us
  %indvars.iv.1 = phi i64 [ 0, %for.cond82.for.end96_crit_edge.us ], [ %indvars.iv.next.1, %for.body85.us.for.body85.us_crit_edge.1 ]
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv.next47, i64 %indvars.iv.1
  %15 = bitcast double* %arrayidx89.us.1 to i64*
  %16 = load i64, i64* %15, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next47, i64 %indvars.iv.1
  %17 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %16, i64* %17, align 8
  %exitcond92.1 = icmp eq i64 %indvars.iv.1, 1999
  br i1 %exitcond92.1, label %for.cond82.for.end96_crit_edge.us.1, label %for.body85.us.for.body85.us_crit_edge.1

for.body85.us.for.body85.us_crit_edge.1:          ; preds = %for.body85.us.1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  br label %for.body85.us.1

for.cond82.for.end96_crit_edge.us.1:              ; preds = %for.body85.us.1
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %exitcond102.1 = icmp eq i64 %indvars.iv.next47.1, 2000
  br i1 %exitcond102.1, label %for.end99, label %for.cond82.preheader.us
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end53, %entry
  %indvars.iv39 = phi i64 [ 0, %entry ], [ %indvars.iv.next40, %for.end53 ]
  %cmp26 = icmp sgt i64 %indvars.iv39, 0
  br i1 %cmp26, label %for.cond4.preheader.preheader, label %for.end53

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.end50_crit_edge.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %for.cond31.for.end50_crit_edge.us ], [ %indvars.iv39, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv35
  %.pre17 = load double, double* %arrayidx46.us, align 8
  br i1 %lcmp.mod46, label %for.body33.us.prol.loopexit.unr-lcssa, label %for.body33.us.prol.preheader

for.body33.us.prol.preheader:                     ; preds = %for.cond31.preheader.us
  br label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.body33.us.prol.preheader
  %0 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv35
  %1 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %0, %1
  %sub47.us.prol = fsub double %.pre17, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.body33.us.prol.loopexit.unr-lcssa

for.body33.us.prol.loopexit.unr-lcssa:            ; preds = %for.cond31.preheader.us, %for.body33.us.prol
  %indvars.iv28.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr47.ph = phi double [ %sub47.us.prol, %for.body33.us.prol ], [ %.pre17, %for.cond31.preheader.us ]
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.body33.us.prol.loopexit.unr-lcssa
  br i1 %17, label %for.cond31.for.end50_crit_edge.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us, %for.cond31.preheader.us.new
  %indvars.iv28 = phi i64 [ %indvars.iv28.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next29.1, %for.body33.us ]
  %2 = phi double [ %.unr47.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.body33.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv28
  %3 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv35
  %4 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %3, %4
  %sub47.us = fsub double %2, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv.next29
  %5 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next29, i64 %indvars.iv35
  %6 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %5, %6
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next29.1, %indvars.iv39
  br i1 %exitcond32.1, label %for.cond31.for.end50_crit_edge.us.unr-lcssa, label %for.body33.us

for.cond31.for.end50_crit_edge.us.unr-lcssa:      ; preds = %for.body33.us
  br label %for.cond31.for.end50_crit_edge.us

for.cond31.for.end50_crit_edge.us:                ; preds = %for.body33.us.prol.loopexit, %for.cond31.for.end50_crit_edge.us.unr-lcssa
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next36, 2000
  br i1 %exitcond43, label %for.end53.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %cmp55 = icmp sgt i64 %indvars.iv21, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv21
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp55, label %for.body6.preheader, label %for.end

for.body6.preheader:                              ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv21, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit.unr-lcssa, label %for.body6.prol.preheader

for.body6.prol.preheader:                         ; preds = %for.body6.preheader
  br label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.prol.preheader
  %7 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv21
  %8 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %7, %8
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.preheader, %for.body6.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ undef, %for.body6.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ %.pre, %for.body6.preheader ]
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol.loopexit.unr-lcssa
  %9 = icmp eq i64 %indvars.iv21, 1
  br i1 %9, label %for.end.loopexit, label %for.body6.preheader.new

for.body6.preheader.new:                          ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.preheader.new ], [ %indvars.iv.next.1, %for.body6 ]
  %10 = phi double [ %.unr.ph, %for.body6.preheader.new ], [ %sub.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv
  %11 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv21
  %12 = load double, double* %arrayidx12, align 8
  %mul = fmul double %11, %12
  %sub = fsub double %10, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv.next
  %13 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv21
  %14 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %13, %14
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv21
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body6

for.end.loopexit.unr-lcssa:                       ; preds = %for.body6
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body6.prol.loopexit, %for.end.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit ], [ %sub.1, %for.end.loopexit.unr-lcssa ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond4.preheader
  %15 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv21
  %16 = load double, double* %arrayidx20, align 8
  %div = fdiv double %15, %16
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next22, %indvars.iv39
  br i1 %exitcond26, label %for.cond31.preheader.us.preheader, label %for.cond4.preheader

for.cond31.preheader.us.preheader:                ; preds = %for.end
  %xtraiter45 = and i64 %indvars.iv39, 1
  %lcmp.mod46 = icmp eq i64 %xtraiter45, 0
  %17 = icmp eq i64 %indvars.iv39, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 0
  br label %for.cond31.preheader.us

for.end53.loopexit:                               ; preds = %for.cond31.for.end50_crit_edge.us
  br label %for.end53

for.end53:                                        ; preds = %for.end53.loopexit, %for.cond1.preheader
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next40, 2000
  br i1 %exitcond44, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.end53
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.end_crit_edge.us, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.cond2.for.end_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv7, 2000
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

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond12, label %for.cond2.for.end_crit_edge.us, label %for.body4.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.end_crit_edge.us
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
