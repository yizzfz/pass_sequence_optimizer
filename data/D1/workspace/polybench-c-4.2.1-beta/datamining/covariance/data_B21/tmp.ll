; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1400, double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #3
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, double*, [1200 x double]*) unnamed_addr #0 {
  store double 1.400000e+03, double* %1, align 8
  br label %.preheader

.preheader:                                       ; preds = %19, %3
  %indvars.iv5 = phi i64 [ 0, %3 ], [ %indvars.iv.next6, %19 ]
  %4 = trunc i64 %indvars.iv5 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  %11 = trunc i64 %indvars.iv to i32
  %12 = or i32 %11, 1
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %15, %7
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1400
  br i1 %exitcond7, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
  br i1 true, label %.lr.ph53, label %.preheader9

.lr.ph53:                                         ; preds = %6
  br i1 true, label %.lr.ph53.split.us.preheader, label %.lr.ph53..lr.ph53.split_crit_edge

.lr.ph53..lr.ph53.split_crit_edge:                ; preds = %.lr.ph53
  br i1 false, label %.lr.ph53.split.preheader, label %min.iters.checked

.lr.ph53.split.preheader:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph53..lr.ph53.split_crit_edge
  %indvars.iv98.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph53..lr.ph53.split_crit_edge ], [ 1200, %middle.block ]
  br label %.lr.ph53.split

min.iters.checked:                                ; preds = %.lr.ph53..lr.ph53.split_crit_edge
  br i1 false, label %.lr.ph53.split.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert151 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat152 = shufflevector <2 x double> %broadcast.splatinsert151, <2 x double> undef, <2 x i32> zeroinitializer
  br i1 false, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %7 = bitcast double* %5 to <2 x double>*
  %8 = fdiv <2 x double> zeroinitializer, %broadcast.splat152
  store <2 x double> %8, <2 x double>* %7, align 8
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ 2, %vector.body.prol ]
  br i1 false, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %9 = shl i64 %index, 32
  %10 = ashr exact i64 %9, 32
  %11 = getelementptr inbounds double, double* %5, i64 %10
  %12 = bitcast double* %11 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %12, align 8
  %13 = getelementptr inbounds double, double* %5, i64 %index
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %14, align 8
  %15 = fdiv <2 x double> %wide.load, %broadcast.splat152
  store <2 x double> %15, <2 x double>* %14, align 8
  %index.next = add i64 %index, 2
  %16 = shl i64 %index.next, 32
  %17 = ashr exact i64 %16, 32
  %18 = getelementptr inbounds double, double* %5, i64 %17
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %20 = getelementptr inbounds double, double* %5, i64 %index.next
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %21, align 8
  %22 = fdiv <2 x double> %wide.load.1, %broadcast.splat152
  store <2 x double> %22, <2 x double>* %21, align 8
  %index.next.1 = add i64 %index, 4
  %23 = icmp eq i64 %index.next.1, 1200
  br i1 %23, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !1

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 true, label %.preheader9, label %.lr.ph53.split.preheader

.lr.ph53.split.us.preheader:                      ; preds = %.lr.ph53
  %sunkaddr203 = ptrtoint double* %5 to i64
  %sunkaddr211 = ptrtoint double* %5 to i64
  %sunkaddr207 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr199 = ptrtoint double* %5 to i64
  br label %.lr.ph53.split.us

.lr.ph53.split.us:                                ; preds = %._crit_edge48.us, %.lr.ph53.split.us.preheader
  %indvars.iv95 = phi i64 [ 0, %.lr.ph53.split.us.preheader ], [ %indvars.iv.next96, %._crit_edge48.us ]
  %sext116 = shl i64 %indvars.iv95, 32
  %24 = ashr exact i64 %sext116, 32
  %25 = getelementptr inbounds double, double* %5, i64 %24
  store double 0.000000e+00, double* %25, align 8
  br i1 true, label %.prol.loopexit112, label %.lr.ph53.split.us..prol.preheader111_crit_edge

.lr.ph53.split.us..prol.preheader111_crit_edge:   ; preds = %.lr.ph53.split.us
  %sunkaddr196 = shl i64 %indvars.iv95, 3
  %sunkaddr197 = add i64 %sunkaddr, %sunkaddr196
  %sunkaddr198 = inttoptr i64 %sunkaddr197 to double*
  %.pre = load double, double* %sunkaddr198, align 8
  %sunkaddr200 = shl i64 %indvars.iv95, 3
  %sunkaddr201 = add i64 %sunkaddr199, %sunkaddr200
  %sunkaddr202 = inttoptr i64 %sunkaddr201 to double*
  br label %.prol.preheader111

