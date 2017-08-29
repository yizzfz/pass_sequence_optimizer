; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  call fastcc void @init_array([1000 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %3 to [1000 x double]*
  %9 = bitcast i8* %4 to [1000 x double]*
  %10 = bitcast i8* %5 to [1000 x double]*
  %11 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @kernel_adi([1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10, [1000 x double]* %11)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %12 = icmp sgt i32 %0, 42
  br i1 %12, label %13, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:13:                                     ; preds = %2
  %14 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %14, align 1
  %15 = icmp eq i8 %strcmpload, 0
  br i1 %15, label %16, label %.._crit_edge_crit_edge16

.._crit_edge_crit_edge16:                         ; preds = %13
  br label %._crit_edge

; <label>:16:                                     ; preds = %13
  %17 = bitcast i8* %3 to [1000 x double]*
  call fastcc void @print_array([1000 x double]* %17)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge16, %.._crit_edge_crit_edge, %16
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv17 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next18, %._crit_edge.us..preheader.us_crit_edge ]
  %1 = add nsw i64 %indvars.iv17, 1000
  %2 = trunc i64 %1 to i32
  %3 = trunc i64 %1 to i32
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ]
  %4 = trunc i64 %indvars.iv to i32
  %5 = sub i32 %2, %4
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.000000e+03
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv
  store double %7, double* %8, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = trunc i64 %indvars.iv.next to i32
  %10 = sub i32 %3, %9
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.000000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv.next
  store double %12, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next18, 1000
  br i1 %exitcond, label %._crit_edge16, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge16:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader152.lr.ph:
  br label %.preheader152

.preheader152:                                    ; preds = %._crit_edge172..preheader152_crit_edge, %.preheader152.lr.ph
  %.0173 = phi i32 [ 1, %.preheader152.lr.ph ], [ %166, %._crit_edge172..preheader152_crit_edge ]
  br label %.lr.ph160

.lr.ph160:                                        ; preds = %._crit_edge157..lr.ph160_crit_edge, %.preheader152
  %indvar = phi i64 [ 0, %.preheader152 ], [ %indvar.next, %._crit_edge157..lr.ph160_crit_edge ]
  %indvars.iv177 = phi i64 [ 1, %.preheader152 ], [ %indvars.iv.next178, %._crit_edge157..lr.ph160_crit_edge ]
  %4 = add i64 %indvar, 1
  %5 = add i64 %indvar, 1
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv177
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv177, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv177
  %9 = bitcast double* %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv177
  %12 = bitcast [1000 x double]* %11 to i64*
  store i64 %10, i64* %12, align 8
  %scevgep203 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %scevgep201 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep199 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %13 = add nsw i64 %indvars.iv177, -1
  %14 = add nuw nsw i64 %indvars.iv177, 1
  %bound0 = icmp ult double* %scevgep, %scevgep203
  %bound1 = icmp ult double* %scevgep201, %scevgep199
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge196.lver.orig.preheader, label %._crit_edge196.ph

._crit_edge196.lver.orig.preheader:               ; preds = %.lr.ph160
  br label %._crit_edge196.lver.orig

._crit_edge196.lver.orig:                         ; preds = %._crit_edge196.lver.orig.._crit_edge196.lver.orig_crit_edge, %._crit_edge196.lver.orig.preheader
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge196.lver.orig.._crit_edge196.lver.orig_crit_edge ], [ 1, %._crit_edge196.lver.orig.preheader ]
  %15 = add nsw i64 %indvars.iv.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv177, i64 %15
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, 0xC09F400000000001
  %19 = fadd double %18, 0x40AF420000000001
  %20 = fdiv double 0x409F400000000001, %19
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv177, i64 %indvars.iv.lver.orig
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %13
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, 0xC08F400000000001
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv177
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, 0xC09F3C0000000001
  %28 = fsub double %27, %24
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %14
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, 0xC08F400000000001
  %32 = fsub double %28, %31
  %33 = add nsw i64 %indvars.iv.lver.orig, -1
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv177, i64 %33
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, 0xC09F400000000001
  %37 = fsub double %32, %36
  %38 = add nsw i64 %indvars.iv.lver.orig, -1
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv177, i64 %38
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, 0xC09F400000000001
  %42 = fadd double %41, 0x40AF420000000001
  %43 = fdiv double %37, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv177, i64 %indvars.iv.lver.orig
  store double %43, double* %44, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %._crit_edge.loopexit, label %._crit_edge196.lver.orig.._crit_edge196.lver.orig_crit_edge

