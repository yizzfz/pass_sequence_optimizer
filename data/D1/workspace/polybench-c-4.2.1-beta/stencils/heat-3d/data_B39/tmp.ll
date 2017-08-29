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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
.preheader19.lr.ph:
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader19.lr.ph, %._crit_edge22.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge22.us ], [ 0, %.preheader19.lr.ph ]
  %3 = trunc i64 %indvars.iv36 to i32
  %4 = add i32 %3, 120
  br label %.preheader.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 120
  br i1 %exitcond39, label %._crit_edge24, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next34, %._crit_edge.us.us ]
  %5 = trunc i64 %indvars.iv33 to i32
  %6 = add i32 %4, %5
  br label %.preheader.us.us.new

._crit_edge.us.us:                                ; preds = %.preheader.us.us.new
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, 120
  br i1 %exitcond, label %._crit_edge22.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ 0, %.preheader.us.us ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sub i32 %6, %7
  %9 = sitofp i32 %8 to double
  %10 = fmul double %9, 1.000000e+01
  %11 = fdiv double %10, 1.200000e+02
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv36, i64 %indvars.iv33, i64 %indvars.iv
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv36, i64 %indvars.iv33, i64 %indvars.iv
  store double %11, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = trunc i64 %indvars.iv.next to i32
  %15 = sub i32 %6, %14
  %16 = sitofp i32 %15 to double
  %17 = fmul double %16, 1.000000e+01
  %18 = fdiv double %17, 1.200000e+02
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv36, i64 %indvars.iv33, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv36, i64 %indvars.iv33, i64 %indvars.iv.next
  store double %18, double* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.preheader.us.us.new

._crit_edge24:                                    ; preds = %._crit_edge22.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader104

.preheader104:                                    ; preds = %._crit_edge115, %3
  %storemerge116 = phi i32 [ 1, %3 ], [ %164, %._crit_edge115 ]
  br label %.preheader102

.preheader102:                                    ; preds = %.preheader104, %._crit_edge107
  %indvar164 = phi i64 [ 0, %.preheader104 ], [ %indvar.next165, %._crit_edge107 ]
  %indvars.iv123 = phi i64 [ 1, %.preheader104 ], [ %indvars.iv.next124, %._crit_edge107 ]
  %4 = add i64 %indvar164, 1
  %5 = add i64 %indvar164, 2
  %6 = add nuw nsw i64 %indvars.iv123, 1
  %7 = add nsw i64 %indvars.iv123, -1
  br label %.preheader100.us

.preheader100.us:                                 ; preds = %.preheader102, %._crit_edge.us
  %indvar166 = phi i64 [ 0, %.preheader102 ], [ %indvar.next167, %._crit_edge.us ]
  %indvars.iv119 = phi i64 [ 1, %.preheader102 ], [ %indvars.iv.next120, %._crit_edge.us ]
  %8 = add i64 %indvar166, 1
  %scevgep168 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %4, i64 %8, i64 1
  %scevgep170 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %4, i64 %8, i64 119
  %scevgep172 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar164, i64 %8, i64 1
  %scevgep174 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %8, i64 119
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %9 = add nsw i64 %indvars.iv119, -1
  %bound0176 = icmp ult double* %scevgep168, %scevgep174
  %bound1177 = icmp ult double* %scevgep172, %scevgep170
  %memcheck.conflict179 = and i1 %bound0176, %bound1177
  br i1 %memcheck.conflict179, label %scalar.ph161.preheader, label %vector.body159.preheader

vector.body159.preheader:                         ; preds = %.preheader100.us
  br label %vector.body159

scalar.ph161.preheader:                           ; preds = %.preheader100.us
  br label %scalar.ph161