.prol.preheader111:                               ; preds = %.prol.preheader111, %.lr.ph53.split.us..prol.preheader111_crit_edge
  %26 = phi double [ %.pre, %.lr.ph53.split.us..prol.preheader111_crit_edge ], [ %29, %.prol.preheader111 ]
  %indvars.iv91.prol = phi i64 [ 0, %.lr.ph53.split.us..prol.preheader111_crit_edge ], [ %indvars.iv.next92.prol, %.prol.preheader111 ]
  %prol.iter115 = phi i64 [ 0, %.lr.ph53.split.us..prol.preheader111_crit_edge ], [ %prol.iter115.sub, %.prol.preheader111 ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv91.prol, i64 %indvars.iv95
  %28 = load double, double* %27, align 8
  %29 = fadd double %28, %26
  store double %29, double* %sunkaddr202, align 8
  %indvars.iv.next92.prol = add nuw nsw i64 %indvars.iv91.prol, 1
  %prol.iter115.sub = add i64 %prol.iter115, -1
  %prol.iter115.cmp = icmp eq i64 %prol.iter115.sub, 0
  br i1 %prol.iter115.cmp, label %.prol.loopexit112.loopexit, label %.prol.preheader111, !llvm.loop !4

.prol.loopexit112.loopexit:                       ; preds = %.prol.preheader111
  br label %.prol.loopexit112

.prol.loopexit112:                                ; preds = %.prol.loopexit112.loopexit, %.lr.ph53.split.us
  %indvars.iv91.unr = phi i64 [ 0, %.lr.ph53.split.us ], [ %indvars.iv.next92.prol, %.prol.loopexit112.loopexit ]
  %sunkaddr204 = shl i64 %indvars.iv95, 3
  %sunkaddr205 = add i64 %sunkaddr203, %sunkaddr204
  %sunkaddr206 = inttoptr i64 %sunkaddr205 to double*
  %.pre118 = load double, double* %sunkaddr206, align 8
  br i1 false, label %._crit_edge48.us, label %.lr.ph53.split.us.new.preheader

.lr.ph53.split.us.new.preheader:                  ; preds = %.prol.loopexit112
  %sunkaddr208 = shl i64 %indvars.iv95, 3
  %sunkaddr209 = add i64 %sunkaddr207, %sunkaddr208
  %sunkaddr210 = inttoptr i64 %sunkaddr209 to double*
  br label %.lr.ph53.split.us.new

.lr.ph53.split.us.new:                            ; preds = %.lr.ph53.split.us.new.preheader, %.lr.ph53.split.us.new
  %30 = phi double [ %42, %.lr.ph53.split.us.new ], [ %.pre118, %.lr.ph53.split.us.new.preheader ]
  %indvars.iv91 = phi i64 [ %indvars.iv.next92.3, %.lr.ph53.split.us.new ], [ %indvars.iv91.unr, %.lr.ph53.split.us.new.preheader ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv91, i64 %indvars.iv95
  %32 = load double, double* %31, align 8
  %33 = fadd double %32, %30
  store double %33, double* %sunkaddr210, align 8
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next92, i64 %indvars.iv95
  %35 = load double, double* %34, align 8
  %36 = fadd double %35, %33
  store double %36, double* %sunkaddr210, align 8
  %indvars.iv.next92.1 = add nsw i64 %indvars.iv91, 2
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next92.1, i64 %indvars.iv95
  %38 = load double, double* %37, align 8
  %39 = fadd double %38, %36
  store double %39, double* %sunkaddr210, align 8
  %indvars.iv.next92.2 = add nsw i64 %indvars.iv91, 3
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next92.2, i64 %indvars.iv95
  %41 = load double, double* %40, align 8
  %42 = fadd double %41, %39
  store double %42, double* %sunkaddr210, align 8
  %indvars.iv.next92.3 = add nsw i64 %indvars.iv91, 4
  %exitcond94.3 = icmp eq i64 %indvars.iv.next92.3, 1400
  br i1 %exitcond94.3, label %._crit_edge48.us.loopexit, label %.lr.ph53.split.us.new

._crit_edge48.us.loopexit:                        ; preds = %.lr.ph53.split.us.new
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge48.us.loopexit, %.prol.loopexit112
  %43 = phi double [ %.pre118, %.prol.loopexit112 ], [ %42, %._crit_edge48.us.loopexit ]
  %44 = fdiv double %43, %2
  %sunkaddr212 = shl i64 %indvars.iv95, 3
  %sunkaddr213 = add i64 %sunkaddr211, %sunkaddr212
  %sunkaddr214 = inttoptr i64 %sunkaddr213 to double*
  store double %44, double* %sunkaddr214, align 8
  %indvars.iv.next96 = add nsw i64 %indvars.iv95, 1
  %45 = icmp slt i64 %indvars.iv.next96, 1200
  br i1 %45, label %.lr.ph53.split.us, label %.preheader9.loopexit

.preheader9.loopexit:                             ; preds = %._crit_edge48.us
  br label %.preheader9

.preheader9.loopexit216:                          ; preds = %.lr.ph53.split
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit216, %.preheader9.loopexit, %middle.block, %6
  br i1 true, label %.preheader8.us.preheader, label %.preheader7

.preheader8.us.preheader:                         ; preds = %.preheader9
  %scevgep169 = getelementptr double, double* %5, i64 4
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge38.us, %.preheader8.us.preheader
  %indvars.iv89 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next90, %._crit_edge38.us ]
  %scevgep164 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 4
  br i1 true, label %.prol.loopexit108, label %.prol.preheader107.preheader

.prol.preheader107.preheader:                     ; preds = %.preheader8.us
  br label %.prol.preheader107

.prol.preheader107:                               ; preds = %.prol.preheader107.preheader, %.prol.preheader107
  %indvars.iv85.prol = phi i64 [ %indvars.iv.next86.prol, %.prol.preheader107 ], [ 0, %.prol.preheader107.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader107 ], [ 0, %.prol.preheader107.preheader ]
  %46 = getelementptr inbounds double, double* %5, i64 %indvars.iv85.prol
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv85.prol
  %49 = load double, double* %48, align 8
  %50 = fsub double %49, %47
  store double %50, double* %48, align 8
  %indvars.iv.next86.prol = add nuw nsw i64 %indvars.iv85.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit108.loopexit, label %.prol.preheader107, !llvm.loop !6

.prol.loopexit108.loopexit:                       ; preds = %.prol.preheader107
  br label %.prol.loopexit108

.prol.loopexit108:                                ; preds = %.prol.loopexit108.loopexit, %.preheader8.us
  %indvars.iv85.unr = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next86.prol, %.prol.loopexit108.loopexit ]
  br i1 false, label %._crit_edge38.us, label %.prol.loopexit108..preheader8.us.new_crit_edge