._crit_edge196.lver.orig.._crit_edge196.lver.orig_crit_edge: ; preds = %._crit_edge196.lver.orig
  br label %._crit_edge196.lver.orig

._crit_edge196.ph:                                ; preds = %.lr.ph160
  %scevgep208 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %scevgep205 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %load_initial = load double, double* %scevgep205, align 8
  %load_initial209 = load double, double* %scevgep208, align 8
  br label %._crit_edge196

._crit_edge196:                                   ; preds = %._crit_edge196.._crit_edge196_crit_edge, %._crit_edge196.ph
  %store_forwarded210 = phi double [ %load_initial209, %._crit_edge196.ph ], [ %64, %._crit_edge196.._crit_edge196_crit_edge ]
  %store_forwarded207 = phi double [ %load_initial, %._crit_edge196.ph ], [ %47, %._crit_edge196.._crit_edge196_crit_edge ]
  %indvars.iv = phi i64 [ 1, %._crit_edge196.ph ], [ %indvars.iv.next, %._crit_edge196.._crit_edge196_crit_edge ]
  %45 = fmul double %store_forwarded207, 0xC09F400000000001
  %46 = fadd double %45, 0x40AF420000000001
  %47 = fdiv double 0x409F400000000001, %46
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv177, i64 %indvars.iv
  store double %47, double* %48, align 8
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %13
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, 0xC08F400000000001
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv177
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, 0xC09F3C0000000001
  %55 = fsub double %54, %51
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %14
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, 0xC08F400000000001
  %59 = fsub double %55, %58
  %60 = fmul double %store_forwarded210, 0xC09F400000000001
  %61 = fsub double %59, %60
  %62 = fmul double %store_forwarded207, 0xC09F400000000001
  %63 = fadd double %62, 0x40AF420000000001
  %64 = fdiv double %61, %63
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv177, i64 %indvars.iv
  store double %64, double* %65, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge.loopexit234, label %._crit_edge196.._crit_edge196_crit_edge

._crit_edge196.._crit_edge196_crit_edge:          ; preds = %._crit_edge196
  br label %._crit_edge196

._crit_edge.loopexit:                             ; preds = %._crit_edge196.lver.orig
  br label %._crit_edge

._crit_edge.loopexit234:                          ; preds = %._crit_edge196
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit234, %._crit_edge.loopexit
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv177
  store double 1.000000e+00, double* %66, align 8
  br label %.lr.ph156.new

.lr.ph156.new:                                    ; preds = %.lr.ph156.new..lr.ph156.new_crit_edge, %._crit_edge
  %indvars.iv175 = phi i64 [ %indvars.iv.next176.1, %.lr.ph156.new..lr.ph156.new_crit_edge ], [ 998, %._crit_edge ]
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv177, i64 %indvars.iv175
  %68 = load double, double* %67, align 8
  %69 = or i64 %indvars.iv175, 1
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %69, i64 %indvars.iv177
  %71 = load double, double* %70, align 8
  %72 = fmul double %68, %71
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv177, i64 %indvars.iv175
  %74 = load double, double* %73, align 8
  %75 = fadd double %72, %74
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv175, i64 %indvars.iv177
  store double %75, double* %76, align 8
  %indvars.iv.next176 = add nsw i64 %indvars.iv175, -1
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv177, i64 %indvars.iv.next176
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %75
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv177, i64 %indvars.iv.next176
  %81 = load double, double* %80, align 8
  %82 = fadd double %79, %81
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next176, i64 %indvars.iv177
  store double %82, double* %83, align 8
  %84 = icmp sgt i64 %indvars.iv.next176, 1
  %indvars.iv.next176.1 = add nsw i64 %indvars.iv175, -2
  br i1 %84, label %.lr.ph156.new..lr.ph156.new_crit_edge, label %._crit_edge157