vector.body159:                                   ; preds = %vector.body159.preheader, %vector.body159
  %index182 = phi i64 [ %index.next183, %vector.body159 ], [ 0, %vector.body159.preheader ]
  %offset.idx186 = or i64 %index182, 1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %6, i64 %indvars.iv119, i64 %offset.idx186
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load190 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv123, i64 %indvars.iv119, i64 %offset.idx186
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load191 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fmul <2 x double> %wide.load191, <double 2.000000e+00, double 2.000000e+00>
  %15 = fsub <2 x double> %wide.load190, %14
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %7, i64 %indvars.iv119, i64 %offset.idx186
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load192 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %wide.load192, %15
  %19 = fmul <2 x double> %18, <double 1.250000e-01, double 1.250000e-01>
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv123, i64 %indvars.iv.next120, i64 %offset.idx186
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load193 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = bitcast double* %12 to <2 x double>*
  %wide.load194 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fmul <2 x double> %wide.load194, <double 2.000000e+00, double 2.000000e+00>
  %24 = fsub <2 x double> %wide.load193, %23
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv123, i64 %9, i64 %offset.idx186
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load195 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fadd <2 x double> %wide.load195, %24
  %28 = fmul <2 x double> %27, <double 1.250000e-01, double 1.250000e-01>
  %29 = fadd <2 x double> %19, %28
  %30 = add nuw nsw i64 %offset.idx186, 1
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv123, i64 %indvars.iv119, i64 %30
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load196 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = bitcast double* %12 to <2 x double>*
  %wide.load197 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fmul <2 x double> %wide.load197, <double 2.000000e+00, double 2.000000e+00>
  %35 = fsub <2 x double> %wide.load196, %34
  %36 = add nsw i64 %offset.idx186, -1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv123, i64 %indvars.iv119, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load198 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = fadd <2 x double> %wide.load198, %35
  %40 = fmul <2 x double> %39, <double 1.250000e-01, double 1.250000e-01>
  %41 = fadd <2 x double> %29, %40
  %42 = bitcast double* %12 to <2 x double>*
  %wide.load199 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !1
  %43 = fadd <2 x double> %wide.load199, %41
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv123, i64 %indvars.iv119, i64 %offset.idx186
  %45 = bitcast double* %44 to <2 x double>*
  store <2 x double> %43, <2 x double>* %45, align 8, !alias.scope !4, !noalias !1
  %index.next183 = add i64 %index182, 2
  %46 = icmp eq i64 %index.next183, 118
  br i1 %46, label %._crit_edge.us.loopexit201, label %vector.body159, !llvm.loop !6

scalar.ph161:                                     ; preds = %scalar.ph161.preheader, %scalar.ph161
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph161 ], [ 1, %scalar.ph161.preheader ]
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %6, i64 %indvars.iv119, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv123, i64 %indvars.iv119, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, 2.000000e+00
  %52 = fsub double %48, %51
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %7, i64 %indvars.iv119, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  %56 = fmul double %55, 1.250000e-01
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv123, i64 %indvars.iv.next120, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv123, i64 %indvars.iv119, i64 %indvars.iv
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, 2.000000e+00
  %62 = fsub double %58, %61
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv123, i64 %9, i64 %indvars.iv
  %64 = load double, double* %63, align 8
  %65 = fadd double %64, %62
  %66 = fmul double %65, 1.250000e-01
  %67 = fadd double %56, %66
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv123, i64 %indvars.iv119, i64 %indvars.iv.next
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv123, i64 %indvars.iv119, i64 %indvars.iv
  %71 = load double, double* %70, align 8
  %72 = fmul double %71, 2.000000e+00
  %73 = fsub double %69, %72
  %74 = add nsw i64 %indvars.iv, -1
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv123, i64 %indvars.iv119, i64 %74
  %76 = load double, double* %75, align 8
  %77 = fadd double %76, %73
  %78 = fmul double %77, 1.250000e-01
  %79 = fadd double %67, %78
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv123, i64 %indvars.iv119, i64 %indvars.iv
  %81 = load double, double* %80, align 8
  %82 = fadd double %81, %79
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv123, i64 %indvars.iv119, i64 %indvars.iv
  store double %82, double* %83, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph161, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph161
  br label %._crit_edge.us