.prol.loopexit108..preheader8.us.new_crit_edge:   ; preds = %.prol.loopexit108
  %51 = sub i64 1196, %indvars.iv85.unr
  %52 = lshr i64 %51, 2
  %53 = add nuw nsw i64 %52, 1
  %min.iters.check156 = icmp ult i64 %53, 2
  br i1 %min.iters.check156, label %.preheader8.us.new.preheader, label %min.iters.checked157

min.iters.checked157:                             ; preds = %.prol.loopexit108..preheader8.us.new_crit_edge
  %n.mod.vf158 = and i64 %53, 1
  %n.vec159 = sub nsw i64 %53, %n.mod.vf158
  %cmp.zero160 = icmp eq i64 %n.vec159, 0
  br i1 %cmp.zero160, label %.preheader8.us.new.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked157
  %scevgep162 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv85.unr
  %54 = and i64 %51, -4
  %55 = add i64 %indvars.iv85.unr, %54
  %scevgep165 = getelementptr double, double* %scevgep164, i64 %55
  %scevgep167 = getelementptr double, double* %5, i64 %indvars.iv85.unr
  %scevgep170 = getelementptr double, double* %scevgep169, i64 %55
  %bound0 = icmp ult double* %scevgep162, %scevgep170
  %bound1 = icmp ult double* %scevgep167, %scevgep165
  %memcheck.conflict = and i1 %bound0, %bound1
  %56 = add i64 %indvars.iv85.unr, 4
  %57 = shl nuw i64 %52, 2
  %58 = add i64 %56, %57
  %59 = shl nuw nsw i64 %n.mod.vf158, 2
  %ind.end = sub i64 %58, %59
  br i1 %memcheck.conflict, label %.preheader8.us.new.preheader, label %vector.body153.preheader