.lr.ph156.new..lr.ph156.new_crit_edge:            ; preds = %.lr.ph156.new
  br label %.lr.ph156.new

._crit_edge157:                                   ; preds = %.lr.ph156.new
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %exitcond180 = icmp eq i64 %indvars.iv.next178, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond180, label %.lr.ph171.preheader, label %._crit_edge157..lr.ph160_crit_edge

._crit_edge157..lr.ph160_crit_edge:               ; preds = %._crit_edge157
  br label %.lr.ph160

.lr.ph171.preheader:                              ; preds = %._crit_edge157
  br label %.lr.ph171

.lr.ph171:                                        ; preds = %._crit_edge168..lr.ph171_crit_edge, %.lr.ph171.preheader
  %indvar211 = phi i64 [ %indvar.next212, %._crit_edge168..lr.ph171_crit_edge ], [ 0, %.lr.ph171.preheader ]
  %indvars.iv191 = phi i64 [ %indvars.iv.next192, %._crit_edge168..lr.ph171_crit_edge ], [ 1, %.lr.ph171.preheader ]
  %85 = add i64 %indvar211, 1
  %86 = add i64 %indvar211, 1
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv191, i64 0
  store double 1.000000e+00, double* %87, align 8
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv191, i64 0
  store double 0.000000e+00, double* %88, align 8
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv191, i64 0
  %90 = bitcast double* %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv191
  %93 = bitcast [1000 x double]* %92 to i64*
  store i64 %91, i64* %93, align 8
  %scevgep219 = getelementptr [1000 x double], [1000 x double]* %3, i64 %86, i64 999
  %scevgep217 = getelementptr [1000 x double], [1000 x double]* %3, i64 %86, i64 0
  %scevgep215 = getelementptr [1000 x double], [1000 x double]* %2, i64 %86, i64 999
  %scevgep213 = getelementptr [1000 x double], [1000 x double]* %2, i64 %86, i64 0
  %94 = add nsw i64 %indvars.iv191, -1
  %95 = add nuw nsw i64 %indvars.iv191, 1
  %bound0221 = icmp ult double* %scevgep213, %scevgep219
  %bound1222 = icmp ult double* %scevgep217, %scevgep215
  %memcheck.conflict224 = and i1 %bound0221, %bound1222
  br i1 %memcheck.conflict224, label %._crit_edge197.lver.orig.preheader, label %._crit_edge197.ph

._crit_edge197.lver.orig.preheader:               ; preds = %.lr.ph171
  br label %._crit_edge197.lver.orig