._crit_edge.us.loopexit201:                       ; preds = %vector.body159
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit201, %._crit_edge.us.loopexit
  %exitcond122 = icmp eq i64 %indvars.iv.next120, 119
  %indvar.next167 = add i64 %indvar166, 1
  br i1 %exitcond122, label %._crit_edge107, label %.preheader100.us

._crit_edge107:                                   ; preds = %._crit_edge.us
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next124, 119
  %indvar.next165 = add i64 %indvar164, 1
  br i1 %exitcond126, label %.preheader101.preheader, label %.preheader102

.preheader101.preheader:                          ; preds = %._crit_edge107
  br label %.preheader101

.preheader101:                                    ; preds = %.preheader101.preheader, %._crit_edge113
  %indvar = phi i64 [ %indvar.next, %._crit_edge113 ], [ 0, %.preheader101.preheader ]
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %._crit_edge113 ], [ 1, %.preheader101.preheader ]
  %84 = add i64 %indvar, 1
  %85 = add i64 %indvar, 2
  %86 = add nuw nsw i64 %indvars.iv136, 1
  %87 = add nsw i64 %indvars.iv136, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader101, %._crit_edge111.us
  %indvar141 = phi i64 [ 0, %.preheader101 ], [ %indvar.next142, %._crit_edge111.us ]
  %indvars.iv132 = phi i64 [ 1, %.preheader101 ], [ %indvars.iv.next133, %._crit_edge111.us ]
  %88 = add i64 %indvar141, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %88, i64 1
  %scevgep144 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %88, i64 119
  %scevgep146 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %88, i64 1
  %scevgep148 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %85, i64 %88, i64 119
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %89 = add nsw i64 %indvars.iv132, -1
  %bound0 = icmp ult double* %scevgep, %scevgep148
  %bound1 = icmp ult double* %scevgep146, %scevgep144
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %86, i64 %indvars.iv132, i64 %offset.idx
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !10
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv136, i64 %indvars.iv132, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load150 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = fmul <2 x double> %wide.load150, <double 2.000000e+00, double 2.000000e+00>
  %95 = fsub <2 x double> %wide.load, %94
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %87, i64 %indvars.iv132, i64 %offset.idx
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = fadd <2 x double> %wide.load151, %95
  %99 = fmul <2 x double> %98, <double 1.250000e-01, double 1.250000e-01>
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv136, i64 %indvars.iv.next133, i64 %offset.idx
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = bitcast double* %92 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !10
  %103 = fmul <2 x double> %wide.load153, <double 2.000000e+00, double 2.000000e+00>
  %104 = fsub <2 x double> %wide.load152, %103
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv136, i64 %89, i64 %offset.idx
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load154 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !10
  %107 = fadd <2 x double> %wide.load154, %104
  %108 = fmul <2 x double> %107, <double 1.250000e-01, double 1.250000e-01>
  %109 = fadd <2 x double> %99, %108
  %110 = add nuw nsw i64 %offset.idx, 1
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv136, i64 %indvars.iv132, i64 %110
  %112 = bitcast double* %111 to <2 x double>*
  %wide.load155 = load <2 x double>, <2 x double>* %112, align 8, !alias.scope !10
  %113 = bitcast double* %92 to <2 x double>*
  %wide.load156 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !10
  %114 = fmul <2 x double> %wide.load156, <double 2.000000e+00, double 2.000000e+00>
  %115 = fsub <2 x double> %wide.load155, %114
  %116 = add nsw i64 %offset.idx, -1
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv136, i64 %indvars.iv132, i64 %116
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !10
  %119 = fadd <2 x double> %wide.load157, %115
  %120 = fmul <2 x double> %119, <double 1.250000e-01, double 1.250000e-01>
  %121 = fadd <2 x double> %109, %120
  %122 = bitcast double* %92 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !10
  %123 = fadd <2 x double> %wide.load158, %121
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv136, i64 %indvars.iv132, i64 %offset.idx
  %125 = bitcast double* %124 to <2 x double>*
  store <2 x double> %123, <2 x double>* %125, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %126 = icmp eq i64 %index.next, 118
  br i1 %126, label %._crit_edge111.us.loopexit200, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %86, i64 %indvars.iv132, i64 %indvars.iv128
  %128 = load double, double* %127, align 8
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv136, i64 %indvars.iv132, i64 %indvars.iv128
  %130 = load double, double* %129, align 8
  %131 = fmul double %130, 2.000000e+00
  %132 = fsub double %128, %131
  %133 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %87, i64 %indvars.iv132, i64 %indvars.iv128
  %134 = load double, double* %133, align 8
  %135 = fadd double %134, %132
  %136 = fmul double %135, 1.250000e-01
  %137 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv136, i64 %indvars.iv.next133, i64 %indvars.iv128
  %138 = load double, double* %137, align 8
  %139 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv136, i64 %indvars.iv132, i64 %indvars.iv128
  %140 = load double, double* %139, align 8
  %141 = fmul double %140, 2.000000e+00
  %142 = fsub double %138, %141
  %143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv136, i64 %89, i64 %indvars.iv128
  %144 = load double, double* %143, align 8
  %145 = fadd double %144, %142
  %146 = fmul double %145, 1.250000e-01
  %147 = fadd double %136, %146
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %148 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv136, i64 %indvars.iv132, i64 %indvars.iv.next129
  %149 = load double, double* %148, align 8
  %150 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv136, i64 %indvars.iv132, i64 %indvars.iv128
  %151 = load double, double* %150, align 8
  %152 = fmul double %151, 2.000000e+00
  %153 = fsub double %149, %152
  %154 = add nsw i64 %indvars.iv128, -1
  %155 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv136, i64 %indvars.iv132, i64 %154
  %156 = load double, double* %155, align 8
  %157 = fadd double %156, %153
  %158 = fmul double %157, 1.250000e-01
  %159 = fadd double %147, %158
  %160 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv136, i64 %indvars.iv132, i64 %indvars.iv128
  %161 = load double, double* %160, align 8
  %162 = fadd double %161, %159
  %163 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv136, i64 %indvars.iv132, i64 %indvars.iv128
  store double %162, double* %163, align 8
  %exitcond131 = icmp eq i64 %indvars.iv.next129, 119
  br i1 %exitcond131, label %._crit_edge111.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge111.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge111.us

