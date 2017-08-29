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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
.preheader62.lr.ph:
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %._crit_edge88, %.preheader62.lr.ph
  %indvars.iv140 = phi i64 [ 0, %.preheader62.lr.ph ], [ %2, %._crit_edge88 ]
  %indvars.iv138 = phi i64 [ 1, %.preheader62.lr.ph ], [ %indvars.iv.next139, %._crit_edge88 ]
  %2 = add nuw nsw i64 %indvars.iv140, 1
  %3 = sub nsw i64 1998, %indvars.iv140
  %4 = shl i64 %3, 3
  %5 = and i64 %4, 34359738360
  br label %9

.preheader61:                                     ; preds = %9
  %6 = icmp slt i64 %2, 2000
  br i1 %6, label %.lr.ph87.preheader, label %._crit_edge88

.lr.ph87.preheader:                               ; preds = %.preheader61
  %7 = add nuw nsw i64 %5, 8
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %2
  %8 = mul nuw nsw i64 %indvars.iv140, 2000
  %scevgep136 = getelementptr double, double* %scevgep135, i64 %8
  %scevgep136137 = bitcast double* %scevgep136 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep136137, i8 0, i64 %7, i32 8, i1 false)
  br label %._crit_edge88

; <label>:9:                                      ; preds = %9, %.lr.ph84
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %9 ], [ 0, %.lr.ph84 ]
  %10 = sub nsw i64 0, %indvars.iv123
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv123
  store double %15, double* %16, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next124, %indvars.iv138
  br i1 %exitcond128, label %.preheader61, label %9

._crit_edge88:                                    ; preds = %.preheader61, %.lr.ph87.preheader
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv140
  store double 1.000000e+00, double* %17, align 8
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %exitcond143 = icmp eq i64 %2, 2000
  br i1 %exitcond143, label %.preheader60.us.prol.loopexit.._crit_edge81.us.3_crit_edge, label %.lr.ph84

.preheader60.us.prol.loopexit.._crit_edge81.us.3_crit_edge: ; preds = %._crit_edge88
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge81.us.3

.preheader57.us.us.preheader:                     ; preds = %.preheader57.us.us.preheader.preheader, %._crit_edge70.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge70.us ], [ 0, %.preheader57.us.us.preheader.preheader ]
  br label %.prol.loopexit101..preheader57.us.us.new_crit_edge

._crit_edge70.us:                                 ; preds = %._crit_edge68.us.us
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, 2000
  br i1 %exitcond111, label %.prol.loopexit..preheader.us.new_crit_edge.preheader, label %.preheader57.us.us.preheader

.prol.loopexit..preheader.us.new_crit_edge.preheader: ; preds = %._crit_edge70.us
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.prol.loopexit..preheader.us.new_crit_edge

.prol.loopexit101..preheader57.us.us.new_crit_edge: ; preds = %._crit_edge68.us.us, %.preheader57.us.us.preheader
  %indvars.iv104 = phi i64 [ 0, %.preheader57.us.us.preheader ], [ %indvars.iv.next105, %._crit_edge68.us.us ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv108
  br label %.preheader57.us.us.new

._crit_edge68.us.us:                              ; preds = %.preheader57.us.us.new
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 2000
  br i1 %exitcond107, label %._crit_edge70.us, label %.prol.loopexit101..preheader57.us.us.new_crit_edge

.preheader57.us.us.new:                           ; preds = %.preheader57.us.us.new, %.prol.loopexit101..preheader57.us.us.new_crit_edge
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.1, %.preheader57.us.us.new ], [ 0, %.prol.loopexit101..preheader57.us.us.new_crit_edge ]
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv108
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv104, i64 %indvars.iv96
  %26 = load double, double* %25, align 8
  %27 = fadd double %26, %24
  store double %27, double* %25, align 8
  %indvars.iv.next97 = or i64 %indvars.iv96, 1
  %28 = load double, double* %20, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next97, i64 %indvars.iv108
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next97
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %32, align 8
  %indvars.iv.next97.1 = add nuw nsw i64 %indvars.iv96, 2
  %exitcond99.1 = icmp eq i64 %indvars.iv.next97.1, 2000
  br i1 %exitcond99.1, label %._crit_edge68.us.us, label %.preheader57.us.us.new

.prol.loopexit..preheader.us.new_crit_edge:       ; preds = %.prol.loopexit..preheader.us.new_crit_edge.preheader, %._crit_edge.us
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge.us ], [ 0, %.prol.loopexit..preheader.us.new_crit_edge.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.prol.loopexit..preheader.us.new_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ 0, %.prol.loopexit..preheader.us.new_crit_edge ]
  %35 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv93, i64 %indvars.iv
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %40 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %46 = bitcast double* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %51 = bitcast double* %50 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond = icmp eq i64 %indvars.iv.next94, 2000
  br i1 %exitcond, label %._crit_edge65, label %.prol.loopexit..preheader.us.new_crit_edge

._crit_edge65:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %18) #4
  ret void