vector.body153.preheader:                         ; preds = %vector.memcheck
  br label %vector.body153

vector.body153:                                   ; preds = %vector.body153.preheader, %vector.body153
  %index173 = phi i64 [ %index.next174, %vector.body153 ], [ 0, %vector.body153.preheader ]
  %60 = shl i64 %index173, 2
  %61 = add i64 %indvars.iv85.unr, %60
  %62 = getelementptr inbounds double, double* %5, i64 %61
  %63 = bitcast double* %62 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %63, align 8, !alias.scope !7
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %61
  %65 = bitcast double* %64 to <8 x double>*
  %wide.vec183 = load <8 x double>, <8 x double>* %65, align 8, !alias.scope !10, !noalias !7
  %66 = fsub <8 x double> %wide.vec183, %wide.vec
  %67 = shufflevector <8 x double> %66, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %68 = shufflevector <8 x double> %66, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %69 = shufflevector <8 x double> %66, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %70 = add nsw i64 %61, 3
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %70
  %72 = shufflevector <8 x double> %66, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %73 = getelementptr double, double* %71, i64 -3
  %74 = bitcast double* %73 to <8 x double>*
  %75 = shufflevector <2 x double> %67, <2 x double> %68, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %76 = shufflevector <2 x double> %69, <2 x double> %72, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %75, <4 x double> %76, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %74, align 8, !alias.scope !10, !noalias !7
  %index.next174 = add i64 %index173, 2
  %77 = icmp eq i64 %index.next174, %n.vec159
  br i1 %77, label %middle.block154, label %vector.body153, !llvm.loop !12

middle.block154:                                  ; preds = %vector.body153
  %cmp.n176 = icmp eq i64 %n.mod.vf158, 0
  br i1 %cmp.n176, label %._crit_edge38.us, label %.preheader8.us.new.preheader

.preheader8.us.new.preheader:                     ; preds = %middle.block154, %vector.memcheck, %min.iters.checked157, %.prol.loopexit108..preheader8.us.new_crit_edge
  %indvars.iv85.ph = phi i64 [ %indvars.iv85.unr, %vector.memcheck ], [ %indvars.iv85.unr, %min.iters.checked157 ], [ %indvars.iv85.unr, %.prol.loopexit108..preheader8.us.new_crit_edge ], [ %ind.end, %middle.block154 ]
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new.preheader, %.preheader8.us.new
  %indvars.iv85 = phi i64 [ %indvars.iv.next86.3, %.preheader8.us.new ], [ %indvars.iv85.ph, %.preheader8.us.new.preheader ]
  %78 = getelementptr inbounds double, double* %5, i64 %indvars.iv85
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv85
  %81 = load double, double* %80, align 8
  %82 = fsub double %81, %79
  store double %82, double* %80, align 8
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %83 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next86
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv.next86
  %86 = load double, double* %85, align 8
  %87 = fsub double %86, %84
  store double %87, double* %85, align 8
  %indvars.iv.next86.1 = add nsw i64 %indvars.iv85, 2
  %88 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next86.1
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv.next86.1
  %91 = load double, double* %90, align 8
  %92 = fsub double %91, %89
  store double %92, double* %90, align 8
  %indvars.iv.next86.2 = add nsw i64 %indvars.iv85, 3
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next86.2
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv89, i64 %indvars.iv.next86.2
  %96 = load double, double* %95, align 8
  %97 = fsub double %96, %94
  store double %97, double* %95, align 8
  %indvars.iv.next86.3 = add nsw i64 %indvars.iv85, 4
  %exitcond88.3 = icmp eq i64 %indvars.iv.next86.3, 1200
  br i1 %exitcond88.3, label %._crit_edge38.us.loopexit, label %.preheader8.us.new, !llvm.loop !13

._crit_edge38.us.loopexit:                        ; preds = %.preheader8.us.new
  br label %._crit_edge38.us

._crit_edge38.us:                                 ; preds = %._crit_edge38.us.loopexit, %middle.block154, %.prol.loopexit108
  %indvars.iv.next90 = add nsw i64 %indvars.iv89, 1
  %98 = icmp slt i64 %indvars.iv.next90, 1400
  br i1 %98, label %.preheader8.us, label %.preheader7.loopexit