._crit_edge111.us.loopexit200:                    ; preds = %vector.body
  br label %._crit_edge111.us

._crit_edge111.us:                                ; preds = %._crit_edge111.us.loopexit200, %._crit_edge111.us.loopexit
  %exitcond135 = icmp eq i64 %indvars.iv.next133, 119
  %indvar.next142 = add i64 %indvar141, 1
  br i1 %exitcond135, label %._crit_edge113, label %.preheader.us

._crit_edge113:                                   ; preds = %._crit_edge111.us
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %exitcond139 = icmp eq i64 %indvars.iv.next137, 119
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond139, label %._crit_edge115, label %.preheader101

._crit_edge115:                                   ; preds = %._crit_edge113
  %164 = add nuw nsw i32 %storemerge116, 1
  %exitcond140 = icmp eq i32 %164, 501
  br i1 %exitcond140, label %165, label %.preheader104

; <label>:165:                                    ; preds = %._crit_edge115
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
.preheader15.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader15.lr.ph, %._crit_edge18.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge18.us ], [ 0, %.preheader15.lr.ph ]
  %6 = mul nsw i64 %indvars.iv34, 120
  br label %.preheader.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 120
  br i1 %exitcond37, label %._crit_edge20, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv30 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next31, %._crit_edge.us.us ]
  %7 = add i64 %indvars.iv30, %6
  %8 = mul i64 %7, 120
  br label %9

._crit_edge.us.us:                                ; preds = %16
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, 120
  br i1 %exitcond33, label %._crit_edge18.us, label %.preheader.us.us

; <label>:9:                                      ; preds = %16, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %16 ], [ 0, %.preheader.us.us ]
  %10 = add i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge.us.us, label %9

._crit_edge20:                                    ; preds = %._crit_edge18.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