._crit_edge81.us.3:                               ; preds = %._crit_edge81.us.3, %.preheader60.us.prol.loopexit.._crit_edge81.us.3_crit_edge
  %indvars.iv116 = phi i64 [ 0, %.preheader60.us.prol.loopexit.._crit_edge81.us.3_crit_edge ], [ %indvars.iv.next117.3.1, %._crit_edge81.us.3 ]
  %55 = mul nuw nsw i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %55
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %56 = add nuw nsw i64 %55, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %56
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %57 = add nuw nsw i64 %55, 32000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %58 = add nuw nsw i64 %55, 48000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %58
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3 = or i64 %indvars.iv116, 4
  %59 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %scevgep.1146 = getelementptr i8, i8* %18, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1146, i8 0, i64 16000, i32 8, i1 false)
  %60 = add nuw nsw i64 %59, 16000
  %scevgep.1.1 = getelementptr i8, i8* %18, i64 %60
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %61 = add nuw nsw i64 %59, 32000
  %scevgep.2.1 = getelementptr i8, i8* %18, i64 %61
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %62 = add nuw nsw i64 %59, 48000
  %scevgep.3.1 = getelementptr i8, i8* %18, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3.1 = add nsw i64 %indvars.iv116, 8
  %exitcond119.3.1 = icmp eq i64 %indvars.iv.next117.3.1, 2000
  br i1 %exitcond119.3.1, label %.preheader57.us.us.preheader.preheader, label %._crit_edge81.us.3

.preheader57.us.us.preheader.preheader:           ; preds = %._crit_edge81.us.3
  %63 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader57.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #2 {
.preheader35.preheader:
  br label %.preheader35

.preheader35:                                     ; preds = %._crit_edge42, %.preheader35.preheader
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge42 ], [ 0, %.preheader35.preheader ]
  %2 = add nuw nsw i64 %indvars.iv80, 4294967295
  %3 = icmp sgt i64 %indvars.iv80, 0
  br i1 %3, label %.preheader33.preheader, label %._crit_edge42

.preheader33.preheader:                           ; preds = %.preheader35
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 0
  br label %.preheader33

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter6984 = and i64 %indvars.iv80, 1
  %5 = trunc i64 %2 to i32
  %6 = icmp eq i64 %xtraiter6984, 0
  %7 = icmp eq i32 %5, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge40.us, %.preheader.us.preheader
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge40.us ], [ %indvars.iv80, %.preheader.us.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv74
  %.pre50 = load double, double* %8, align 8
  br i1 %6, label %.prol.loopexit68, label %9

; <label>:9:                                      ; preds = %.preheader.us
  %10 = load double, double* %4, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv74
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %.pre50, %13
  store double %14, double* %8, align 8
  br label %.prol.loopexit68

.prol.loopexit68:                                 ; preds = %.preheader.us, %9
  %indvars.iv62.unr.ph = phi i64 [ 1, %9 ], [ 0, %.preheader.us ]
  %.unr71.ph = phi double [ %14, %9 ], [ %.pre50, %.preheader.us ]
  br i1 %7, label %._crit_edge40.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit68
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.1, %.preheader.us.new ], [ %indvars.iv62.unr.ph, %.preheader.us.new.preheader ]
  %15 = phi double [ %27, %.preheader.us.new ], [ %.unr71.ph, %.preheader.us.new.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv62
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv74
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %15, %20
  store double %21, double* %8, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv.next63
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next63, i64 %indvars.iv74
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %8, align 8
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62, 2
  %exitcond66.1 = icmp eq i64 %indvars.iv.next63.1, %indvars.iv80
  br i1 %exitcond66.1, label %._crit_edge40.us.loopexit, label %.preheader.us.new

._crit_edge40.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us.loopexit, %.prol.loopexit68
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, 2000
  br i1 %exitcond77, label %._crit_edge42.loopexit, label %.preheader.us

.preheader33:                                     ; preds = %._crit_edge, %.preheader33.preheader
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge ], [ 0, %.preheader33.preheader ]
  %28 = add nuw nsw i64 %indvars.iv56, 4294967295
  %29 = icmp sgt i64 %indvars.iv56, 0
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv56
  %.pre = load double, double* %30, align 8
  br i1 %29, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader33
  %xtraiter85 = and i64 %indvars.iv56, 1
  %lcmp.mod = icmp eq i64 %xtraiter85, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %31

; <label>:31:                                     ; preds = %.lr.ph
  %32 = load double, double* %4, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv56
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fsub double %.pre, %35
  store double %36, double* %30, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %31
  %indvars.iv.unr.ph = phi i64 [ 1, %31 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %36, %31 ], [ %.pre, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %36, %31 ], [ undef, %.lr.ph ]
  %37 = trunc i64 %28 to i32
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %39 = phi double [ %51, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv56
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fsub double %39, %44
  store double %45, double* %30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv.next
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv56
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fsub double %45, %50
  store double %51, double* %30, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv56
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader33
  %52 = phi double [ %.pre, %.preheader33 ], [ %.lcssa.unr.ph, %.prol.loopexit ], [ %51, %._crit_edge.loopexit ]
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv56
  %54 = load double, double* %53, align 8
  %55 = fdiv double %52, %54
  store double %55, double* %30, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, %indvars.iv80
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader33

._crit_edge42.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader35
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, 2000
  br i1 %exitcond83, label %._crit_edge46, label %.preheader35

._crit_edge46:                                    ; preds = %._crit_edge42
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv12, 2000
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %14

; <label>:14:                                     ; preds = %7, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond15, label %._crit_edge11, label %.preheader.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