.lr.ph53.split:                                   ; preds = %.lr.ph53.split.preheader, %.lr.ph53.split
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %.lr.ph53.split ], [ %indvars.iv98.ph, %.lr.ph53.split.preheader ]
  %sext = shl i64 %indvars.iv98, 32
  %99 = ashr exact i64 %sext, 32
  %100 = getelementptr inbounds double, double* %5, i64 %99
  store double 0.000000e+00, double* %100, align 8
  %101 = getelementptr inbounds double, double* %5, i64 %indvars.iv98
  %102 = load double, double* %101, align 8
  %103 = fdiv double %102, %2
  store double %103, double* %101, align 8
  %indvars.iv.next99 = add nsw i64 %indvars.iv98, 1
  %104 = icmp slt i64 %indvars.iv.next99, 1200
  br i1 %104, label %.lr.ph53.split, label %.preheader9.loopexit216, !llvm.loop !14

.preheader7.loopexit:                             ; preds = %._crit_edge38.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader9
  br i1 true, label %.preheader.lr.ph, label %.preheader7._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader7
  %105 = fadd double %2, -1.000000e+00
  br i1 true, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %106 = fdiv double 0.000000e+00, %105
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %sunkaddr144 = ptrtoint [1200 x double]* %3 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge13.us-lcssa.us.us, %.preheader.us.preheader
  %indvars.iv77 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next78, %._crit_edge13.us-lcssa.us.us ]
  %storemerge218.us = phi i32 [ 0, %.preheader.us.preheader ], [ %109, %._crit_edge13.us-lcssa.us.us ]
  %107 = icmp slt i32 %storemerge218.us, 1200
  br i1 %107, label %.lr.ph12.us, label %._crit_edge13.us-lcssa.us.us

._crit_edge13.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge.us.us
  br label %._crit_edge13.us-lcssa.us.us

._crit_edge13.us-lcssa.us.us:                     ; preds = %._crit_edge13.us-lcssa.us.us.loopexit, %.preheader.us
  %indvars.iv.next78 = add nsw i64 %indvars.iv77, 1
  %108 = icmp slt i64 %indvars.iv.next78, 1200
  %109 = trunc i64 %indvars.iv.next78 to i32
  br i1 %108, label %.preheader.us, label %.preheader7._crit_edge.loopexit