._crit_edge197.lver.orig:                         ; preds = %._crit_edge197.lver.orig.._crit_edge197.lver.orig_crit_edge, %._crit_edge197.lver.orig.preheader
  %indvars.iv181.lver.orig = phi i64 [ %indvars.iv.next182.lver.orig, %._crit_edge197.lver.orig.._crit_edge197.lver.orig_crit_edge ], [ 1, %._crit_edge197.lver.orig.preheader ]
  %96 = add nsw i64 %indvars.iv181.lver.orig, -1
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv191, i64 %96
  %98 = load double, double* %97, align 8
  %99 = fmul double %98, 0xC08F400000000001
  %100 = fadd double %99, 0x409F440000000001
  %101 = fdiv double 0x408F400000000001, %100
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv191, i64 %indvars.iv181.lver.orig
  store double %101, double* %102, align 8
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %94, i64 %indvars.iv181.lver.orig
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, 0xC09F400000000001
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv191, i64 %indvars.iv181.lver.orig
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, 0xC0AF3E0000000001
  %109 = fsub double %108, %105
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %95, i64 %indvars.iv181.lver.orig
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, 0xC09F400000000001
  %113 = fsub double %109, %112
  %114 = add nsw i64 %indvars.iv181.lver.orig, -1
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv191, i64 %114
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, 0xC08F400000000001
  %118 = fsub double %113, %117
  %119 = add nsw i64 %indvars.iv181.lver.orig, -1
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv191, i64 %119
  %121 = load double, double* %120, align 8
  %122 = fmul double %121, 0xC08F400000000001
  %123 = fadd double %122, 0x409F440000000001
  %124 = fdiv double %118, %123
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv191, i64 %indvars.iv181.lver.orig
  store double %124, double* %125, align 8
  %indvars.iv.next182.lver.orig = add nuw nsw i64 %indvars.iv181.lver.orig, 1
  %exitcond184.lver.orig = icmp eq i64 %indvars.iv.next182.lver.orig, 999
  br i1 %exitcond184.lver.orig, label %._crit_edge164.loopexit, label %._crit_edge197.lver.orig.._crit_edge197.lver.orig_crit_edge

._crit_edge197.lver.orig.._crit_edge197.lver.orig_crit_edge: ; preds = %._crit_edge197.lver.orig
  br label %._crit_edge197.lver.orig

._crit_edge197.ph:                                ; preds = %.lr.ph171
  %scevgep230 = getelementptr [1000 x double], [1000 x double]* %3, i64 %85, i64 0
  %scevgep225 = getelementptr [1000 x double], [1000 x double]* %2, i64 %85, i64 0
  %load_initial226 = load double, double* %scevgep225, align 8
  %load_initial231 = load double, double* %scevgep230, align 8
  br label %._crit_edge197

._crit_edge197:                                   ; preds = %._crit_edge197.._crit_edge197_crit_edge, %._crit_edge197.ph
  %store_forwarded232 = phi double [ %load_initial231, %._crit_edge197.ph ], [ %145, %._crit_edge197.._crit_edge197_crit_edge ]
  %store_forwarded229 = phi double [ %load_initial226, %._crit_edge197.ph ], [ %128, %._crit_edge197.._crit_edge197_crit_edge ]
  %indvars.iv181 = phi i64 [ 1, %._crit_edge197.ph ], [ %indvars.iv.next182, %._crit_edge197.._crit_edge197_crit_edge ]
  %126 = fmul double %store_forwarded229, 0xC08F400000000001
  %127 = fadd double %126, 0x409F440000000001
  %128 = fdiv double 0x408F400000000001, %127
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv191, i64 %indvars.iv181
  store double %128, double* %129, align 8
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %94, i64 %indvars.iv181
  %131 = load double, double* %130, align 8
  %132 = fmul double %131, 0xC09F400000000001
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv191, i64 %indvars.iv181
  %134 = load double, double* %133, align 8
  %135 = fmul double %134, 0xC0AF3E0000000001
  %136 = fsub double %135, %132
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %95, i64 %indvars.iv181
  %138 = load double, double* %137, align 8
  %139 = fmul double %138, 0xC09F400000000001
  %140 = fsub double %136, %139
  %141 = fmul double %store_forwarded232, 0xC08F400000000001
  %142 = fsub double %140, %141
  %143 = fmul double %store_forwarded229, 0xC08F400000000001
  %144 = fadd double %143, 0x409F440000000001
  %145 = fdiv double %142, %144
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv191, i64 %indvars.iv181
  store double %145, double* %146, align 8
  %indvars.iv.next182 = add nuw nsw i64 %indvars.iv181, 1
  %exitcond184 = icmp eq i64 %indvars.iv.next182, 999
  br i1 %exitcond184, label %._crit_edge164.loopexit233, label %._crit_edge197.._crit_edge197_crit_edge