.lr.ph12.us:                                      ; preds = %.preheader.us
  %110 = sext i32 %storemerge218.us to i64
  %sunkaddr145 = shl i64 %indvars.iv77, 3
  %sunkaddr146 = add i64 %sunkaddr144, %sunkaddr145
  %sunkaddr147 = inttoptr i64 %sunkaddr146 to double*
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph12.us
  %indvars.iv73 = phi i64 [ %110, %.lr.ph12.us ], [ %indvars.iv.next74, %._crit_edge.us.us ]
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv73
  store double 0.000000e+00, double* %111, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %112 = load double, double* %sunkaddr147, align 8
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv73
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = fadd double %115, 0.000000e+00
  store double %116, double* %111, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %117 = phi double [ %116, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 false, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %118 = phi double [ %117, %.prol.loopexit ], [ %133, %._crit_edge.us.us.loopexit ]
  %119 = fdiv double %118, %105
  store double %119, double* %111, align 8
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv77
  store double %119, double* %120, align 8
  %indvars.iv.next74 = add nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, 1200
  br i1 %exitcond76, label %._crit_edge13.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %121 = phi double [ %133, %.lr.ph.us.us.new ], [ %117, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv77
  %123 = load double, double* %122, align 8
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv73
  %125 = load double, double* %124, align 8
  %126 = fmul double %123, %125
  %127 = fadd double %126, %121
  store double %127, double* %111, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv77
  %129 = load double, double* %128, align 8
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv73
  %131 = load double, double* %130, align 8
  %132 = fmul double %129, %131
  %133 = fadd double %132, %127
  store double %133, double* %111, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.preheader:                                       ; preds = %._crit_edge13, %.preheader.preheader
  %indvars.iv83 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next84, %._crit_edge13 ]
  %storemerge218 = phi i32 [ 0, %.preheader.preheader ], [ %150, %._crit_edge13 ]
  %134 = sub i64 1199, %indvars.iv83
  %135 = icmp slt i32 %storemerge218, 1200
  br i1 %135, label %.lr.ph12, label %._crit_edge13

.lr.ph12:                                         ; preds = %.preheader
  %136 = sub i64 1200, %indvars.iv83
  %137 = sext i32 %storemerge218 to i64
  %xtraiter = and i64 %136, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph12
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol, %._crit_edge.prol.preheader
  %indvars.iv79.prol = phi i64 [ %137, %._crit_edge.prol.preheader ], [ %indvars.iv.next80.prol, %._crit_edge.prol ]
  %prol.iter218 = phi i64 [ %xtraiter, %._crit_edge.prol.preheader ], [ %prol.iter218.sub, %._crit_edge.prol ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv83, i64 %indvars.iv79.prol
  store double %106, double* %138, align 8
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv79.prol, i64 %indvars.iv83
  store double %106, double* %139, align 8
  %indvars.iv.next80.prol = add nsw i64 %indvars.iv79.prol, 1
  %prol.iter218.sub = add i64 %prol.iter218, -1
  %prol.iter218.cmp = icmp eq i64 %prol.iter218.sub, 0
  br i1 %prol.iter218.cmp, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol, !llvm.loop !16

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %._crit_edge.prol
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %.lr.ph12, %._crit_edge.prol.loopexit.unr-lcssa
  %indvars.iv79.unr = phi i64 [ %137, %.lr.ph12 ], [ %indvars.iv.next80.prol, %._crit_edge.prol.loopexit.unr-lcssa ]
  %140 = icmp ult i64 %134, 3
  br i1 %140, label %._crit_edge13.loopexit, label %.lr.ph12.new

.lr.ph12.new:                                     ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph12.new
  %indvars.iv79 = phi i64 [ %indvars.iv79.unr, %.lr.ph12.new ], [ %indvars.iv.next80.3, %._crit_edge ]
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv83, i64 %indvars.iv79
  store double %106, double* %141, align 8
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv79, i64 %indvars.iv83
  store double %106, double* %142, align 8
  %indvars.iv.next80 = add nsw i64 %indvars.iv79, 1
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv83, i64 %indvars.iv.next80
  store double %106, double* %143, align 8
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next80, i64 %indvars.iv83
  store double %106, double* %144, align 8
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79, 2
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv83, i64 %indvars.iv.next80.1
  store double %106, double* %145, align 8
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next80.1, i64 %indvars.iv83
  store double %106, double* %146, align 8
  %indvars.iv.next80.2 = add nsw i64 %indvars.iv79, 3
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv83, i64 %indvars.iv.next80.2
  store double %106, double* %147, align 8
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next80.2, i64 %indvars.iv83
  store double %106, double* %148, align 8
  %indvars.iv.next80.3 = add nsw i64 %indvars.iv79, 4
  %exitcond82.3 = icmp eq i64 %indvars.iv.next80.3, 1200
  br i1 %exitcond82.3, label %._crit_edge13.loopexit.unr-lcssa, label %._crit_edge

._crit_edge13.loopexit.unr-lcssa:                 ; preds = %._crit_edge
  br label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge.prol.loopexit, %._crit_edge13.loopexit.unr-lcssa
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.preheader
  %indvars.iv.next84 = add nsw i64 %indvars.iv83, 1
  %149 = icmp slt i64 %indvars.iv.next84, 1200
  %150 = trunc i64 %indvars.iv.next84 to i32
  br i1 %149, label %.preheader, label %.preheader7._crit_edge.loopexit215

.preheader7._crit_edge.loopexit:                  ; preds = %._crit_edge13.us-lcssa.us.us
  br label %.preheader7._crit_edge

.preheader7._crit_edge.loopexit215:               ; preds = %._crit_edge13
  br label %.preheader7._crit_edge

.preheader7._crit_edge:                           ; preds = %.preheader7._crit_edge.loopexit215, %.preheader7._crit_edge.loopexit, %.preheader7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader.us.preheader, label %._crit_edge

.preheader.us.preheader:                          ; preds = %2
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv11, 1200
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge13 ]
  %8 = add nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge13

; <label>:12:                                     ; preds = %._crit_edge14
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge14, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge14

._crit_edge.us:                                   ; preds = %._crit_edge13
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %18 = icmp slt i64 %indvars.iv.next12, 1200
  br i1 %18, label %.preheader.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = distinct !{!6, !5}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !2, !3}
!13 = distinct !{!13, !2, !3}
!14 = distinct !{!14, !15, !2, !3}
!15 = !{!"llvm.loop.unroll.runtime.disable"}
!16 = distinct !{!16, !5}