._crit_edge197.._crit_edge197_crit_edge:          ; preds = %._crit_edge197
  br label %._crit_edge197

._crit_edge164.loopexit:                          ; preds = %._crit_edge197.lver.orig
  br label %._crit_edge164

._crit_edge164.loopexit233:                       ; preds = %._crit_edge197
  br label %._crit_edge164

._crit_edge164:                                   ; preds = %._crit_edge164.loopexit233, %._crit_edge164.loopexit
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv191, i64 999
  store double 1.000000e+00, double* %147, align 8
  br label %.lr.ph167.new

.lr.ph167.new:                                    ; preds = %.lr.ph167.new..lr.ph167.new_crit_edge, %._crit_edge164
  %indvars.iv185 = phi i64 [ %indvars.iv.next186.1, %.lr.ph167.new..lr.ph167.new_crit_edge ], [ 998, %._crit_edge164 ]
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv191, i64 %indvars.iv185
  %149 = load double, double* %148, align 8
  %150 = or i64 %indvars.iv185, 1
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv191, i64 %150
  %152 = load double, double* %151, align 8
  %153 = fmul double %149, %152
  %154 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv191, i64 %indvars.iv185
  %155 = load double, double* %154, align 8
  %156 = fadd double %153, %155
  %157 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv191, i64 %indvars.iv185
  store double %156, double* %157, align 8
  %indvars.iv.next186 = add nsw i64 %indvars.iv185, -1
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv191, i64 %indvars.iv.next186
  %159 = load double, double* %158, align 8
  %160 = fmul double %159, %156
  %161 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv191, i64 %indvars.iv.next186
  %162 = load double, double* %161, align 8
  %163 = fadd double %160, %162
  %164 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv191, i64 %indvars.iv.next186
  store double %163, double* %164, align 8
  %165 = icmp sgt i64 %indvars.iv.next186, 1
  %indvars.iv.next186.1 = add nsw i64 %indvars.iv185, -2
  br i1 %165, label %.lr.ph167.new..lr.ph167.new_crit_edge, label %._crit_edge168

.lr.ph167.new..lr.ph167.new_crit_edge:            ; preds = %.lr.ph167.new
  br label %.lr.ph167.new

._crit_edge168:                                   ; preds = %.lr.ph167.new
  %indvars.iv.next192 = add nuw nsw i64 %indvars.iv191, 1
  %exitcond194 = icmp eq i64 %indvars.iv.next192, 999
  %indvar.next212 = add i64 %indvar211, 1
  br i1 %exitcond194, label %._crit_edge172, label %._crit_edge168..lr.ph171_crit_edge

._crit_edge168..lr.ph171_crit_edge:               ; preds = %._crit_edge168
  br label %.lr.ph171

._crit_edge172:                                   ; preds = %._crit_edge168
  %exitcond195 = icmp eq i32 %.0173, 500
  %166 = add nuw nsw i32 %.0173, 1
  br i1 %exitcond195, label %._crit_edge174, label %._crit_edge172..preheader152_crit_edge

._crit_edge172..preheader152_crit_edge:           ; preds = %._crit_edge172
  br label %.preheader152

._crit_edge174:                                   ; preds = %._crit_edge172
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us..preheader.us_crit_edge ]
  %5 = mul nsw i64 %indvars.iv16, 1000
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge.._crit_edge20_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge20_crit_edge ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge20.._crit_edge_crit_edge

._crit_edge20.._crit_edge_crit_edge:              ; preds = %._crit_edge20
  br label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge20
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge20.._crit_edge_crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge20_crit_edge

._crit_edge.._crit_edge20_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge20

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond19, label %._crit_edge15, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
